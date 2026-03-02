FROM oven/bun:1-alpine

WORKDIR /app

# Install dependencies
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

# Copy source code
COPY . .

# Run
EXPOSE 3000
ENTRYPOINT ["bun", "run", "dev"]
