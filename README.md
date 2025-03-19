# homelab

## Components
- [Kong](#kong-api-gateway) API Gateway

### Kong

Terraform is used for configuring Kong API Gateway. for Kong installation see [ansible-playbook](https://github.com/guyzsarun-lab/ansible).
#### Routes
Route for VMs and Kubernetes services are in the `kong/routes` directory. simply update the route file and run `terraform apply`.
#### Certificates
Certificates are stored in the `kong/certificates` directory. put the certificate and key file in the directory and run `terraform apply`.