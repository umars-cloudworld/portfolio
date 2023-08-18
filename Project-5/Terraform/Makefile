init-dev:
	@echo "\033[1;34m=============== Initialize Terraform Configurations of dev Environment  ==============\033[0m"
	@cd environment/dev && terraform init && tflint --init

fmt-dev:
	@echo "\033[1;34m=============== Validate Terraform Configurations of dev Environment  ==============\033[0m"
	@terraform fmt --recursive
	
validate-dev:
	@echo "\033[1;34m=============== Validate Terraform Configurations of dev Environment  ==============\033[0m"
	@cd environment/dev && terraform validate && tflint && terraform fmt --recursive

plan-dev:
	@echo "\033[1;34m=============== Plan Terraform Configurations of dev Environment  ==============\033[0m"
	@cd environment/dev && terraform plan --var-file dev.tfvars

apply-dev:
	@echo "\033[1;34m=============== Apply Terraform Configurations of dev Environment  ==============\033[0m"
	@cd environment/dev && terraform apply --var-file dev.tfvars --auto-approve

destroy-dev:
	@echo "\033[1;34m=============== Destroy Terraform Configurations of dev Environment ==============\033[0m"
	@cd environment/dev && terraform destroy --var-file dev.tfvars --auto-approve
	
