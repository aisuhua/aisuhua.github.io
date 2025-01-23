# mkdocs 

## 优化

### TOC

支持中文锚点

```sh
markdown_extensions:
  - toc:
      permalink: true
      slugify: !!python/object/apply:pymdownx.slugs.slugify
        kwds:
          case: lower
          percent_encode: true
```

- [toc.follow not work with Chinese characters](https://github.com/squidfunk/mkdocs-material/issues/5211)
