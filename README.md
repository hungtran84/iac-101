## Access to Cloud Shell

<p>
  <a target="__blank" href="https://console.cloud.google.com/cloudshell/open?cloudshell_git_repo=https://github.com/kanchimo/iac-101.git&amp;open_in_editor=README.md"><img src="https://storage.googleapis.com/gweb-cloudblog-publish/images/google_cloud_shell.max-300x300.png"/></a>
</p>


## Prepare your environment
```
./prepare.sh
```

## Terraform
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

## Ansible
* Install ansible
```
sudo echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt update
sudo apt-get install ansible
```

```
sudo pip3 install apache-libcloud
sudo pip3 install google-auth
```




