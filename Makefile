docker-compose:=docker compose -f infrastructure/docker-compose.yml
execute:=${docker-compose} exec webscraper

start:
	@${docker-compose} up -d

start/dev:
	@${docker-compose} -f infrastructure/docker-compose.dev.yml up -d

stop:
	@${docker-compose} down --volumes --remove-orphans --rmi all

stop/dev:
	@${docker-compose} -f infrastructure/docker-compose.dev.yml down --volumes --remove-orphans --rmi all

test:
	@${execute} bash -c "cd webscraper/ && go test -v"

format:
	@${execute} pre-commit run --files webscraper/* && \
	${execute} bash -c "cd webscraper/ && golangci-lint run"

shell:
	@${docker-compose} exec -it webscraper-dev bash