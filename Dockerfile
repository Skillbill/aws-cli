FROM ubuntu:20.04

#AWS CLI
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y curl unzip gnupg lsb-release software-properties-common

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

#TERRAFORM
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y 
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y terraform

#PYENV
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y  make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
RUN curl https://pyenv.run | bash

RUN echo "export PATH=\"$HOME/.pyenv/bin:$PATH\""  >> $HOME/.bashrc
RUN echo "eval \"\$(pyenv init -)\""  >> $HOME/.bashrc
RUN echo "eval \"\$(pyenv virtualenv-init -)\""  >> $HOME/.bashrc

RUN $HOME/.pyenv/bin/pyenv update
RUN $HOME/.pyenv/bin/pyenv install 3.8.7

#NODE
RUN wget https://nodejs.org/dist/v14.16.0/node-v14.16.0-linux-x64.tar.xz
RUN tar -xf node-v14.16.0-linux-x64.tar.xz
RUN echo "export PATH=\"/node-v14.16.0-linux-x64/bin:$PATH\""  >> $HOME/.bashrc
RUN export PATH="/node-v14.16.0-linux-x64/bin:$PATH" && /node-v14.16.0-linux-x64/bin/npm install -g npm@latest

WORKDIR /app