# 导入证书

## Ubuntu

```sh
sudo cp local-ca.crt /usr/local/share/ca-certificates
sudo update-ca-certificates
```

## CentOS

```sh
sudo cp local-ca.crt /etc/pki/ca-trust/source/anchors
sudo update-ca-trust
```

## Windows

导入根证书

```powershell
Import-Certificate -FilePath 'C:\local-ca.crt' -CertStoreLocation Cert:\LocalMachine\Root
```

导入客户端证书

```sh
# 导入不含密码的证书
Set-Location -Path cert:\CurrentUser\My
Import-PfxCertificate -Filepath 'C:\client.p12'

# 导入含密码的证书
$pfxPassword = "PASSWORD" | ConvertTo-SecureString -AsPlainText -Force
Set-Location -Path cert:\CurrentUser\My
Import-PfxCertificate -Filepath 'C:\client.p12' -Password $pfxPassword
```

## links

- [How to add Certificate Authority file in CentOS 7](https://stackoverflow.com/questions/37043442/how-to-add-certificate-authority-file-in-centos-7)
- [Adding trusted root certificates to the server](https://manuals.gfi.com/en/kerio/connect/content/server-configuration/ssl-certificates/adding-trusted-root-certificates-to-the-server-1605.html)
