# homelab
[![terraform](https://github.com/guyzsarun-lab/homelab/actions/workflows/terraform.yaml/badge.svg)](https://github.com/guyzsarun-lab/homelab/actions/workflows/terraform.yaml)

## Components
- [Kong](#kong-api-gateway) API Gateway

### Kong
Terraform is used for configuring Kong API Gateway. for Kong installation see [ansible-playbook](https://github.com/guyzsarun-lab/ansible).
#### Setup
Update the `kong_admin_url` variable and run the following commands.
```bash
cd kong
terraform init
terraform plan
```
#### Routes
Route for VMs and Kubernetes services are in the `kong/routes` directory. simply update the route file and run `terraform apply`.
#### Certificates
Certificates are stored in the `kong/certificates` directory. put the certificate and key file in the directory and run `terraform apply`.