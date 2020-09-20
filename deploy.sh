#!/bin/bash

ACCOUNT=`aws sts get-caller-identity | jq -r .Account`
echo $ACCOUNT

docker image build -t eks-log-app ./app
docker tag eks-log-app $ACCOUNT.dkr.ecr.ap-northeast-1.amazonaws.com/repo_app:latest

# login
aws ecr get-login-password | docker login --username AWS --password-stdin https://$ACCOUNT.dkr.ecr.ap-northeast-1.amazonaws.com
docker push $ACCOUNT.dkr.ecr.ap-northeast-1.amazonaws.com/repo_app:latest
