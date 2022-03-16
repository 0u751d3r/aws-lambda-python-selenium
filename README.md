# Selenium on AWS Lambda via Python using Headless Chrome
This project contains an easy-to-use template for running Selenium tests or automation on AWS Lambda.

It uses [Headless Chrome](https://github.com/adieuadieu/serverless-chrome) 
and [AWS SAM](https://aws.amazon.com/serverless/sam/).

# Why
##SAM
While other projects exist that cover a similar topic, those use npm, 
and the [Serverless Framework](https://www.serverless.com/).

My solution uses the [AWS Serverless Application Model](https://aws.amazon.com/serverless/sam/) (SAM),
which IMO has a lower barrier to entry if you already know CloudFormation.

## Compatibility
As many have already figured out on their own, Headless Chrome and Selenium only works on AWS Lambda
with very specific version combinations. Here is the one that worked for me and various others:
- Headless Chrome v1.0.0-55
- Chromedriver 2.43
- Selenium 3.14 (`python3 -m pip install selenium==3.14`)
- Python 3.6

The [shell script in layers/chromedriver](layers/chromedriver/download_binaries.sh) downloads the first two, 
Selenium is taken care of in [requirements.txt](lambda/requirements.txt), 
Python3.6 and AWS SAM you have to install yourself.   
(you have to install Python 3.6 locally as well to be able to build the Lambda function;
I will create a dockerfile for this later)

#Enough talk, get to action!
##1. Prerequisites
- [AWS SAM](https://aws.amazon.com/serverless/sam/#Install_SAM_CLI)
- [Python 3.6](https://www.python.org/downloads/release/python-3615/)

##2. Get chromedriver and headless chrome binaries
Run [layers/chromedriver/download_binaries.sh](layers/chromedriver/download_binaries.sh)

##3. Build the Lambda function
[`./build.sh`](build.sh)

##4. Deploy to AWS
Make sure you have your AWS Profile set, then run:  
[`deploy.sh your-stack-name your-function-name your-email-for-error-notification [s3-bucket [s3-prefix]]`](deploy.sh)

If you don't specify s3 parameters, SAM will attempt to create a managed bucket for you, 
if it has the privilege to do so.