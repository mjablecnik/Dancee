FROM dart:stable AS build
WORKDIR /app

COPY pubspec.* ./
COPY . .
RUN dart pub get
RUN dart run build_runner build --delete-conflicting-outputs

RUN dart compile exe lib/main.dart -o server -D FLAVOR=prod

#####

FROM debian:stable-slim
WORKDIR /app

COPY --from=build /app/server /app/server

EXPOSE 8000

CMD ["./server"]
