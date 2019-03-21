# docker-rt-n56u
[padavan rt-n56u](https://bitbucket.org/padavan/rt-n56u) 的 docker 编译镜像
镜像大小大约2G左右，镜像中包含了`padavan/rt-n56u`的源码，镜像已经编译了工具链，并且内部首次编译了固件，所以你用来编译的话，在一台典型的电脑上，大约在5分钟左右。

### 使用


```bash
docker run --rm -v images:/data shellus/rt-n56u`
```
~首次run一个镜像，会自动去hub.docker.com下载，后面再run的话，就直接使用本地下载好的镜像了

就这样，执行完了，固件就编译到当前路径的images文件夹里面了


### 编译指定配置
1. 将配置放到当前目录， 例如 `a.config` 和 `a` 文件夹， 放好了之后 `ls ./` 你应该能看到它们
1. 执行
   ```bash
   docker run --rm \
   -v images:/data \
   -v a:/opt/rt-n56u/trunk/configs/boards/a \
   -v a.config:/opt/rt-n56u/trunk/.config \
   shellus/rt-n56u
   ```
0. 执行完了，固件就编译到当前路径的images文件夹里面了

