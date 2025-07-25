
#SET ENV'S

echo "INSTALLING CILIUM"

#INSTALL Cilium - if not already installed
cilium install --set cluster.name=$CILIUM_NAME1 --set cluster.id=1 --context $CLUSTER1 --set bgpControlPlane.enabled=true
cilium install --set cluster.name=$CILIUM_NAME2 --set cluster.id=2 --context $CLUSTER2 --set bgpControlPlane.enabled=true

echo "  SLEEPING FOR 120 SECONDS" 
sleep 120

echo "INSTALLING HUBBLE RELAY SERVER"

#INSTALL HUBBLE RELAY SERVER
cilium hubble enable --context $CLUSTER1
cilium hubble enable --context $CLUSTER2

echo "  SLEEPING FOR 30 SECONDS"
sleep 30

echo "INSTALLING HUBBLE UI"

#install Hubble UI
cilium hubble enable --ui --context $CLUSTER1
cilium hubble enable --ui --context $CLUSTER2

echo "  SLEEPING FOR 60 SECONDS"
sleep 60


echo "SETTING UP CA CERT BETWEEN HUBBLE RELAY SERVERS"

#SET UP
#If you are planning to run Hubble Relay across clusters, it is best to share a certificate authority (CA) between the clusters as it will enable mTLS across clusters to just work
#You can propagate the CA copying the Kubernetes secret containing the CA from one cluster to another

kubectl --context=$CLUSTER2 delete secret -n kube-system cilium-ca
kubectl --context=$CLUSTER1 get secret -n kube-system cilium-ca -o yaml | \
kubectl --context $CLUSTER2 create -f -

echo "  SLEEPING FOR 20 SECONDS"
sleep 20

echo "INSTALLING CLUSTER MESH"

#Install - cluster Mesh
cilium clustermesh enable --context $CLUSTER1
cilium clustermesh enable --context $CLUSTER2

echo "  SLEEPING FOR 90 SECONDS"
sleep 90

echo "CLUSTER MESH CONNECTING CLUSTERS" 

#CONNECT CLUSTERS TO EACH OTHER (ONLY ONE SIDE NEEDS TO BE SET UP)
cilium clustermesh connect --context $CLUSTER1 --destination-context $CLUSTER2

echo "  SLEEPING FOR 10 SECONDS"
sleep 10

echo "LAUNCHING HUBBLE UI"
cilium hubble ui &


#--------
#echo "CHECKING STATUS OF CLUSTER MESH"

#See status of cluster mesh

#cilium clustermesh status --context $CLUSTER1 --wait

#sleep 15

#cilium clustermesh status --context $CLUSTER2 --wait

echo " "
echo " "
echo "COMPLETE AND FINISHED"
#echo " cilium hubble ui &"
echo " "

