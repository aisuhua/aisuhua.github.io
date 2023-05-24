# blog2

## Run

### Docker

dev

```sh
docker run --rm -u $UID -p 8000:8000 -v $PWD:/src aisuhua/mkdocs:latest mkdocs serve --dev-addr 0.0.0.0:8000

# or

docker-compose up
```

prod

```sh
docker build -t aisuhua/aisuhua:v1 .
docker run --rm -p 8000:8080 aisuhua/aisuhua:v1
```
