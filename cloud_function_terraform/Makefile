TFPLAN = .tfplan

unit:
	conftest test -p test/unit/function.rego function.tf
	terraform validate
	terraform fmt

contract:
	terraform plan -out $(TFPLAN) -var-file=terraform.tfvars -var project=$PROJECT_ID
	terraform show -json $(TFPLAN) > $(TFPLAN).json
	conftest test -p test/contract/logic.rego $(TFPLAN).json