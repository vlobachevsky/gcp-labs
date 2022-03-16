#!/bin/bash

gcloud auth revoke
gcloud auth login
gcloud auth application-default login
#gcloud auth login
gcloud config set project $PROJECT_ID

# Enable required APIs
gcloud services enable cloudfunctions.googleapis.com 
gcloud services enable cloudbuild.googleapis.com

# Clean up
# gcloud iam service-accounts delete terraform@$PROJECT_ID.iam.gserviceaccount.com
# gsutil rb -f gs://$PROJECT_ID-tfstate


# gcloud iam service-accounts create terraform --display-name="Terraform service account"
# gcloud iam service-accounts keys create ~/terraform-key.json --iam-account=terraform@$PROJECT_ID.iam.gserviceaccount.com

# Create bucket to keep Terraform state
# gsutil mb gs://$PROJECT_ID-tfstate
# gsutil iam ch serviceAccount:terraform@$PROJECT_ID.iam.gserviceaccount.com:roles/storage.admin gs://$PROJECT_ID-tfstate