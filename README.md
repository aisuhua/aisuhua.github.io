# aisuhua.github.io

## Clone

```sh
git clone https://github.com/aisuhua/aisuhua.github.io.git
cd aisuhua.github.io
```

## Docker

```sh
docker run --rm -u $UID -p 8080:8080 -v $PWD:/src aisuhua/mkdocs:latest mkdocs serve --dev-addr 0.0.0.0:8080
```

## Docker Compose

Change .env file

```sh
cp .env.example .env
```

Run

```sh
docker-compose up
```

## Build a new image and run

Docker

```sh
docker build -t aisuhua/aisuhua:latest .
docker run --rm -p 8080:8080 aisuhua/aisuhua:latest
```

Docker Compose

```sh
docker-compose -f docker-compose.prod.yaml up
```

## Auto publish to gh-pages

[.github/workflows/gh-pages.yml](.github/workflows/gh-pages.yml)
