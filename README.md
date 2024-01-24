# https://github.com/nestybox/sysbox

Instalar.
https://github.com/nestybox/sysbox/blob/master/docs/user-guide/install-package.md

Move o Daemon
cp ./daemon.json /etc/docker/daemon.json

No site do GitHub.
https://github.com/<User>/<Repo>/settings/actions/runners/new
na parte Configure.
Pega a url que vai ser a url do repositório e token.
No docker-compose.yml coloque as informações do GitHub para colocar nas variáveis.

depois só rodar docker-compose up --build -d 
pronto, o docker com gitactions rodando e já podemos rodar o docker dentro desse docker
