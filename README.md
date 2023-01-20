CLOUD-CICD-TOOLKIT
==================

- UBUNTU 20.04
- AWS CLI 2.9.1
- TERRAFORM 1.3.5
- PYENV
- PYTHON 3.8.7
- NODE v14.16.0
- GIT
- AZURE CLI 2.44.1


# DEPLOY

```bash
docker build . -t skillbillsrl/cloud-cicd-toolkit:latest
docker push skillbillsrl/cloud-cicd-toolkit:latest
```
# EXAMPLES

```bash
docker run -it -v `pwd`:/app -e AWS_ACCESS_KEY_ID=[ID] -e AWS_SECRET_ACCESS_KEY=[KEY] skillbillsrl/cloud-cicd-toolkit terraform apply
docker run -it -v `pwd`:/app skillbillsrl/cloud-cicd-toolkit aws --version
```
