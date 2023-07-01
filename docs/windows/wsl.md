# WSL

## 常见问题

### 安装

#### WSL Ubuntu error 0x80004002

使用 Adminstrator 打开 PowerShell，执行以下命令：

```sh
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

### 使用

#### PHPStorm 访问 WSL2 中的文件

```
\\wsl$\Ubuntu\opt\www\invo
```

- [Open a project stored in the WSL file system](https://www.jetbrains.com/help/phpstorm/how-to-use-wsl-development-environment-in-product.html#open-a-project-in-wsl)

## 参考

1. [Windows Subsystem for Linux Documentation](https://learn.microsoft.com/en-us/windows/wsl/)
2. [WSL Ubuntu error 0x80004002](https://github.com/microsoft/WSL/issues/2851)
