# AI

## 数学知识

- 高斯分布
- 标量函数
- 向量值

- [标量 (物理学)](https://zh.wikipedia.org/wiki/%E6%A0%87%E9%87%8F_(%E7%89%A9%E7%90%86%E5%AD%A6))

## 实操

```sh
(d2l) suhua@g7-7588:~/Downloads$ pip install mxnet-cu91==1.7.0
Looking in indexes: https://pypi.tuna.tsinghua.edu.cn/simple
Collecting mxnet-cu101==1.7.0
  Downloading https://pypi.tuna.tsinghua.edu.cn/packages/40/26/9655677b901537f367c3c473376e4106abc72e01a8fc25b1cb6ed9c37e8c/mxnet_cu101-1.7.0-py2.py3-none-manylinux2014_x86_64.whl (846.0 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 846.0/846.0 MB 2.7 MB/s eta 0:00:00
Collecting numpy<2.0.0,>1.16.0 (from mxnet-cu101==1.7.0)
  Downloading https://pypi.tuna.tsinghua.edu.cn/packages/54/30/c2a907b9443cf42b90c17ad10c1e8fa801975f01cb9764f3f8eb8aea638b/numpy-1.26.4-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (18.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 18.2/18.2 MB 3.8 MB/s eta 0:00:00
Collecting requests<3,>=2.20.0 (from mxnet-cu101==1.7.0)
  Downloading https://pypi.tuna.tsinghua.edu.cn/packages/f9/9b/335f9764261e915ed497fcdeb11df5dfd6f7bf257d4a6a2a686d80da4d54/requests-2.32.3-py3-none-any.whl (64 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 64.9/64.9 kB 6.4 MB/s eta 0:00:00
Collecting graphviz<0.9.0,>=0.8.1 (from mxnet-cu101==1.7.0)
  Downloading https://pypi.tuna.tsinghua.edu.cn/packages/53/39/4ab213673844e0c004bed8a0781a0721a3f6bb23eb8854ee75c236428892/graphviz-0.8.4-py2.py3-none-any.whl (16 kB)
Collecting charset-normalizer<4,>=2 (from requests<3,>=2.20.0->mxnet-cu101==1.7.0)
  Downloading https://pypi.tuna.tsinghua.edu.cn/packages/98/69/5d8751b4b670d623aa7a47bef061d69c279e9f922f6705147983aa76c3ce/charset_normalizer-3.3.2-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (142 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 142.3/142.3 kB 7.2 MB/s eta 0:00:00
Collecting idna<4,>=2.5 (from requests<3,>=2.20.0->mxnet-cu101==1.7.0)
  Downloading https://pypi.tuna.tsinghua.edu.cn/packages/e5/3e/741d8c82801c347547f8a2a06aa57dbb1992be9e948df2ea0eda2c8b79e8/idna-3.7-py3-none-any.whl (66 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 66.8/66.8 kB 7.4 MB/s eta 0:00:00
Collecting urllib3<3,>=1.21.1 (from requests<3,>=2.20.0->mxnet-cu101==1.7.0)
  Downloading https://pypi.tuna.tsinghua.edu.cn/packages/a2/73/a68704750a7679d0b6d3ad7aa8d4da8e14e151ae82e6fee774e6e0d05ec8/urllib3-2.2.1-py3-none-any.whl (121 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 121.1/121.1 kB 7.7 MB/s eta 0:00:00
Collecting certifi>=2017.4.17 (from requests<3,>=2.20.0->mxnet-cu101==1.7.0)
  Downloading https://pypi.tuna.tsinghua.edu.cn/packages/5b/11/1e78951465b4a225519b8c3ad29769c49e0d8d157a070f681d5b6d64737f/certifi-2024.6.2-py3-none-any.whl (164 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 164.4/164.4 kB 6.6 MB/s eta 0:00:00
Installing collected packages: urllib3, numpy, idna, graphviz, charset-normalizer, certifi, requests, mxnet-cu101
Successfully installed certifi-2024.6.2 charset-normalizer-3.3.2 graphviz-0.8.4 idna-3.7 mxnet-cu101-1.7.0 numpy-1.26.4 requests-2.32.3 urllib3-2.2.1

$ pip install d2l==0.17.6
Successfully installed anyio-4.4.0 argon2-cffi-23.1.0 argon2-cffi-bindings-21.2.0 arrow-1.3.0 asttokens-2.4.1 attrs-23.2.0 beautifulsoup4-4.12.3 bleach-6.1.0 cffi-1.16.0 chardet-4.0.0 comm-0.2.2 cycler-0.12.1 d2l-0.17.6 debugpy-1.8.1 decorator-5.1.1 defusedxml-0.7.1 entrypoints-0.4 exceptiongroup-1.2.1 executing-2.0.1 fastjsonschema-2.19.1 fonttools-4.53.0 fqdn-1.5.1 idna-2.10 importlib-metadata-7.1.0 ipykernel-6.29.4 ipython-8.18.1 ipython-genutils-0.2.0 ipywidgets-8.1.3 isoduration-20.11.0 jedi-0.19.1 jinja2-3.1.4 jsonpointer-3.0.0 jsonschema-4.22.0 jsonschema-specifications-2023.12.1 jupyter-1.0.0 jupyter-client-7.4.9 jupyter-console-6.6.3 jupyter-core-5.7.2 jupyter-events-0.10.0 jupyter-server-2.14.1 jupyter-server-terminals-0.5.3 jupyterlab-pygments-0.3.0 jupyterlab-widgets-3.0.11 kiwisolver-1.4.5 markupsafe-2.1.5 matplotlib-3.5.1 matplotlib-inline-0.1.7 mistune-3.0.2 nbclassic-1.1.0 nbclient-0.10.0 nbconvert-7.16.4 nbformat-5.10.4 nest-asyncio-1.6.0 notebook-6.5.7 notebook-shim-0.2.4 numpy-1.21.5 overrides-7.7.0 packaging-24.1 pandas-1.2.4 pandocfilters-1.5.1 parso-0.8.4 pexpect-4.9.0 pillow-10.3.0 platformdirs-4.2.2 prometheus-client-0.20.0 prompt-toolkit-3.0.47 psutil-5.9.8 ptyprocess-0.7.0 pure-eval-0.2.2 pycparser-2.22 pygments-2.18.0 pyparsing-3.1.2 python-dateutil-2.9.0.post0 python-json-logger-2.0.7 pytz-2024.1 pyyaml-6.0.1 pyzmq-26.0.3 qtconsole-5.5.2 qtpy-2.4.1 referencing-0.35.1 requests-2.25.1 rfc3339-validator-0.1.4 rfc3986-validator-0.1.1 rpds-py-0.18.1 send2trash-1.8.3 six-1.16.0 sniffio-1.3.1 soupsieve-2.5 stack-data-0.6.3 terminado-0.18.1 tinycss2-1.3.0 tornado-6.4.1 traitlets-5.14.3 types-python-dateutil-2.9.0.20240316 typing-extensions-4.12.2 uri-template-1.3.0 urllib3-1.26.18 wcwidth-0.2.13 webcolors-24.6.0 webencodings-0.5.1 websocket-client-1.8.0 widgetsnbextension-4.0.11 zipp-3.19.2
```

## links

- [动手学深度学习](https://zh.d2l.ai/index.html)
