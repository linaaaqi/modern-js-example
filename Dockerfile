FROM node:lts-alpine
# Update
RUN apk add --no-cache libc6-compat
RUN apk update

# Install pnpm
RUN npm install -g pnpm

# Install git
RUN apk add --no-cache git

# Configure pnpm global
ENV PNPM_HOME=/app/pnpm
ENV PNPM_PATH=$PNPM_HOME/.pnpm
ENV PATH=$PATH:$PNPM_PATH

COPY . /app

# Set working directory
WORKDIR /app

ENTRYPOINT ["pnpm", "install", "-f" ]
