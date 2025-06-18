# Use Node.js 22 Alpine as the base image
FROM node:22-alpine

# Enable Corepack to allow usage of pnpm and other package managers
RUN corepack enable

# Optionally lock the pnpm version to ensure consistent builds
RUN corepack prepare pnpm@10.12.1 --activate

# Set working directory
WORKDIR /app

# # Copy only dependency files first for layer caching
# COPY package.json pnpm-lock.yaml ./

# # Install dependencies using pnpm
# RUN pnpm set registry https://registry.npmmirror.com

# RUN pnpm install

# # Copy the rest of the application code
# COPY . .

# # Build project (optional, for production)
# RUN pnpm build

# # Expose the development port
# EXPOSE 3000

# Default command: interactive shell
CMD ["sh"]
