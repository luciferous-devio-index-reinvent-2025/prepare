SHELL = /usr/bin/env bash -xeuo pipefail

deploy:
	sam deploy \
		--stack-name $$STACK_NAME \
		--template-file template.yml \
		--capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM \
		--no-fail-on-empty-changeset \
		--parameter-overrides BucketName=$$BUCKET_NAME OrganizationName=$$GITHUB_ORGANIZATION

describe:
	aws cloudformation describe-stacks \
		--stack-name $$STACK_NAME \
		--query Stacks[0].Outputs

.PHONY: \
	deploy \
	describe
