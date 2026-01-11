FROM --platform=linux/amd64 node:14-bullseye

# 安装 SSH 客户端并清理缓存
RUN apt-get update && apt-get install -y openssh-client && rm -rf /var/lib/apt/lists/*

# 提前扫描 GitHub 的指纹，防止 push 时弹出询问
RUN mkdir -p -m 0700 /root/.ssh && ssh-keyscan github.com >> /root/.ssh/known_hosts
WORKDIR /app

# 利用缓存安装依赖
COPY package.json package-lock.json* ./
RUN npm install

COPY . .

EXPOSE 8080

CMD ["sh", "-c", "npm cache clean --force && npm run deploy && git branch"]
