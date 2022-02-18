#!/bin/bash
# Simple bash for Demoset C9 Deployment. 
# NOT FOR PRODUCTION USE - Only for Demoset purposes
C9STACK="DemosetC9"
PROFILE=$2
REGION=$1 

if ! [ -x "$(command -v aws)" ]; then
  echo 'Error: aws cli is not installed.' >&2
  exit 1
fi

if [ ! -z  "$PROFILE" ]; then
  export AWS_PROFILE=$PROFILE
fi

if [ ! -z "$REGION" ]; then
  export AWS_DEFAULT_REGION=$REGION
fi

echo Building $PROFILE C9

# build the c9 environment
aws cloudformation deploy  --stack-name $C9STACK --capabilities CAPABILITY_IAM --template ./cloud9-cfn.yaml

exit 0 