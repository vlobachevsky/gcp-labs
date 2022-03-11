#!/bin/bash

gcloud config set project $PROJECT_ID
gcloud iam service-accounts create terraform --display-name="Terraform service account"
gcloud iam service-accounts keys create ~/terraform-key.json --iam-account=terraform@$PROJECT_ID.iam.gserviceaccount.com

# Create bucket to keep Terraform state
gsutil mb gs://$PROJECT_ID-tfstate