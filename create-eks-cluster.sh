
#STEP 1


echo "CREATING THE 1ST EKS CLUSTER"

#DO NOT CHANGE BELOW
eksctl create cluster --name $EKS_CREATE_CLUSTER1 --without-nodegroup

eksctl create nodegroup \
  --cluster $EKS_CREATE_CLUSTER1 \
  --region $EKS_CREATE_REGION \
  --name $EKS_CREATE_NODE_GRP \
  --node-ami-family  Ubuntu2204\
  --node-type m5.2xlarge \
  --nodes 3 \
  --nodes-min 2 \
  --nodes-max 5 \
  --ssh-access \
  --ssh-public-key $EKS_EC2_KEY

echo "  SLEEPING FOR 20 SECONDS"
sleep 20

export CLUSTER1=$(kubectl config current-context)

echo "CREATING 2ND EKS CLUSTER"

#create a 2nd eks cluster
eksctl create cluster --name $EKS_CREATE_CLUSTER2 --without-nodegroup

eksctl create nodegroup \
  --cluster $EKS_CREATE_CLUSTER2 \
  --region $EKS_CREATE_REGION \
  --name $EKS_CREATE_NODE_GRP \
  --node-ami-family  Ubuntu2204\
  --node-type m5.2xlarge \
  --nodes 3 \
  --nodes-min 2 \
  --nodes-max 5 \
  --ssh-access \
  --ssh-public-key $EKS_EC2_KEY


export CLUSTER2=$(kubectl config current-context)

echo "  SLEEPING FOR 30 SECONDS, NEXT CILIUM WILL BE INSTALLED"
sleep 30
