FROM oven/bun:1-alpine AS builder
WORKDIR /app

# Install dependencies
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

# Copy source code and build project
COPY . .
RUN bun run build

FROM oven/bun:1-alpine
WORKDIR /app

# Install only production dependencies
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile --production

# Copy built application and run as non-privileged user
COPY --from=builder /app/build ./build
# USER nobody:nobody
EXPOSE 3000
ENTRYPOINT ["bun", "run", "./build/index.js"]
