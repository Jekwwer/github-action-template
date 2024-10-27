# .devcontainer/Dockerfile: Sets up the development container for the project.

# Use the existing devcontainer image as the base
FROM mcr.microsoft.com/devcontainers/javascript-node:20

# Set environment variable to non-interactive mode for apt-get installations
ENV DEBIAN_FRONTEND=noninteractive

# Define ARGs for the version of each package
ARG PYTHON_PIP_VERSION=23.0.1+dfsg-1
ARG PYTHON_VENV_VERSION=3.11.2-1+b1
ARG RUBY_VERSION=1:3.1
ARG CURL_VERSION=7.88.1-10+deb12u7
ARG HADOLINT_VERSION=v2.12.0
ARG YARN_VERSION=1.22.22

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pip=${PYTHON_PIP_VERSION} python3-venv=${PYTHON_VENV_VERSION} ruby-full=${RUBY_VERSION} curl=${CURL_VERSION} && \
    curl -o /usr/local/bin/hadolint -L https://github.com/hadolint/hadolint/releases/download/${HADOLINT_VERSION}/hadolint-Linux-x86_64 && \
    chmod +x /usr/local/bin/hadolint && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up a virtual environment specifically for pre-commit
RUN python3 -m venv /opt/precommit-env && \
    /opt/precommit-env/bin/pip install --upgrade pip && \
    /opt/precommit-env/bin/pip install pre-commit

# Add virtual environment to PATH
ENV PATH="/opt/precommit-env/bin:$PATH"

# Install yarn globally
RUN npm install -g yarn@${YARN_VERSION}

# Set working directory
WORKDIR /workspace

# Copy package.json files to install dependencies using yarn
COPY package*.json ./

# Install dependencies with yarn and clear cache
RUN yarn install && yarn cache clean
