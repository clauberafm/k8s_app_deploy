#!/bin/bash

echo "Creating images..."

docker build -t cacaumelus/projeto-backend:1.0 backend/.
docker build -t cacaumelus/projeto-database:1.0 database/.

echo "Executing images pushing..."

docker push cacaumelus/projeto-backend:1.0
docker push cacaumelus/projeto-database:1.0

echo "Creating cluster services..."

kubectl apply -f ./services.yml

echo "Creating deployments..."

kubectl apply -f ./deployment.yml

