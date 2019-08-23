#!/usr/bin/env bash
# The adhoc script to create service account, generate credential key and assign the required permission to provision GCP resourcer,

# Create Service Account for Terraform if none existed
if [[ $(gcloud iam service-accounts list | grep terransible | wc -l) -eq 0 ]]
then
    echo "Create Service Account"
    gcloud iam service-accounts create terransible --display-name "IaC account"

    # Generate a key for Service Accoun
    KEY_NUMS=$(gcloud iam service-accounts keys list --iam-account terransible@${PROJECT_ID}.iam.gserviceaccount.com | wc -l)
    if [[ $KEY_NUMS -lt 3 ]]
    then
        echo "Create a Service Account Key"
        gcloud iam service-accounts keys create $IAC_CREDS \
        --iam-account terransible@${PROJECT_ID}.iam.gserviceaccount.com
    else
        echo "Keys already existed"
    fi   
fi

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