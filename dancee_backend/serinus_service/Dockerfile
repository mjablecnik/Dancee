# FROM dart:stable AS build
# WORKDIR /app
#
# COPY pubspec.* ./
# RUN dart pub get
# COPY . .
# RUN dart run build_runner build --delete-conflicting-outputs
#
# RUN dart compile exe lib/main.dart -o server -D FLAVOR=prod
#
# #####

FROM debian:stable-slim
WORKDIR /app

COPY bin/server /app/server

EXPOSE 3000

CMD ["./server"]
