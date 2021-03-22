FROM ubuntu:20.04

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y curl unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
