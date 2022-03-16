#!/bin/bash

if [ $# -lt 3 ] || [ $# -gt 5 ]; then
    echo "Usage: $0 <stack_name> <function_name> <error_email> [<s3_bucket> <s3_prefix>]"
    echo "If s3 bucket is not specified, SAM will create one if it has the privilege to do so"
    exit 1
fi

if [[ -z "${AWS_PROFILE}" ]] && [[ -z "${AWS_SECRET_ACCESS_KEY}" ]]; then
    echo "AWS_PROFILE or access key environment variables are not set!"
    exit 1
fi

STACK_NAME=$1
FUNCTION_NAME=$2
ERROR_EMAIL=$3
S3_PARAM="--resolve-s3"
[ $# -ge 4 ] && S3_PARAM="--s3-bucket $4"
[ $# -ge 5 ] && S3_PARAM="${S3_PARAM} --s3-prefix $5"

sam deploy --template-file "build/template.yaml" \
           --stack-name "${STACK_NAME}" \
           --capabilities CAPABILITY_IAM \
           --no-fail-on-empty-changeset \
           ${S3_PARAM} \
           --parameter-overrides "ParameterKey=FunctionName,ParameterValue=${FUNCTION_NAME} \
                                  ParameterKey=ErrorEmail,ParameterValue=${ERROR_EMAIL}"