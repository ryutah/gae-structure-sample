.PHONY: all

project_id := ${PROJECT_ID}
version := ${GAE_VERSION}

help: ## Print this help
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

serve: ## ローカルサーバ実行
	goapp serve app

serve-docker: ## ローカルサーバをDockerコンテナで実行する
	$(eval src := $(shell pwd))
	@docker run --rm \
	  -it  \
	  -v ${src}:/work/src/github.com/ryutah/gae-structure-sample \
	  -p 8080:8080 \
	  -p 8000:8000 \
	  ryutah/gcloud-gaego \
	  dev_appserver.py --host 0.0.0.0 --admin_host 0.0.0.0 /work/src/github.com/ryutah/gae-structure-sample/app

deploy: ## gaeへデプロイ OPTIONS: project_id=${PROJECT_ID} version=${VERSION}
	goapp deploy -application ${project_id} -version ${version} app
