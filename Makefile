update:
	git submodule update --remote

build:
	docker-compose up --build

start:
	@echo "Starting services..."
	@bash -c '\
		trap "kill 0" EXIT; \
		cd llama-city/cmd/ && go run main.go --config ../config.yaml & \
		sleep 3; \
		cd llama-citizen/cmd/ && go run main.go --config ../config.yaml & \
		cd datagram-intelligence/cmd/ && go run main.go --config ../config.yaml & \
		wait'
