# 记录文件何时被人删掉的perl脚本

由于在一个共用的服务器上面我上传的文件被人删掉了，所以我用perl写了这个脚本，专门记录某个文件什么时候消失的。这个脚本就是`watch_exists.pl`。

## 使用

使用方法：

    perl watch_exists.pl --watch=/file.txt --log=/tmp/watch.log --time=60

或者`/usr/bin/perl`可执行文件存在，也可以

    watch_exists.pl --watch=/file.txt --log=/tmp/watch.log --time=60

参数：

- --watch= 用来设置检测的文件。
- --log= 用来设置检测到不存在时记录日志的位置。
- --time= 用来设置多少秒检测一次。

## LICENSE

写个脚本总共也没有几行代码，要什么LICENSE。
