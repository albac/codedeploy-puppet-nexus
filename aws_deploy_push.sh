#!/bin/bash
codedeploy_bucket="ipsy-codedeploy"

aws deploy push --application-name $1 --s3-location s3://$codedeploy_bucket/$1.zip --ignore-hidden-files
