## Configuration

### Nginx server
Configure nginx default config file (/resources/nginx-config/default.conf) with your server parameters:

    listen <port>; (
    server_name <your server name>;
    ssl_certificate /cert/<your certificate (.crt)>;
    ssl_certificate_key /<your certificate key(.key)>;

### Dockerfile
Configure Dockerfile with the port to expose for your Nginx-Rocketchat server

    EXPOSE <port>
    
## Build

Build with docker

    docker build -t rocket-nginx .

Else if you need to use proxy

	docker build --build-arg http_proxy="<proxy>" --build-arg https_proxy="<proxy>" -t rocket-nginx .

## Run

### Docker compose
I suggest to use Docker-Compose

    chat-app:
        container_name: rocketchat-nginx
        image: rocket-nginx:latest
        environment:
            - MONGO_URL=mongodb://<your mongodb>:27017/rocketchat
            - ROOT_URL=https://<your domain>:<port>
            - PORT=3000
        ports:
            - <port>:<port>     
        volumes:
            - <your cert path>:/cert


## Docker
If you don't want to use Docker-compose
	
	docker run --name nginx-rocket --mount source=<your cert path>,target=/cert
	-p <port>:<port> --env MONGO_URL=mongodb://<your mongo>:27017 --env ROOT_URL=https://<your domain>:<port> --env PORT=3000 -d rocket-nginx


