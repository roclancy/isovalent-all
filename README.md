# isovalent-all
All in one config to create 2 AWS EKS clusters, Install Cilium, Hubble Relay, Hubble UI and Cluster Mesh


Pre-requisites Requirements

The below tools/accounts were used in the below installation example and needed


●	AWS Account
o	  You should have an AWS account where you can deploy an EKS cluster

●	AWS Command Line Interface (CLI) - 
o	  AWS CLI is a command-line tool provided by AWS that allows users to interact with various AWS services and resources from the command line. 

●	kubectl - https://formulae.brew.sh/formula/kubernetes-cli
o	  kubectl is a command-line tool used to interact with Kubernetes clusters

●	Cilium-CLI - https://formulae.brew.sh/formula/cilium-cli
o	  command-line tool used to install and interact isovalent components
o	Installation for a Mac are: brew install cilium-cli

●	Hubble-CLI - https://formulae.brew.sh/formula/hubble
o	 command-line tool used to install and interact isovalent components
o	 Installation for a Mac are: brew install hubble


---------------------------------

Step 1 – Git Clone this repo

Step 2 – Create Your Environment variables
Edit the env.sh file to create your environment variables as shown in the image below

<img width="468" height="101" alt="image" src="https://github.com/user-attachments/assets/5c738527-e9f5-4a8a-8d9a-18d516a1adee" />



