# You should most definitely run this from within a virtualenv/docker container, so you
# don't have library conflicts with other apps on the same system.
#

.DEFAULT_GOAL = run
SHELL:=/bin/bash

docker-build:
	docker build -t python-micro-service/main:latest .

docker-start:
	docker-compose up -d

docker-stop:
	docker-compose down

docker-clean: docker-stop
	docker rmi python-micro-service/main

run: clean setup
	source venv/bin/activate;\
	python3 app.py;\

clean:
	find . -name '*.pyc' -delete; \
	find . -name '*.log' -delete
	rm -rf ~/.cache/pip

init:
	virtualenv venv;\
	source venv/bin/activate;\
	pip3 install requirements.txt;\

setup:
	source venv/bin/activate;\
	pip3 install -r requirements.txt;\
