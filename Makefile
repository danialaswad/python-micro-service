# You should most definitely run this from within a virtualenv/docker container, so you
# don't have library conflicts with other apps on the same system.
#

.DEFAULT_GOAL = run

SHELL:=/bin/bash

run: clean setup
	source venv/bin/activate;\
	cd app && python3 main.py;\

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
