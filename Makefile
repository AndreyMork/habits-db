docker-build:
	docker build --tag habits-db .
.PHONY: docker-build

deploy: docker-build
	docker-compose up -d
.PHONY: deploy
