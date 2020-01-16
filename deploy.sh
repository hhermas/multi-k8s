docker build -t hhermas/multi-client:latest -t hhermas/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t hhermas/multi-server:latest -t hhermas/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t hhermas/multi-worker:latest -t hhermas/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push hhermas/multi-client:latest
docker push hhermas/multi-server:latest
docker push hhermas/multi-worker:latest
docker push hhermas/multi-client:$SHA
docker push hhermas/multi-server:$SHA
docker push hhermas/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=hheras/multi-server:$SHA
kubectl set image deployments/client-deployment client=hheras/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=hheras/multi-worker:$SHA
