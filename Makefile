.SILENT:

COMPOSE_PROD_PATH = ./deploy/docker-compose.prod.yml
COMPOSE_DEV_PATH =  ./deploy/docker-compose.dev.yml

up-dev:
	docker compose -p muse -f $(COMPOSE_DEV_PATH) up --build
	docker compose -p muse -f $(COMPOSE_DEV_PATH) down

up-prod:
	docker compose -p muse -f $(COMPOSE_PROD_PATH) up --build
	docker compose -p muse -f $(COMPOSE_PROD_PATH) down

update-all:
	$(MAKE) -C backend update
	$(MAKE) -C frontend update
