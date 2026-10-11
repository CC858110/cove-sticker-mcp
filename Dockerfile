FROM python:3.11-slim

WORKDIR /app

# 复制项目全部文件
COPY . .

# 从源码安装项目（会自动处理 pyproject.toml 里声明的依赖）
RUN pip install --no-cache-dir .

# Zeabur 会注入 PORT 环境变量
EXPOSE 8080

# 启动 HTTP 服务，监听所有网络接口
# 注意：命令名是 cove-sticker-mcp，不是 sticker-mcp
CMD ["sh", "-c", "cove-sticker-mcp serve-http --host 0.0.0.0 --port ${PORT:-8080}"]
