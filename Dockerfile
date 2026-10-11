FROM python:3.11-slim

WORKDIR /app

# 从 GitHub 直接安装（官方推荐方式）
RUN pip install --no-cache-dir "git+https://github.com/moonlin1213/cove-sticker-mcp.git@main"

EXPOSE 8080

# 官方命令名是 cove-sticker-mcp，sticker-mcp 是兼容旧名
CMD ["sh", "-c", "cove-sticker-mcp serve-http --host 0.0.0.0 --port ${PORT:-8080}"]
