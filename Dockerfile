FROM hugomods/hugo:exts AS build

ARG BASE_URL=https://www.ne2.studio/

WORKDIR /src

COPY . .

RUN HUGO_ENV=production hugo --minify --logLevel info --baseURL "$BASE_URL"

FROM nginx:alpine

COPY --from=build /src/public/ /usr/share/nginx/html/

EXPOSE 80
