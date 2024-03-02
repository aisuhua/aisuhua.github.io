# django

## cheetsheet

```sh
# 安装 Python 3.12
sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
mkdir ./python && cd ./python
wget https://www.python.org/ftp/python/3.12.1/Python-3.12.1.tgz
tar -xvf Python-3.12.1.tgz
cd Python-3.12.0b3
./configure --enable-optimizations
sudo make install
```

## FAQ

```sh
pip install mysqlclient

#Exception: Can not find valid pkg-config name.
#Specify MYSQLCLIENT_CFLAGS and MYSQLCLIENT_LDFLAGS env vars manually
sudo apt-get install python3-dev default-libmysqlclient-dev build-essential pkg-config
```

## Links

- [Docker Alpine build fails on mysqlclient installation with error: Exception: Can not find valid pkg-config name](https://stackoverflow.com/a/77494325)
