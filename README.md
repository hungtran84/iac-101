* Access to Cloud Shell

<p>
  <a target="__blank" href="https://console.cloud.google.com/cloudshell/open?cloudshell_git_repo=https://github.com/kanchimo/iac-101.git&amp"><img src="https://storage.googleapis.com/gweb-cloudblog-publish/images/google_cloud_shell.max-300x300.png"/></a>
</p>


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
