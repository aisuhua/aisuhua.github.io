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

### magiclink

URL 自定变成超链接

```
markdown_extensions:
  - pymdownx.magiclink
```

- [automatic hyperlink from url](https://github.com/squidfunk/mkdocs-material/discussions/7261)

## Links

- [How to reorder pages without specifying the 'nav' attribute? #3482](https://github.com/squidfunk/mkdocs-material/discussions/3482)
