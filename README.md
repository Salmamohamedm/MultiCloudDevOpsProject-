#    Multi-cloud-devops-project
  Comprehensive documentation for deploying a Java web app on OpenShift using Terraform, Ansible, Jenkins, and more.

  #    Overview
    
This project automates the deployment of a Java web application on an OpenShift cluster. The process involves infrastructure provisioning with Terraform, configuration with Ansible, and continuous integration continuous delivery with Jenkins.

Tools: Bash scripting, AWS,  Terraform, Ansible, Docker, Jenkins, SonarQube and OpenShift.
#     Table of Contents

 - Prerequisites
 - Infrastructure Provisioning with Terraform
 - Configuration Management with Ansible   
 - Jenkins Pipeline
 - OpenShift Deployment
 - Monitoring and Logging OpenShift Cluster

#   Prerequisites
- Before you begin, ensure you have the following tools installed
- Terraform
- Ansible
- AWS CLI
- OpenShift CLI "OC"
  
 #   Infrastructure Provisioning with Terraform
 This document provides comprehensive instructions for deploying infrastructure using Terraform. The project encompasses  modules: vpc, subnet, ec2, internetgetway, security group, route table . The objective is to establish an environment comprising network infrastructure with subnet, Internet Gateway, and route table an EC2 instance for running Jenkins and SonarQube, and CloudWatch for monitoring with alarms .
 #   overview 
1. [main.tf](Terraform-Project/main.tf)
   - Purpose: Define the cloud provider, Call terraform modules.
2. [variables.tf](Terraform-Project/main.tf)
    - Purpose: Set variables that need to be defined in terraform.tfvar file.
3.   [terraform.tfvars](Terraform-Project/terraform.tfvars)
     - Purpose: Define values for the needed variables.
4. [Remote/backand.tf](Terraform-Project/backend.tf)
    - Purpose: Store Terraform state remotely using S3
  
![Screenshot (483)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/2c8e8cc8-0cc3-42df-b7c8-7bd3ae675caf)

5. [VPC Module](Terraform-Project/modules/vpc)
    - Purpose: Provision a Virtual Private Cloud (VPC)
      
      ![Screenshot (393)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/8e78d5bc-31c4-4b10-951f-e0a36a27ee9c)
      ![Screenshot (394)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/e32ba505-1c5b-4b28-823a-93232a4a0ef0)
      ![Screenshot (399)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/17b6772a-dd13-4e98-a4d9-13a69f92b350)

      
 6. [internet-gateway Module](Terraform-Project/modules/internet-gateway)    
      
     ![Screenshot (395)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/cf35333d-3675-4ce3-b1b2-856dc85418d7)

 7.  [route-table Module](Terraform-Project/modules/route-table)

     ![Screenshot (392)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/ecad7f84-e799-4f0d-98b8-6075a7442ec9)

 8. [security-group Module ](Terraform-Project/modules/security-group)

    ![Screenshot (396)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/377b16f0-daa2-4b07-abf2-f75c1dff7b4f)

9. [Ec2 Module](Terraform-Project/modules/ec2-instances)
    ![Screenshot (499)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/f76403d5-a23f-4dfb-ba79-8a207f6f3fc1)

  

   ![Screenshot (493)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/7c229335-79bb-4934-9c20-4e96797c0fda)

10. [CloudWatch Module](Terraform-Project/modules)


  ![Screenshot (488)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/3b7ad4de-2359-4471-9d66-3145a959d6cb)

 
  ![Screenshot (490)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/64341d0e-b63d-4133-bd37-6ca17c365589)


#   Usage
1. Update values in [terraform.tfvars](Terraform-Project/terraform.tfvars)
2. Initialize plan and apply Terraform configurations:
 ```
 terraform init     
 terraform plan
 terraform apply
 ```
3 . Follow on-screen prompts to provision infrastructure
4. Destroy the infrastructure

  ``` 
  terraform destroy
  ```
  ![Screenshot (404)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/f1cb68fe-de91-4424-8591-365bb3ba0b6e)




#   Configuration Management with Ansible 
This Ansible playbook automates the deployment and configuration of Jenkins, SonarQube, and Docker on an EC2 instance. The playbook uses dynamic inventory for seamless integration with cloud environments.

#   Overview
  - [Jenkins Role:](ansible_project/Jenkins/tasks)
     - Installs and configures Jenkins for continuous integration and automation.
  - [SonarQube Role:](ansible_project/SonarQube/tasks)
      - Sets up SonarQube for code quality analysis.
  - [Docker Role:](ansible_project/docker/tasks)
       -  Installs and configures Docker for containerized deployments.

  - Dynamic Inventory
    The playbook utilizes dynamic inventory for automatic discovery of EC2 instances. This eliminates the need for manually maintaining inventory files. The ec2.py and ec2.ini files in 
    the inventory directory facilitate dynamic inventory management.
    
    #   Prerequisites
      - Ansible installed on the control machine.
      - AWS credentials configured for EC2 instance provisioning.
     #   usage

1.  To initialize a new Ansible role using ansible-galaxy        
```
ansible-galaxy init <role_name>
````
2.Navigate to the playbook directory
```
cd path/to/playbooks
```
3.Update the inventory file with your EC2 instance details

4. This command will generate a visual representation of the inventory structure based on the information in your AWS EC2 inventory file (aws_ec2.yaml)
 ```
