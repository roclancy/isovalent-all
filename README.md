# Isovalent EKS all in one script
Tested using - MAC OS

All in one script to create 2 AWS EKS clusters, Install Cilium, Hubble Relay, Hubble UI and Cluster Mesh on the 2 newly created EKS Clusters, and also configure metrics, grafana and the grafana isovalent example dashboards

Prerequisites Requirements
---------------------------

The below tools/accounts were used in the below installation example and are needed


- AWS Account
  - You should have an AWS account where you can deploy an EKS cluster & IAM user with AWS access key & Secret Key

- AWS Command Line Interface (CLI) - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
  - AWS CLI is a command-line tool provided by AWS that allows users to interact with various AWS services and resources from the command line. 

- kubectl - https://formulae.brew.sh/formula/kubernetes-cli
  - kubectl is a command-line tool used to interact with Kubernetes clusters

- Cilium-CLI - https://formulae.brew.sh/formula/cilium-cli
  - command-line tool used to install and interact isovalent components
  - Installation for a Mac are: brew install cilium-cli

- Hubble-CLI - https://formulae.brew.sh/formula/hubble
  - command-line tool used to install and interact isovalent components
  - Installation for a Mac are: brew install hubble


Step 1 – Git Clone this repo
-----------------------------

Step 2 – Create Your Environment variables
------------------------------------------
Edit the _**env.sh**_ file to create your environment variables as shown in the image below

<img width="468" height="101" alt="image" src="https://github.com/user-attachments/assets/5427e4d9-4ff7-4c29-baac-a8eaac771563" />

<img width="468" height="162" alt="image" src="https://github.com/user-attachments/assets/3513ab73-dbb6-4231-b7d6-85cd55ece301" />

Step 3 – Create All
-------------------
Run the command below in the directory you cloned this repo to:

_**source create-ALL.sh**_

The script will start by creating

- 2 x EKS clusters
- Install Cilium
- Install Hubble relay
- Install Hubble ui
- Install Cilium Cluster Mesh
- Launch the hubble ui at the end on your local machine (uisng port forwarding in the background) see image below of output

<img width="468" height="119" alt="image" src="https://github.com/user-attachments/assets/808709a5-af60-4701-90e4-51eba5ea3f08" />

<img width="468" height="307" alt="image" src="https://github.com/user-attachments/assets/54e45a45-7591-4891-9b04-7cf29e592892" />

Step 4 – Delete All
-------------------
Run the command to execute the script to delete all 

_**source delete-ALL.sh**_

<img width="468" height="327" alt="image" src="https://github.com/user-attachments/assets/bf8ae242-1206-43ce-860d-375c14303633" />












