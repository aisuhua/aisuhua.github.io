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
