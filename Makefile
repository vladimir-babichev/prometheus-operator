ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
APP_NAME := $(shell echo $(ROOT_DIR) | sed 's|.*/||; s|.*\(prometheus-operator\)|\1|')

.PHONY: install
install:
	helm install -f values.yaml $(APP_NAME) prometheus-community/kube-prometheus-stack

.PHONE: upgrade
upgrade:
	helm upgrade -f values.yaml $(APP_NAME) prometheus-community/kube-prometheus-stack
