.PHONY: init
init:
	docker compose up -d --build
	docker compose exec app composer install
	docker compose exec app cp .env.example .env
	docker compose exec app php artisan key:generate
	docker compose exec app php artisan storage:link
	docker compose exec app chmod -R 777 storage bootstrap/cache
	docker compose exec app yarn install

.PHONY: app
app:
	docker compose exec app bash

.PHONY: migrate
migrate:
	docker compose exec app php artisan migrate
	docker compose exec app php artisan migrate --env=testing

.PHONY: fresh
fresh:
	docker compose exec app php artisan migrate:fresh --seed

.PHONY: seed
seed:
	docker compose exec app php artisan db:seed

.PHONY: clear
clear:
	docker compose exec app php artisan cache:clear && \
    docker compose exec app php artisan config:clear && \
    docker compose exec app php artisan route:clear

.PHONY: phpunit
phpunit:
	docker compose exec app bash -c "./vendor/bin/phpunit -c phpunit.xml ./tests"

.PHONY: phpstan
phpstan:
	docker compose exec app bash -c "./vendor/bin/phpstan analyse --memory-limit=2G"
