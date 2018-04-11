FROM python:3.4-alpine
COPY source/ /source

WORKDIR /source

RUN pip install -r requirements.txt

## CMDs to make a quick static website in S3 (IP Address needs to be changed after each docker-compose up...)
RUN   apk update \
    &&   apk add ca-certificates wget \
    &&   update-ca-certificates
CMD ["sh", "/source/run.sh"]