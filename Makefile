image-dev:
	docker image build -f Dockerfile_build  -t go_api .
run-dev:
	docker container run -it -p 5001:8080 --rm -v $(PWD):/api/src -t go_api run hellogirl-api.go
build-dev:
	docker container run -it -p 5001:8080 --rm -v $(PWD):/api/src -t go_api build hellogirl-api.go
test-dev:
	docker container run -it -p 5001:8080 --rm -v $(PWD):/api/src -t go_api test

clean:
	docker container prune
	docker image prune
	docker volume prune