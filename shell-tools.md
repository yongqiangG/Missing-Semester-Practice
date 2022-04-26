> 1.阅读 man ls ，然后使用ls 命令进行如下操作：
> - 所有文件（包括隐藏文件）
> - 文件打印以人类可以理解的格式输出 (例如，使用454M 而不是 454279954)
> - 文件以最近访问顺序排序
> - 以彩色文本显示输出结果

```
ls -a

ls -l -h

ls -l -u

ls -color
```

> 2.编写两个bash函数 marco 和 polo 执行下面的操作。 每当你执行 marco 时，当前的工作目录应当以某种形式保存，当执行 polo 时，无论现在处在什么目录下，都应当 cd 回到当时执行 marco 的目录。 为了方便debug，你可以把代码写在单独的文件 marco.sh 中，并通过 source marco.sh命令，（重新）加载函数。

```
#!/usr/bin/env bash

marco () {
  rm -f $HOME/marco.log
  echo "save $(pwd)" > $HOME/marco.log
  echo "save $(pwd) on $HOME/marco.log"
}

polo () {
  cd "$(cat "$HOME/marco.log")"
}
```
