#!/bin/bash

gcloud config set project $PROJECT_ID
gcloud iam service-accounts create terraform --display-name="Terraform service account"
