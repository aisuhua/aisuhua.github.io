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

```
