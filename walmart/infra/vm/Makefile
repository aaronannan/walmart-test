
init:
	@terraform init -get=true \
		-backend-config "bucket=walmart-tfstate";

plan:
	set -e; \
	terraform plan \
		--out plan

apply:
	set -e; \
	test -e plan || (echo 'Run `make plan` before running `make apply`' && exit 1)
	terraform apply plan


destroy: check_environment clean init keys
	set -e; \
	terraform destroy \


.PHONY: clean init plan
