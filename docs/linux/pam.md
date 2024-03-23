# PAM

```sh
# 查看 pam 版本
$ rpm -qa | grep pam
pam-1.3.1-11.el8.x86_64

# 查看已安装了哪些模块
rpm -ql pam | grep lib64
# 或者
ls -l /lib64/security/

# For Ubuntu
dpkg -L libpam-modules | grep lib

# 查看服务是否支持 PAM
$ ldd `which sshd` | grep libpam
libpam.so.0 => /lib64/libpam.so.0 (0x00007f9a24158000)

$ ldd `which passwd` | grep libpam
libpam.so.0 => /lib64/libpam.so.0 (0x00007f14d5a85000)
libpam_misc.so.0 => /lib64/libpam_misc.so.0 (0x00007f14d5881000)
```

## Links

- https://github.com/linux-pam/linux-pam/
- [Linux Password Enforcement with PAM](https://deer-run.com/users/hal/linux_passwords_pam.html)
- [Linux Password Security with pam_cracklib](https://deer-run.com/users/hal/sysadmin/pam_cracklib.html)