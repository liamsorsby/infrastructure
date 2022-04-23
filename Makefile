test:
	terraform fmt -check && terraform validate
init:
	terraform init
plan:
	terraform validate && terraform plan -var-file=secrets.tfvars
apply:
	terraform validate && terraform apply -var-file=secrets.tfvars -auto-approve
