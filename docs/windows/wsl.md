# WSL

## 常见问题

### WSL Ubuntu error 0x80004002

使用 Adminstrator 打开 PowerShell，执行以下命令：

```sh
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

### PHPStorm 访问 WSL2 中的文件

```
\\wsl$\Ubuntu\opt\www\invo
```

### 新标签默认打开 Ubuntu

设置 -> 启动 -> 默认配置文件 -> 选择 Ubuntu -> 保存

### 从 WSL 访问 Hyper-V 所创建的虚拟机

```powershell
Get-NetIPInterface | where {$_.InterfaceAlias -eq 'vEthernet (WSL)' -or $_.InterfaceAlias -eq 'vEthernet (Default Switch)'} | Set-NetIPInterface -Forwarding Enabled
```

## 参考

1. [Windows Subsystem for Linux Documentation](https://learn.microsoft.com/en-us/windows/wsl/)
2. [WSL Ubuntu error 0x80004002](https://github.com/microsoft/WSL/issues/2851)
3. [Open a project stored in the WSL file system](https://www.jetbrains.com/help/phpstorm/how-to-use-wsl-development-environment-in-product.html#open-a-project-in-wsl)
4. [Connect Hyper-V VM from WSL (Ubuntu)](https://stackoverflow.com/a/75684131)
