### EKSへのログイン
```
$ docker-compose up -d
$ docker-compose exec k8 sh
# コンテナ内で
$ aws eks --region ap-northeast-1 update-kubeconfig --name $CLUSTER_NAME
```
