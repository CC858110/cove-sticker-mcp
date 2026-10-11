FROM python:3.11-slim

WORKDIR /app

# 复制项目全部文件
COPY . .

# 从 GitHub 源码安装（项目尚未发布到 PyPI）
RUN pip install --no-cache-dir .

# Zeabur 会注入 PORT 环境变量
EXPOSE 8080

# 启动 HTTP 服务，监听所有网络接口
CMD ["sh", "-c", "sticker-mcp serve-http --host 0.0.0.0 --port ${PORT:-8080}"]
