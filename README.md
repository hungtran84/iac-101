* Access to Cloud Shell
![enter image description here](https://storage.googleapis.com/gweb-cloudblog-publish/images/google_cloud_shell.max-300x300.png)

* Execute prepare.sh
```
chmod +x prepare.sh
./prepare.sh
```

* Initialize terraform
```
terraform init
```
* Validate terraform files
```
terraform fmt
```
* Preview and apply
```
terraform plan
terraform apply --auto-approve
```

* Decommissioning
```
terraform destroy --auto-approve
```
