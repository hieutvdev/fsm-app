FROM ubuntu:latest AS build-env

RUN apt-get update
RUN apt-get install -y curl git unzip

ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.24.5
ARG APP=/app/

# Retry mechanism for git clone
RUN for i in 1 2 3 4 5; do git clone https://github.com/flutter/flutter.git $FLUTTER_SDK && break || sleep 15; done

RUN cd $FLUTTER_SDK && git fetch && git checkout $FLUTTER_VERSION

ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor -v

RUN mkdir $APP

COPY . $APP

WORKDIR $APP

RUN flutter clean
RUN flutter pub get
RUN flutter build web --no-tree-shake-icons

FROM nginx:1.25.2-alpine

COPY --from=build-env /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]