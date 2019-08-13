#!/usr/bin/env bash
# The adhoc script to create service account, generate credential key and assign the required permission to provision GCP resource

export PROJECT_ID=$(gcloud config list --format 'value(core.project)' 2>/dev/null)
#export TF_BACKEND=$PROJECT_ID-tf-backend
export IAC_CREDS=~/.config/gcloud/account.json

# Create Service Account for Terraform
gcloud iam service-accounts create terransible \
  --display-name "IaC account"

gcloud iam service-accounts keys create $IAC_CREDS \
  --iam-account terransible@${PROJECT_ID}.iam.gserviceaccount.com

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member serviceAccount:terransible@${PROJECT_ID}.iam.gserviceaccount.com \
  --role roles/compute.instanceAdmin


# Enable GCP API required
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable compute.googleapis.com

# Create GCS as Terraform backend
#gsutil mb -p $PROJECT_ID gs://$TF_BACKEND
#gsutil versioning set on gs://$TF_BACKEND
#gsutil acl ch -u terraform@${PROJECT_ID}.iam.gserviceaccount.com:W gs://$TF_BACKEND


export GOOGLE_CREDENTIALS=${IAC_CREDS}
export GOOGLE_PROJECT=${PROJECT_ID}