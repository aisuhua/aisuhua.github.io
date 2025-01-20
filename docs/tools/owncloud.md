# ownCloud

```sh
# install collabora
docker run -t -d -p 9980:9980 -e "extra_params=--o:ssl.enable=false" -e "aliasgroup1=http://197.197.0.11:8080" collabora/code

# Quick Tryout ownCloud Docker
https://www.collaboraonline.com/quick-tryout-owncloud-docker/

# Docker Compose YAML File
https://doc.owncloud.com/server/next/admin_manual/installation/docker/#docker-compose-yaml-file

# install
https://owncloud.com/collabora/
https://www.collaboraonline.com/quick-tryout-owncloud-docker/
https://doc.owncloud.com/server/next/admin_manual/installation/docker/
https://docs.nextcloud.com/server/latest/admin_manual/office/example-docker.html

# apps
Collabora Online
https://marketplace.owncloud.com/apps/richdocuments

Files clipboard
https://marketplace.owncloud.com/apps/files_clipboard

LDAP Integration
https://marketplace.owncloud.com/apps/user_ldap

External Storage: FTP
https://marketplace.owncloud.com/apps/files_external_ftp

External Storage: S3
https://marketplace.owncloud.com/apps/files_external_s3

# skeletondirectory
https://doc.owncloud.com/server/next/admin_manual/configuration/files/default_files_configuration.html
https://github.com/owncloud/core/blob/30eb65b975aae2a8a20bc548d9bac07a9a29a704/config/config.sample.php#L332C2-L332C19
https://github.com/owncloud/core/issues/24519#issuecomment-218124950

# Language Configuration
# This parameter can be set in config/config.php
'default_language' => 'zh_CN'

https://doc.owncloud.com/server/next/admin_manual/configuration/server/language_configuration.html

# Modify Session Time OwnCloud (for security)
remember_login_cookie_lifetime
session_lifetime
session_keepalive
https://help.univention.com/t/modify-session-time-owncloud-for-security/15482

# Issue while installing custom fonts
volumes:
  - ./fonts:/opt/cool/systemplate/usr/share/fonts/truetype
  - ./fonts:/usr/share/fonts/truetype
https://github.com/CollaboraOnline/online/issues/4555#issuecomment-2313407409

# CODE Docker image
https://sdk.collaboraonline.com/docs/installation/CODE_Docker_image.html#how-to-configure-docker-image
```


