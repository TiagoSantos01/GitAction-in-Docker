#https://github.com/nestybox/sysbox?tab=readme-ov-file#installation

FROM nestybox/ubuntu-focal-systemd-docker:latest

RUN apt-get update && apt-get install -y xvfb
WORKDIR /actions-runner

RUN sudo useradd -ms /bin/bash runner
RUN usermod -aG sudo runner
RUN usermod -aG docker runner
RUN chown -R runner: /actions-runner/
RUN curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz
RUN echo "29fc8cf2dab4c195bb147384e7e2c94cfd4d4022c793b346a6175435265aa278  actions-runner-linux-x64-2.311.0.tar.gz" | sha256sum -c
RUN tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz
RUN mkdir /actions-runner/_diag
RUN chmod 777 /actions-runner/_diag

ARG GITHUB_TOKEN
ARG GITHUB_URL
ARG GITHUB_LABEL

WORKDIR /actions-runner
RUN ./bin/installdependencies.sh 
USER runner

WORKDIR /actions-runner
RUN ./config.sh --url ${GITHUB_URL} --token ${GITHUB_TOKEN} --labels ${GITHUB_LABEL}
COPY entrypoint.sh ./entrypoint.sh
USER root
RUN chmod +x ./entrypoint.sh
RUN echo 'ALL ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER runner
ENTRYPOINT ["/actions-runner/entrypoint.sh"]
