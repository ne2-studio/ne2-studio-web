FROM hugomods/hugo:exts AS build

WORKDIR /src

COPY . .

RUN HUGO_ENV=production hugo --minify --logLevel info

FROM nginx:alpine

COPY --from=build /src/public/ /usr/share/nginx/html/

EXPOSE 80
