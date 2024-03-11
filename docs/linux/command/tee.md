# tee

```
# 同时输出到文件 
ls -a | tee output.file

# 将错误信息也同时输出到文件
program [arguments...] 2>&1 | tee outfile
```

## Links

- [How to redirect output to a file and stdout](https://stackoverflow.com/questions/418896/how-to-redirect-output-to-a-file-and-stdout)
