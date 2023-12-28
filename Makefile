# ************************************************
# ********** pip-tools **********
# ************************************************

.PHONY: lock  # pin prod dependencies
lock:
	python -m piptools compile -o requirements/main.txt


.PHONY: lock.dev  # pin dev dependencies
lock.dev:
	python -m piptools compile --extra dev -o requirements/dev.txt


.PHONY: lock.all  # pin all dependencies
lock.all: lock lock.dev


.PHONY: sync  # sync for prod dependencies
sync:
	python -m piptools sync requirements/main.txt


.PHONY: sync.dev  # sync for dev dependencies
sync.dev:
	python -m piptools sync requirements/dev.txt


.PHONY: update  # pin and sync for prod dependencies
update: lock sync


.PHONY: update.dev  # pin and sync for dev dependencies
update.dev: lock.dev sync.dev


.PHONY: update.all  # pin and sync for all dependencies
update.all: lock.all sync.dev


.PHONY: upgrade  # upgrade main dependencies. Generate new .txt file
upgrade:
	python -m piptools compile --upgrade -o requirements/main.txt


.PHONY: upgrade.dev  # upgrade dev dependencies. Generate new .txt file
upgrade.dev:
	python -m piptools compile --extra dev --upgrade -o requirements/dev.txt


.PHONY: upgrade.all  # upgrade all dependencies. Generate new .txt files
upgrade.all: upgrade upgrade.dev


# ************************************************
# ********** application **********
# ************************************************
.PHONY: run  # run the application
run:
	python ./src/manage.py runserver

.PHONY: run.dev
run.dev: 
	python ./src/manage.py runserver


# ************************************************
# ********** django **********
# ************************************************
.PHONY: makemigrations
makemigrations:
	python .\src\manage.py makemigrations

.PHONY: migrate
migrate:
	python .\src\manage.py migrate

# ************************************************
# ********** code quality **********
# ************************************************

# fix formatting / and order imports
.PHONY: fix
fix:
	python -m black ./
	python -m isort ./
	python -m ruff --fix ./


# check everything
.PHONY: check
check:
	python -m ruff ./
	python -m black --check ./
	python -m isort --check ./


# ************************************************
# ********** pushing code **********
# ************************************************

.PHONY: commit
commit: check
	git add .
	git commit
	git push

.PHONY: commit.wip
commit.wip: fix
	git add .
	git commit -m "🚧 WIP"
	git push
