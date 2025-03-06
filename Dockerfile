FROM aisuhua/mkdocs:${VERSION:-latest} AS builder

COPY . .
RUN mkdocs build --clean

FROM nginxinc/nginx-unprivileged:1.23.4

USER root
COPY --from=builder /src/site /usr/share/nginx/html

RUN chown -R 1001:0 /usr/share/nginx/html \
&& chmod -R 775 /usr/share/nginx/html

USER 1001
