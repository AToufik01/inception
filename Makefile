build:
	docker compose -f ./srcs/docker-compose.yml up --build
up:
	docker compose -f ./srcs/docker-compose.yml up
down:
	docker compose -f ./srcs/docker-compose.yml down -v
clean: down
	docker image prune -a
	sudo rm -rf /home/ataoufik/data/db/*
	sudo rm -rf /home/ataoufik/data/wordpress/*
