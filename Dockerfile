# 使用 Node.js 22 作为基础镜像
FROM node:22-slim

# 设置工作目录
WORKDIR /app

# 首先只复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制项目文件（.dockerignore 会自动排除 .env 文件）
COPY . .

# 构建应用
RUN npm run build

# 暴露端口（默认为3300，根据README中的说明）
EXPOSE 3300

# 设置环境变量
ENV NODE_ENV=production \
    PORT=3300

# 启动应用
CMD ["npm", "run", "start"]
