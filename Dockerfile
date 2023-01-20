FROM ubuntu:20.04

#PACKAGES
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y --fix-missing
RUN DEBIAN_FRONTEND="noninteractive" apt-get upgrade -y --fix-missing
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y curl unzip gnupg lsb-release software-properties-common \
make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git \
zip libpq-dev mandoc groff

#AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

#TERRAFORM
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y 
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y terraform=1.3.5

#PYTHON
RUN apt-add-repository ppa:deadsnakes/ppa
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y 
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y python3.9
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y python3-pip
RUN ln -s /usr/bin/python3.9 /usr/bin/python
RUN pip install pip==21.0.1

#NODE
RUN wget https://nodejs.org/dist/v14.16.0/node-v14.16.0-linux-x64.tar.xz
RUN tar -xf node-v14.16.0-linux-x64.tar.xz
RUN ln -s /node-v14.16.0-linux-x64/bin/node /bin/node
RUN ln -s /node-v14.16.0-linux-x64/bin/npm /bin/npm
RUN npm install -g npm@latest

#AZURE CLI
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y 
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y ca-certificates apt-transport-https lsb-release gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/keyrings/microsoft.gpg > /dev/null
RUN chmod go+r /etc/apt/keyrings/microsoft.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ focal main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y 
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y azure-cli


WORKDIR /app