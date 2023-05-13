# 个人的实用用具

# 将 run_web_sh 加入环境变量（CentOS 7）

要将 `run_web_sh` 脚本添加到环境变量中，让你可以在任意位置使用该命令，可以按照以下步骤进行操作：

1. 将 `run_web_sh` 脚本复制到一个你想要存放脚本的目录中，例如 `/usr/local/bin`：

```
cd /usr/local/bin

wget https://raw.githubusercontent.com/776A0A/tools/main/run_web_sh.sh
```

2. 添加可执行权限，使用以下命令：

   ```
   chmod +x /usr/local/bin/run_web_sh.sh
   ```

3. 打开你的 `.bashrc` 文件，使用以下命令：

   ```
   vi ~/.bashrc
   ```

4. 在 `.bashrc` 文件中添加以下行：

   ```
   export PATH=$PATH:/usr/local/bin
   ```

   这将把 `/usr/local/bin` 目录添加到你的环境变量中。

5. 保存并关闭文件，然后使用以下命令使更改生效：

   ```
   source ~/.bashrc
   ```

# pack_it.sh

该脚本用于将文件或目录压缩为 zip 格式，并保存到指定目录。

## 使用方法

```sh
./pack_it.sh <file/dir> [name]
```

- `<file/dir>`：要压缩的文件或目录的路径。
- `[name]`：可选参数，压缩文件的名称，默认为原文件或目录的名称。

## 示例

将文件 `example.txt` 压缩为 `packed/example.zip`：

```sh
./pack_it.sh example.txt example
```

将目录 `example_dir` 压缩为 `packed/example_dir.zip`：

```sh
./pack_it.sh example_dir
```

## 注意事项

- 压缩文件将保存到 `packed` 目录下。
- 如果指定的名称已存在，将覆盖原有文件。
- 如果指定的路径为目录，则将目录及其子目录下的所有文件和文件夹压缩为一个 zip 文件。
- 如果指定的路径为文件，则将该文件压缩为一个 zip 文件。
