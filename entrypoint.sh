#!/bin/bash

# Verifica o status do serviço Docker
echo "Iniciando Docker"
sudo service docker start
echo "Iniciando GitActions"
./run.sh
echo "Finalizando Script"
