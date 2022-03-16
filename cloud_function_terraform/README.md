# Usage

```
cd gcp-labs
./scripts/prepare_for_terraform.sh

cd ./cloud_function_terraform
./cleanup.sh
terraform init -var project=$PROJECT_ID
terraform plan -var project=$PROJECT_ID
terraform apply -var project=$PROJECT_ID
```