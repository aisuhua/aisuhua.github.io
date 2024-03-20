# awk

```sh
# 分割内容取其中一部分
$ uname -a
Linux g7-7588 5.4.0-150-generic #167~18.04.1-Ubuntu SMP Wed May 24 00:51:42 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
$ uname -a | awk '{print $3}'
5.4.0-150-generic
$ uname -a | awk '{print $3}' | awk -F '-' '{print $1}'
5.4.0
$ uname -a | awk '{print $3}' | awk -F '-150-' '{print $1}'
5.4.0

# 以逗号分割输出结果，类似 csv 格式
awk -F, '{OFS=",";print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$20,$21,$22,$23,$24,$25,$30,$33}' infile.csv > outfile.csv

# 以双引号括起来每个字段值
cat xferlog* | awk '{OFS="\",\"";print $1" "$2" "$3" "$4" "$5,$7,$9,$14}' | awk '{printf "\"%s\", \n", $0}' 

# 字符串首尾加上双引号
awk '{ printf "\"%s\",\n", $0 }' file
```

## Links

- [How to add double quotes to every line and then add a comma at the end of the line?](https://unix.stackexchange.com/questions/223677/how-to-add-double-quotes-to-every-line-and-then-add-a-comma-at-the-end-of-the-li)
- [Add double quotes around fields in AWK script output?](https://stackoverflow.com/questions/14427188/add-double-quotes-around-fields-in-awk-script-output)
