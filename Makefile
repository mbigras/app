build:
	docker build -t mbigras/app .

run:
	docker run -e PORT=8080 -p 8080:8080 mbigras/app

push:
	docker push mbigras/app
