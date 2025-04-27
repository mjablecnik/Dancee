FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*
COPY build/web/ .

# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
