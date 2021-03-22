AWS-TERRAFORM
=============

## EXAMPLE USAGE

S3 file upload

```
docker run -it -v `pwd`/a.zip:/a.zip -e AWS_ACCESS_KEY_ID=[KEY] -e AWS_SECRET_ACCESS_KEY=[KEY] skillbillsrl/aws-terraform:latest aws s3 cp /a.zip s3://mso-deliverables/a.zip
```


## DEPLOY

```
docker build . -t skillbillsrl/aws-terraform:latest
docker push skillbillsrl/aws-terraform:latest
```