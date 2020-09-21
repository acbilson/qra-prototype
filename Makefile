dev:
	docker-compose up --build qra-dev

build:
	docker-compose up -d --build qra-prod
	docker cp qra-prod:/home/qra/src/dist .

