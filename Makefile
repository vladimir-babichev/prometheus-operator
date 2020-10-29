ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
#APP_NAME := $(shell echo $(ROOT_DIR) | sed 's|.*/||; s|.*\(prometheus-operator\)|\1|')
APP_NAME := prometheus-stack

.PHONY: deploy
deploy:
	helm upgrade -i -f values.yaml $(APP_NAME) prometheus-community/kube-prometheus-stack

.PHONY: amconfig
amconfig:
	kubectl create secret generic alertmanager-prometheus-operator-kube-p-alertmanager --from-literal=alertmanager.yaml="$$(< alertmanager.yaml)" --dry-run -oyaml | kubectl replace secret --filename=-
