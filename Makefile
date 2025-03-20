update:
	git submodule update --remote

pull:
	git submodule update --init --recursive

build:
	docker-compose up --build

start:
	@bash -c '\
		git submodule update --init --recursive; \
		echo "Starting services..."; \
		trap "kill 0" EXIT; \
		cd llama-city/cmd/ && go run main.go --config ../config.yaml & \
		sleep 3; \
		cd llama-citizen/cmd/ && go run main.go --config ../config.yaml & \
		cd datagram-intelligence/cmd/ && go run main.go --config ../config.yaml & \
		wait'
