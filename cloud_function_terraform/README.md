# Usage

```
$ export PROJECT_ID=<PROJECT_ID>
$ ./prepare_for_terraform.sh

$ terraform init -var project=$PROJECT_ID
$ terraform plan -var project=$PROJECT_ID
$ terraform apply -var project=$PROJECT_ID
```