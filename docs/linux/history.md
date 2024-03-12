# history

```sh
# Enter the following command in a terminal to print all the environment variables:
printenv

# To show a list including the "shell variables" you can enter the next command:
# This will show you not only the shell variables, but the environment variables too.
( set -o posix ; set ) | less

# PROMPT_COMMAND
# 在 bash 里设置环境变量 PROMPT_COMMAND，这个命令会在用户提示符之前被执行，可以用来记录用户操作历史 
# Bash provides an environment variable called PROMPT_COMMAND. The contents of this variable are executed as a regular Bash command just before Bash displays a prompt.
If set, the value is executed as a command prior to issuing each primary prompt.
```

## Links

- [How to list all variables names and their current values?](https://askubuntu.com/questions/275965/how-to-list-all-variables-names-and-their-current-values)
- [How to manage your Linux command history](https://www.redhat.com/sysadmin/history-command)
- [HISTTIMEFORMAT syntax](https://unix.stackexchange.com/questions/174900/histtimeformat-syntax)
- [4.1. PROMPT_COMMAND](https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x264.html)
