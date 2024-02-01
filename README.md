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
1. [main.tf](Terraform-Project/main.tf.md)
 