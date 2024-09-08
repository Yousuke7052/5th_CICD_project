import os
import subprocess

# OSS相关环境变量
OSS_ACCESS_KEY_ID = os.getenv('OSS_ACCESS_KEY_ID')
OSS_SECRET_ACCESS_KEY = os.getenv('OSS_SECRET_ACCESS_KEY')
OSS_ENDPOINT = os.getenv('OSS_ENDPOINT')
OSS_BUCKET_NAME = os.getenv('OSS_BUCKET_NAME')

def upload_file_to_oss(file_path, destination_path):
    try:
        subprocess.run([
            'ossutil', 'cp', file_path,
            f'oss://{OSS_BUCKET_NAME}/{destination_path}',
            '--access-key-id', OSS_ACCESS_KEY_ID,
            '--access-key-secret', OSS_SECRET_ACCESS_KEY,
            '--endpoint', OSS_ENDPOINT
        ], check=True)
        print(f"File {file_path} uploaded to OSS successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to upload file {file_path}: {e}")

if __name__ == '__main__':
    # 假设你要上传的是名为myfile.txt的文件
    file_path = 'path/to/your/myfile.txt'  # 这里的路径应该是相对于工作目录的相对路径
    destination_path = 'path/to/destination/myfile.txt'
    
    # 检查文件是否存在
    if os.path.exists(file_path):
        upload_file_to_oss(file_path, destination_path)
    else:
        print(f"File {file_path} does not exist.")
