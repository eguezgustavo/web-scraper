docker-compose:=docker compose -f infrastructure/docker-compose.yml
execute:=${docker-compose} exec webscraper-dev

start:
	@${docker-compose} up -d

stop:
	@${docker-compose} down --volumes --remove-orphans --rmi all

test:
	@${execute} bash -c "cd webscraper/ && go test -v"

run:
	@${execute} bash -c "cd webscraper/ && go run main.go"

format:
	@${execute} pre-commit run --files webscraper/* && \
	${execute} bash -c "cd webscraper/ && golangci-lint run"

shell:
	@${docker-compose} exec -it webscraper-dev bash