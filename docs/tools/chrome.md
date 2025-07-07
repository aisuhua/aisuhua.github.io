# Chrome

- [Auto Refresh Plus](https://chromewebstore.google.com/detail/auto-refresh-plus-page-mo/hgeljhfekpckiiplhkigfehkdpldcggm)

如何导出扩展

```sh
1. Go to Chrome's Extensions page (chrome://extensions/)
2. Enable the developer mode (check the developer mode box)
3. Click on the "Pack extension" button. Give the "Extension root directory" as:
    a. Unix, ~/.config/google-chrome/Default/Extensions/$ID$
    b. Windows, C:\Users\<Your_User_Name>\AppData\Local\Google\Chrome\User Data\Default\Extensions\$ID$
    c. OSX, ~/Library/Application Support/Google/Chrome/Default/Extensions/$ID$

Leave the "Private Key" field blank" and click "Pack extension".
You will find the .CRX file in the same directory as ~/.config/google-chrome/Default/Extensions/$ID$ (or other respective directories for Windows and OS X)
```

- [How to download Chrome extensions for installing on another computer?](https://superuser.com/questions/290280/how-to-download-chrome-extensions-for-installing-on-another-computer)
