### EKSへのログイン
```
$ docker-compose up -d
$ docker-compose exec k8 sh
# コンテナ内で
$ export CLUSTER_NAME=`aws eks list-clusters | jq -r .clusters[0]`
$ aws eks --region ap-northeast-1 update-kubeconfig --name $CLUSTER_NAME
```

### helmのデバッグ
- install時のデバッグ
```
$ docker-compose up -d
$ docker-compose exec k8 sh
# コンテナ内で
$ helm install --dry-run --debug --generate-name -f ./values.yaml -f ./myValue.yaml .
```

- upgrade時のデバッグ
```
$ helm upgrade --dry-run --debug -f ./values.yaml -f ./myValue.yaml myapp .
```

### helmのinstall
```
$ helm install -f ./values.yaml -f ./myValue.yaml myapp .
```

### helmのupgrade
```
$ helm upgrade -f ./values.yaml -f ./myValue.yaml myapp ./
```

### helmのlist表示
```
$ helm list
```
