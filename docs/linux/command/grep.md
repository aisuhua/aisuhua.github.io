# grep

```sh
# 忽略注释和空行
grep -v '#' filebeat.yml | grep -v '^$'

# 使用 $ 参数
echo 192.168.1. | xargs -I{} grep {} *.txt
```‘

## Links

- [Make xargs pass as first parameter](https://unix.stackexchange.com/questions/91596/make-xargs-pass-as-first-parameter)
