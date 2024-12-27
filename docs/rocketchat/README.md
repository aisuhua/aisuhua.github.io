# RocketChat

离线注册

```sh
docker exec -it mongodb bash
mongosh
use rocketchat
db.rocketchat_settings.update({"_id":"Show_Setup_Wizard"}, {$set: {"value" : "completed"} });
```

- https://github.com/RocketChat/Rocket.Chat/issues/31163#issuecomment-2292864632

下载客户端

- [Desktop & Mobile Apps](https://docs.rocket.chat/docs/desktop-mobile-apps)


Logo 设计

- [chat 图标](https://www.flaticon.com/free-icon/chat_1702867?term=message&page=4&position=83&origin=search&related_id=1702867)

## refs

- [Add ARM support on Windows and Linux](https://github.com/RocketChat/Rocket.Chat.Electron/issues/2260)