ansible-inventory -i aws_ec2.yaml --graph
```
  ![,m](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/636fbba8-7fd4-43d9-a48d-434ea674cd80)



5. using SSH (Secure Shell) to connect to an Amazon EC2 (Elastic Compute Cloud) instance
```
ssh -i "your-key.pem" ec2-user@your-instance-ip
```
6.Execute the playbook
```
ansible-playbook -i inventory your_playbook.yml
```
![Screenshot (418)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/3e308517-2df8-4db4-8cb6-9d22ff0b0921)

7.Ensure EC2 instance is configured as expected


![Screenshot (496)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/40c2dfd6-b924-4f1d-a337-d98324945c3a)




![Screenshot (465)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/9c880287-dcff-4b2e-92db-2628301476fb)

#   Jenkins Pipeline
This document aims to provide a straightforward overview of how to use Ansible to automate the installation and configuration of Jenkins, SonarQube, and Docker on an EC2 instance. By following these steps, you can streamline the process of getting these tools up and running efficiently.

#   overview

  1. Create Shared Library Repository:
      - Create a Git repository for your Jenkins shared library.
   2. Define Shared Library Logic:
      - Inside the vars directory of your shared library, create a file (e.g., openshiftPipeline.groovy) with the logic for OpenShift deployment automation.
   3. Commit and Push:
       - Commit your changes and push them to the shared library reposit

![Screenshot (433)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/9050a467-ec31-4f8c-b1b0-18e4f67e2770)
![Screenshot (437)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/0bacdc66-3970-4004-aab8-7dc624b1e99b)
![Screenshot (443)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/66f88745-6ade-4cfc-9d15-b07c4b8eb96a)

5. configure SonarQube in Jenkins:
Navigate to "Manage Jenkins" > "Configure System."
In the "SonarQube Servers" section, add your SonarQube server details.
![Screenshot (498)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/55c53325-634d-4a60-b9ba-4b85edeed21d)



7. Add credntials
   ![Screenshot (447)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/ad03e1b5-f484-4921-b1d7-8f8737c599a8)
   ![Screenshot (445)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/b87dea9d-ca50-4178-872b-a107bc8e11e6)
   ![Screenshot (467)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/441e2408-a730-4f3f-9843-7208d53c3658)















#  OpenShift Deployment
the deployment of a Java web application on OpenShift, highlighting a streamlined process that covers essential aspects such as deployment configuration for seamless scalability, the creation of an internal service to foster communication within the cluster, implementation of network policies to bolster security, configuration of routes for external accessibility.


![Screenshot (494)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/f757ad2c-6b8b-4aaf-b9d1-8d4aa6604652)
![Screenshot (497)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/2c782887-d8bd-415b-b316-89aec7c1bd3e)


#  Monitoring and Logging OpenShift Cluster
This document introduces the Logging Operator, a Golang-based tool designed to streamline the orchestration of EFK (Elasticsearch, Fluentd, and Kibana) clusters in Kubernetes and OpenShift environments. The Logging Operator serves as an efficient manager for each component of the EFK stack, simplifying the deployment and maintenance processes in containerized environments.
#  Overview:
- Logging Operator.
- Written in Golang.
-  Purpose-built for orchestrating EFK clusters.
#  Use Cases:
- LogginIdeal for managing EFK clusters efficiently.
- Containerized Deployment.


 #  Prerequisites:
 - You have administrator permissions.
 - You have access to the OpenShift Container Platform web console.
#  Procedure:
 #  Navigate to OperatorHub:

  - Log in to the OpenShift Container Platform web console.
  - Click on "Operators" in the left sidebar, then select "OperatorHub."
 1.  Search for OpenShift Logging:

  - In the "Filter by keyword" box, type "OpenShift Logging."
 2. Choose and Install:

   - Select "Red Hat OpenShift Logging" from the list of available Operators.
   - Click the "Install" button.
  
 3. Configure Installation:

   - Ensure that "A specific namespace on the cluster" is selected under "Installation mode."
   - Set "Operator recommended namespace" to "openshift-logging."
   - Enable "Enable operator recommended cluster monitoring on this namespace."
   - This sets the openshift.io/cluster-monitoring: "true" label in the Namespace object.

  4.  Select Update Channel:

  - Choose "stable-5.y" as the Update channel.
  - Note: The stable channel provides updates to the most recent release.
    

  5. Choose Update Approval:
  - Select either "Automatic" or "Manual" for the Update approval strategy.
  - Automatic updates the Operator when a new version is available.
  - Manual requires manual approval for Operator updates.
 6. Console Plugin Configuration:
  - Choose to "Enable" or "Disable" the Console plugin.

7. Click Install:
 - Click the "Install" button to initiate the installation.
8. Verification:
9. Verify Installation:
  - Switch to the "Operators" → "Installed Operators" page.
  - In the Status column, confirm you see green checkmarks with "InstallSucceeded" and the text "Up to date."





#  steps 
 1. Step 1: Deploy Elasticsearch
  - Create a Project for Logging:
  ```
 oc new-project logging
  ```
  2. Deploy Elasticsearch:
  - Use an Elasticsearch Operator or deploy it directly. Here's an example using the Elasticsearch Operator:
   ``` 
    oc apply -f https://download.elastic.co/downloads/eck/1.7.1/all-in-one.yaml
   ```
  3. Check Elasticsearch Deployment Status:
   - Ensure the Elasticsearch pods are running successfully:
       
   ```
    oc get pods -n logging
   ```
  4. Step 3: Deploy Kibana for Visualization
    - Deploy Kibana:
   ```
    oc apply -f https://download.elastic.co/downloads/eck/1.7.1/kibana-all-in-one.yaml
   ```
  5. Access Kibana Dashboard:
   ```
   oc get route -n logging
   ```
  6. Step 4: Configure Fluentd to Forward Container Logs
   - update Fluentd ConfigMap:
   ```
    oc edit configmap/fluentd -n logging
   ```

     
