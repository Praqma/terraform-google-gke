# Docker image for circleci execution of Terraform

This docker image is based on alpine linux and contains: go, terraform, gcloud, bash among other tools.

To use the image, run the following command:

```
docker build -t praqma/terraform-gcloud .
export GCLOUD_CREDENTIALS=<the entire json credentials file content>
docker run --rm -it -e GCLOUD_CREDENTIALS praqma/terraform-gcloud /bin/sh
```
