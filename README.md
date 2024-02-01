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

 7.   [route-table Module](Terraform-Project/modules/route-table)

      ![Screenshot (392)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/ecad7f84-e799-4f0d-98b8-6075a7442ec9)

 8. [security-group Module ](Terraform-Project/modules/security-group)

    ![Screenshot (396)](https://github.com/Salmamohamedm/MultiCloudDevOpsProject-/assets/109488469/377b16f0-daa2-4b07-abf2-f75c1dff7b4f)

    9. [Ec2 Module](Terraform-Project/modules/ec2-instances)
  

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




