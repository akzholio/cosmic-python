# Define variables for directories and tools
ALL_PACKAGES := src tests

.PHONY: install reformat check unit_tests all_tests

install:
	poetry install

reformat:
	poetry run isort $(ALL_PACKAGES)
	poetry run black $(ALL_PACKAGES)

check:
	poetry run isort --check --diff $(ALL_PACKAGES)
	poetry run black --check --diff $(ALL_PACKAGES)
	poetry run flake8 $(ALL_PACKAGES)

unit_tests:
	poetry run pytest

all_tests: unit_tests