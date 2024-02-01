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

 7.   [route-table](Terraform-Project/modules/route-table)

      ![Screenshot (392)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/ecad7f84-e799-4f0d-98b8-6075a7442ec9)

 8.      


