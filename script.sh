#!/bin/bash

# 设置环境变量
export OSS_ACCESS_KEY_ID="LTAI5tDciGmrKp81bHXkqJ8j"
export OSS_SECRET_ACCESS_KEY="S1jAbrbrLSNEsOs0934CQ0MAMw4ZPH"
export OSS_ENDPOINT="oss-cn-beijing.aliyuncs.com"
export OSS_BUCKET_NAME="bucketabcdef"

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

# 创建一个示例文件
echo "Hello World" > hello.txt

# 使用环境变量执行ossutil命令，并捕获输出
output=$(ossutil cp hello.txt oss://$OSS_BUCKET_NAME/path/to/hello.txt \
  --access-key $OSS_ACCESS_KEY_ID \
  --secret-key $OSS_SECRET_ACCESS_KEY \
  --endpoint $OSS_ENDPOINT 2>&1)

# 输出结果
echo "$output"

# 检查上传是否成功
if [ $? -eq 0 ]; then
  echo "File uploaded successfully."
else
  echo "Failed to upload file. Check the output for details."
fi
