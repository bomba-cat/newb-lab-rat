.PHONY: all venv install setup mats pack clean help activate

VENV := .venv
PYTHON := $(VENV)/bin/python
PIP := $(PYTHON) -m pip
BUILD_SCRIPT := ./build.sh

all: pack

venv:
	python3 -m venv $(VENV)

install: venv
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

setup:
	$(BUILD_SCRIPT) setup

mats:
	$(BUILD_SCRIPT) mats

pack:
	$(BUILD_SCRIPT) pack

clean:
	rm -rf build/
	rm -rf $(VENV)

activate:
	@echo "Run:"
	@echo "source $(VENV)/bin/activate"
	@echo "or source $(VENV)/bin/activate.fish if you are cool like me"

help:
	@echo "Targets:"
	@echo "  make venv     - create python virtualenv"
	@echo "  make install  - install python dependencies"
	@echo "  make setup    - download shader tools/materials"
	@echo "  make mats     - compile materials"
	@echo "  make pack     - build shader pack"
	@echo "  make clean    - remove build files + venv"
	@echo "  make activate - print venv activation command"
