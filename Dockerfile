FROM ubuntu:latest

# Look into using https://hub.docker.com/r/adityai/dashboards/

# Setup the docker container to be functional
RUN apt-get update
RUN apt-get install -y software-properties-common vim
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN apt-get install -y git

RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

RUN apt-get install --yes wget

COPY source/ /source

WORKDIR /source

# Install app dependencies
RUN npm install
RUN pip install -r requirements.txt

## CMDs to make a quick static website in S3 (IP Address needs to be changed after each docker-compose up...)
#RUN  apk update \
#    &&   apk add ca-certificates wget \
#    &&   update-ca-certificates
CMD ["sh", "/source/run.sh"]