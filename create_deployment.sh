#!/bin/bash

app_name=$1

aws deploy push --application-name $app_name --s3-location s3://ipsy-codedeploy/${app_name}.zip --ignore-hidden-files

aws deploy create-deployment --application-name $app_name --s3-location bucket=ipsy-codedeploy,key=${app_name}.zip,bundleType=zip --deployment-group-name ${app_name}-servers --deployment-config-name CodeDeployDefault.AllAtOnce --description "Deployment $app_name"
