build:
	docker compose -f ./srcs/docker-compose.yml up --build
up:
	docker compose -f ./srcs/docker-compose.yml up
down:
	docker compose -f ./srcs/docker-compose.yml down -v
clean:
	docker image prune -a