# WSL

## Cheetsheet

```sh
# View the list of distros and their current state:
wsl.exe -l -v

# Shutdown everything
wsl.exe --shutdown

# Terminate a specific distro:
wsl.exe -t <DistroName>

# Boot up a specific distro: 
wsl.exe -d <DistroName>

```

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

### 设置 WSL 静态 IP

1. 打开注册表编辑器，输入 `reg`
2. 进入目录 `计算机\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss\`
3. 修改 WSL 网段信息 `NatNetwork`
4. 修改 WSL 网关 IP （即主机的 IP 地址）`NatGatewayIpAddress`
5. 修改 WSL Ubuntu 的 IP `NatIpAddress`

## 参考

1. [Windows Subsystem for Linux Documentation](https://learn.microsoft.com/en-us/windows/wsl/)
2. [WSL Ubuntu error 0x80004002](https://github.com/microsoft/WSL/issues/2851)
3. [Open a project stored in the WSL file system](https://www.jetbrains.com/help/phpstorm/how-to-use-wsl-development-environment-in-product.html#open-a-project-in-wsl)
4. [Connect Hyper-V VM from WSL (Ubuntu)](https://stackoverflow.com/a/75684131)
5. [Can I set a static ip address for WSL 2?](https://stackoverflow.com/questions/69691928/can-i-set-a-static-ip-address-for-wsl-2)
6. [Configuring WSL2 distro for static IPv4 address](https://github.com/microsoft/WSL/discussions/9580)
7. [Rebooting Ubuntu on Windows without rebooting Windows?](https://superuser.com/questions/1126721/rebooting-ubuntu-on-windows-without-rebooting-windows)
