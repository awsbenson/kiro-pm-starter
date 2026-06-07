.PHONY: init plan apply destroy keys credentials urls

# Generate SSH keys (required before first deploy)
keys:
	@bash terraform/scripts/generate-key.sh

# Initialize Terraform
init: keys
	cd terraform && terraform init

# Preview changes
plan: init
	cd terraform && terraform plan

# Deploy all 8 PM environments
apply: init
	cd terraform && terraform apply -auto-approve

# Show access URLs
urls:
	@cd terraform && terraform output -json pm_urls | python3 -m json.tool

# Show full credentials (sensitive)
credentials:
	@cd terraform && terraform output -json pm_credentials | python3 -m json.tool

# Tear down all environments
destroy:
	cd terraform && terraform destroy -auto-approve

# Show status of instances
status:
	@aws ec2 describe-instances \
		--profile aai_benlai \
		--region ap-east-2 \
		--filters "Name=tag:Project,Values=trendai-pm" \
		--query "Reservations[].Instances[].{Name:Tags[?Key=='Name']|[0].Value,State:State.Name,IP:PublicIpAddress}" \
		--output table
