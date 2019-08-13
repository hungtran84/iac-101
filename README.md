* Access to Cloud Shell
 ```
 https://github.com/wizeline/IaC-demo.git
 ```

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