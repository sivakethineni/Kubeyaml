#!/bin/bash

export AWS_DEFAULT_REGION=ap-southeast-1
export EKS_CLUSTER_NAME=POC

#aws-eks connectivity script 

echo "--Verifing AWS CLI VERSION---"
aws --version

echo "--Verifing KUBECTL VERSION------"

kubectl version --client

echo "------------CONFIGURE USER(DEPLOYER)-------------"
aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY} 
aws configure set region ${AWS_DEFAULT_REGION}

echo "--------TEST CONNECTION-----------"

aws sts get-caller-identity
echo "-------------DIRECTORY----------------"

echo $PWD

aws eks --region ${AWS_DEFAULT_REGION} update-kubeconfig --name ${EKS_CLUSTER_NAME}


echo "--------TEST EKS_CLUSTER ${EKS_CLUSTER_NAME} CONFIGURATION-----------"

kubectl get svc

kubectl get nodes

kubectl get pods

kubectl apply -f deploy.yml

sleep 10

kubectl get deployment

rm -rf ~/.aws/*

rm -rf ~/.kube/*
