# 拉取最新的代码
git pull

# 创建 .ossutilconfig 文件
echo "[Default]" > ~/.ossutilconfig
echo "AccessKeyId = ${OSS_ACCESS_KEY_ID}" >> ~/.ossutilconfig
echo "AccessKeySecret = ${OSS_SECRET_ACCESS_KEY}" >> ~/.ossutilconfig
echo "Endpoint = ${OSS_ENDPOINT}" >> ~/.ossutilconfig

# 给脚本添加执行权限
chmod +x test_sh.sh

# 运行Shell脚本
./test_sh.sh
