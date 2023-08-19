apply-backend:
	@echo "\033[1;34m===============  Create s3 that need to store backend of all environments ==============\033[0m"
	@cd backend/ && terraform init && terraform apply -auto-approve


validate-stage:
	@echo "\033[1;34m=============== Validate Terraform Configurations of Stage Environment  ==============\033[0m"
	@cd environment/stage && terraform init
	@cd environment/stage && terraform validate

plan-stage:
	@echo "\033[1;34m=============== Plan Terraform Configurations of Stage Environment  ==============\033[0m"
	@cd environment/stage && terraform init
	@cd environment/stage && terraform plan --var-file stage.tfvars

apply-stage:
	@echo "\033[1;34m=============== Apply Terraform Configurations of Stage Environment  ==============\033[0m"
	@cd environment/stage && terraform init
	@cd environment/stage && terraform apply --var-file stage.tfvars --auto-approve

validate-prod:
	@echo "\033[1;34m=============== Validate Terraform Configurations of Prod Environment  ==============\033[0m"
	@cd environment/prod && terraform init
	@cd environment/prod && terraform validate

plan-prod:
	@echo "\033[1;34m=============== Plan Terraform Configurations of Prod Environment  ==============\033[0m"
	@cd environment/prod && terraform init
	@cd environment/prod && terraform plan --var-file prod.tfvars

apply-prod:
	@echo "\033[1;34m=============== Apply Terraform Configurations of Prod Environment  ==============\033[0m"
	@cd environment/prod && terraform init
	@cd environment/prod && terraform apply --var-file prod.tfvars --auto-approve



destroy-backend:
	@echo "\033[1;34m===============  Destroy S3 Backend where terraform state file is stored for all environments ==============\033[0m"
	@cd backend/ && terraform destroy -auto-approve

destroy-stage:
	@echo "\033[1;34m=============== Destroy Terraform Configurations of Stage Environment ==============\033[0m"
	@cd environment/stage && terraform destroy --var-file stage.tfvars --auto-approve
	
destroy-prod:
	@echo "\033[1;34m=============== Destroy Terraform Configurations of Prod Environment  ==============\033[0m"
	@cd environment/prod && terraform destroy --var-file prod.tfvars --auto-approve

outputs-stage:
	@echo "\033[1;34m=============== Outputs Terraform Configurations of stage Environment  ==============\033[0m"
	@cd environment/stage && terraform output -json

outputs-prod:
	@echo "\033[1;34m=============== Outputs Terraform Configurations of Prod Environment  ==============\033[0m"
	@cd environment/prod && terraform output -json
destroy: 
	@echo "\033[1;34m=============== Destroy Backend and Both Environments==============\033[0m"
	@cd environment/stage && terraform destroy --var-file stage.tfvars --auto-approve
	@cd environment/prod && terraform destroy --var-file prod.tfvars --auto-approve
	@cd backend/ && terraform destroy --auto-approve