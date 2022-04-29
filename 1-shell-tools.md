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

> 3.假设您有一个命令，它很少出错。因此为了在出错时能够对其进行调试，需要花费大量的时间重现错误并捕获输出。 编写一段bash脚本，运行如下的脚本直到它出错，将它的标准输出和标准错误流记录到文件，并在最后输出所有内容。 加分项：报告脚本在失败前共运行了多少次。

random-wrong.sh
```
#!/usr/bin/env bash
n=$(( RANDOM % 100))

if [[ n -eq 42]]; then
   echo "Something went wrong"
    >&2 echo "The error was using magic numbers"
    exit 1
fi

echo "Everything went according to plan"
```

debug.sh
```
#!/usr/bin/env bash
count=0

for((;;))
do
  sh $HOME/workspace/cs-course/Missing-Semester-Practice/random-wrong.sh &>$HOME/debug.log
  if [[$? -ne 0]]; then
    echo "oops,it's wrong now. Failed after $count times"
    echo "$(cat $HOME/debug.sh)"
    break
  fi
  ((count++))
done
```
