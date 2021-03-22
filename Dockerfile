FROM ubuntu:20.04

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y curl unzip gnupg lsb-release software-properties-common

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install


RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y 
RUN DEBIAN_FRONTEND="noninteractive" apt-get install terraform

WORKDIR /app