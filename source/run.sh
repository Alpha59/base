#!/usr/local/env sh

echo "Waiting for host Again..."
wget http://dockerhost:4572

echo "Creating Bucket"
awslocal s3api --endpoint-url=http://dockerhost:4572 create-bucket --bucket html
echo "Bucket Created"

echo "Setting website configuration"
awslocal s3api --endpoint-url=http://dockerhost:4572 put-bucket-website --bucket html --website-configuration file://./website.json
echo "Website configuration completed"

echo "Uploading files"
awslocal s3 --endpoint-url=http://dockerhost:4572 sync --acl public-read html/ s3://html
echo "Files successfully uploaded"

rerun --verbose "awslocal s3 --endpoint-url=http://dockerhost:4572 sync --acl public-read html/ s3://html"

#python app.py
