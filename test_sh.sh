#!/bin/bash

# 设置环境变量
export OSS_ACCESS_KEY_ID= ${OSS_ACCESS_KEY_ID}
export OSS_SECRET_ACCESS_KEY= ${OSS_SECRET_ACCESS_KEY}
export OSS_ENDPOINT= ${OSS_ENDPOINT}
export OSS_BUCKET_NAME= ${OSS_BUCKET_NAME}

# 输出环境变量以确认它们已被正确设置
echo "OSS_ACCESS_KEY_ID: $OSS_ACCESS_KEY_ID"
echo "OSS_SECRET_ACCESS_KEY: $OSS_SECRET_ACCESS_KEY"
echo "OSS_ENDPOINT: $OSS_ENDPOINT"
echo "OSS_BUCKET_NAME: $OSS_BUCKET_NAME"

# 检查ossutil是否安装
if ! command -v ossutil &> /dev/null; then
  echo "ossutil not found. Please install ossutil."
  exit 1
fi

# 输出ossutil版本信息
ossutil --version



# 使用配置文件执行ossutil命令
ossutil cp hello.txt oss://$OSS_BUCKET_NAME/path/to/hello.txt --config-file ~/.ossutilconfig

# 检查上传是否成功
if [ $? -eq 0 ]; then
  echo "File uploaded successfully."
else
  echo "Failed to upload file. Check the output for details."
fi
