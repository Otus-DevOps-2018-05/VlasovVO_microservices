cnf ?= .make_env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

.DEFAULT_GOAL := build-all

build-all: build-prometheus build-mongodb_exporter build-comment build-ui build-post build-cloudprober build-alertmanager

build-cloudprober:
	cd $(REPO)/monitoring/cloudprober && docker build -t $(USER)/cloudprober:latest .

build-prometheus:
	cd $(REPO)/monitoring/prometheus && docker build -t $(USER)/prometheus .

build-mongodb_exporter:
	cd $(REPO)/monitoring/mongodb_exporter && docker build -t $(USER)/mongodb_exporter:latest .

build-comment:
	cd $(REPO)/src/comment && bash docker_build.sh

build-ui:
	cd $(REPO)/src/ui && bash docker_build.sh

build-post:
	cd $(REPO)/src/post-py && bash docker_build.sh

build-alertmanager:
	cd $(REPO)/monitoring/alertmanager && docker build -t $(USER)/alertmanager:latest .

push-all: push-prometheus push-mongodb_exporter push-comment push-ui push-post push-cloudprober

push-cloudprober:
	echo $(D_HUB_PASS) | docker login -u $(USER) --password-stdin && docker push $(USER)/cloudprober:latest

push-prometheus:
	echo $(D_HUB_PASS) | docker login -u $(USER) --password-stdin && docker push $(USER)/prometheus

push-mongodb_exporter:
	echo $(D_HUB_PASS) | docker login -u $(USER) --password-stdin && docker push $(USER)/mongodb_exporter:latest

push-comment:
	echo $(D_HUB_PASS) | docker login -u $(USER) --password-stdin && docker push $(USER)/comment

push-ui:
	echo $(D_HUB_PASS) | docker login -u $(USER) --password-stdin && docker push $(USER)/ui

push-post:
	echo $(D_HUB_PASS) | docker login -u $(USER) --password-stdin && docker push $(USER)/post

push-alertmanager:
	echo $(D_HUB_PASS) | docker login -u $(USER) --password-stdin && docker push $(USER)/alertmanager
