.PHONY: serve stop lock build

serve:
	docker compose up --build

stop:
	docker compose down

lock:
	docker compose run --rm docs poetry lock

build:
	docker compose run --rm docs mkdocs build