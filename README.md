# Usage 

## Setup your Google Cloud sevice account key

- In your Google cloud web console browse to `IAM & Admin -> Service accounts`
- Click on `CREATE SERVCIE ACCOUNT` and give it a name.
- Make sure you add the following roles to the service account:
   - Compute Instance Admin (v1)
   - Kubernetes Engine Admin
   - Service Account User
   - Storage Object Creator

## Terraform

`terraform init`

`terraform plan`

`terraform deploy`

## Destroying the cluster

`terraform destroy`

