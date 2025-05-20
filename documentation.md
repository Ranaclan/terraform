# [Terraform](#terraform)
- [Terraform](#terraform)
- [Installation/setup](#installationsetup)
- [Infrastructure as Code](#infrastructure-as-code)
  - [Terraform](#terraform-1)

# Installation/setup
1. Download terraform: https://developer.hashicorp.com/terraform/install
2. Move terraform.exe to 'C:\terraform'
3. Add this location to the PATH environment variable
4. Add HashiCorp's Terraform extension for VSCode https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform

# Infrastructure as Code
Two types:
* Orchestration: Managing infrastructure (Terraform, CloudFormation (AWS), ARM/Bicep templates (Azure), ~Ansible)
* Cofiguration management: Installing and configuring software (Ansible, Chef, Puppet)

## Terraform
* IaC orchestration tool
* Sees infrastructure as immutable
* Uses Hashicorp Configuration Language, declarative
* Cloud agnostic, uses providers which act as interface with cloud's API