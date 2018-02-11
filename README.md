###
# install, start, dashboard minikube
```sh
brew install minikube
minikube --bootstrapper=kubeadm --kubernetes-version=v1.8.5 start
minikube dashboard
```

###
# build, tag and push to dockerhub
```sh
docker build . -t php7-fpm
*note*: docker run -it php7-fpm sh
docker tag php7-fpm robkel/php7-fpm
docker push robkel/php7-fpm
```
###
# steps to create
```sh
kubectl create -f k8s/php7fpm-rc.yaml
kubectl create -f k8s/php7fpm-svc.yaml
#note: ssh into php7fpm container and create /public/index.php folder; kubectl get pods; kubectl exec -it php7-fpm-48wjd sh;
kubectl create configmap nginx-config --from-file=k8s/configmap-files
or
kubectl create -f k8s/nginx-config.yaml

kubectl create -f k8s/my-nginx.yaml
kubectl create -f k8s/nginx-svc.yaml
minikube service my-nginx
```
# ssh into nginx container
```sh
kubectl exec -it [pod name] -c my-nginx bash
kubectl exec -it [pod name] -c phpfpm sh
```
