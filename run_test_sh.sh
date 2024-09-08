# 配置OSS访问密钥等信息
OSS_ACCESS_KEY_ID= ${OSS_ACCESS_KEY_ID}
OSS_SECRET_ACCESS_KEY= ${OSS_SECRET_ACCESS_KEY}
OSS_ENDPOINT= ${OSS_ENDPOINT}
OSS_BUCKET_NAME= ${OSS_BUCKET_NAME}

# 拉取最新的代码
git pull

# 检查 .ossutilconfig 文件是否存在，如果不存在则创建
if [ ! -f ~/.ossutilconfig ]; then
  cat <<EOT > ~/.ossutilconfig
[Default]
OSS_ACCESS_KEY_ID= ${OSS_ACCESS_KEY_ID}
OSS_SECRET_ACCESS_KEY= ${OSS_SECRET_ACCESS_KEY}
OSS_ENDPOINT= ${OSS_ENDPOINT}
OSS_BUCKET_NAME= ${OSS_BUCKET_NAME}
EOT
fi

# 给脚本添加执行权限
chmod +x run_test_sh.sh

# 运行Shell脚本
./run_test_sh.sh
