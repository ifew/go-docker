image-dev:
	docker image build -f Dockerfile_build  -t go_api .
run-dev:
	docker container run -it -p 5001:8080 --rm -v $(PWD):/api/src -t go_api run hellogirl-api.go
build-dev:
	docker container run -it -p 5001:8080 --rm -v $(PWD):/api/src -t go_api build -a -installsuffix cgo -o hellogirl-api
test-dev:
	docker container run -it -p 5001:8080 --rm -v $(PWD):/api/src -t go_api test

image:
	docker image build -f Dockerfile -t api .
start:
	docker container run -d -p 5001:8080 --name api01 -t api
stop:
	docker container rm -f api01

clean:
	go clean
	echo "Y" | docker container prune
	echo "Y" | docker image prune
	echo "Y" | docker volume prune