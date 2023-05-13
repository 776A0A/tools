# 将 run_sh 加入环境变量

要将 `run_sh` 脚本添加到环境变量中，让你可以在任意位置使用该命令，可以按照以下步骤进行操作：

1. 将 `run_sh` 脚本复制到一个你想要存放脚本的目录中，例如 `/usr/local/bin`

2. 添加可执行权限，使用以下命令：

   ```
   chmod +x /usr/local/bin/run_sh
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
