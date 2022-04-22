CLOUD-CICD-TOOLKIT
==================

- UBUNTU 20.04
- AWS CLI
- TERRAFORM
- PYENV
- PYTHON 3.8.7
- NODE v14.16.0
- GIT


# DEPLOY

```bash
docker build . -t skillbillsrl/cloud-cicd-toolkit:latest
docker push skillbillsrl/cloud-cicd-toolkit:latest
```
# EXAMPLES

```bash
docker run -it -v `pwd`:/app -e AWS_ACCESS_KEY_ID=[ID] -e AWS_SECRET_ACCESS_KEY=[KEY] skillbillsrl/cloud-cicd-toolkit terraform apply
```
