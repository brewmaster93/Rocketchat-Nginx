FROM nginx:1.12.2

#ARG http_proxy

COPY ./resources/nginx-config/default.conf /etc/nginx/conf.d/

COPY ./main.sh /

RUN chmod 755 ./main.sh

#ENV http_proxy=$http_proxy

RUN apt-get update \
    && apt-get install -y gnupg2 \
    && apt-get install -y curl graphicsmagick \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && apt-get install -y build-essential \
    && npm install -g n \
    && n 4.8.4 \
    && curl -L https://download.rocket.chat/stable -o rocket.chat.tgz \
    && tar zxvf rocket.chat.tgz \
    && mv bundle Rocket.Chat \
    && rm rocket.chat.tgz \
    && cd Rocket.Chat/programs/server \
    && npm install \
    && cd ../.. \
    && export ROOT_URL=http://localhost:3000/ \
    && export MONGO_URL=mongodb://localhost:27017/rocketchat \
    && export PORT=3000

EXPOSE <port>

#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["/main.sh"]
