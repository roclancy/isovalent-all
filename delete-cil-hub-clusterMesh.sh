
echo "REMOVING CLUSTERMESH"

#Remove Clustermesh
cilium clustermesh disable --context $CLUSTER1
cilium clustermesh disable --context $CLUSTER2

echo "  SLEEPING FOR 60 SECONDS"
sleep 60
#----------------------------

echo "REMOVING HUBBLE RELAY & UI"
echo "  YOU MAY GET AN ERROR MSG IF YOUR HUBBLE UI IS STILL OPEN AND PORT FORWARDING, JUST KILL THE BROWSER"
#remove  HUBBLE RELAY SERVER
cilium hubble disable --context $CLUSTER1
cilium hubble disable --context $CLUSTER2

echo "  SLEEPING FOR 60 SECONDS"
Sleep 60

#----------------------------
echo "REMOVING CILIUM"

#unINSTALL Cilium - if not already installed
cilium uninstall --context $CLUSTER1
cilium uninstall --context $CLUSTER2

echo "  SLEEPING FOR 60 SECONDS, NEXT EKS CLUSTER WILL BE DESTROYED"
sleep 60

