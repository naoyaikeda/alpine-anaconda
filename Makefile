USER=nikeda
NAME=alpine-anaconda
VERSION=0.0.0

build:
	docker build -t $(USER)/$(NAME):$(VERSION) .

build-no-cache:
	docker build --no-cache=true -t $(USER)/$(NAME):$(VERSION) .

restart: stop start

start:
	docker run -it --rm \
		-v $$PWD/works:/works \
		--name $(NAME) \
		$(USER)/$(NAME):$(VERSION)
stop:
	docker stop $(NAME)
