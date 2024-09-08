# 5th_CICD_project
Practice CICD project by myself

項目目標:
當代碼提交至github倉庫時時，會觸發DevOps複製提交的檔案並上傳至OSS
案例中設定的是指定檔案名稱才會轉發
同時設定了在轉發時自動修改檔案名稱再轉發到OSS

在DevOps執行命令中加入以下兩行命令即可:
chmod +x run_py3.sh
./run_py3.sh
