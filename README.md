AWS-CLI
=======

## EXAMPLE USAGE

S3 file upload

```
docker run -it -v `pwd`/a.zip:/a.zip -e AWS_ACCESS_KEY_ID=[KEY] -e AWS_SECRET_ACCESS_KEY=[KEY] skillbillsrl/aws-cli:latest aws s3 cp /a.zip s3://mso-deliverables/a.zip
```

