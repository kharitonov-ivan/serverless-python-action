# base python image bc installing a specific version of node is easier than python
FROM python:3.7-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/serverless/github-action"
LABEL homepage="https://github.com/serverless/github-action"
LABEL maintainer="Serverless, Inc. <hello@serverless.com> (https://serverless.com)"

LABEL "com.github.actions.name"="GitHub Action for Serverless Framework"
LABEL "com.github.actions.description"="Wraps the Serverless Frameork to enable common Serverless commands."
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"

# Install curl & xz (to install node below)
RUN apt update && apt install -y curl xz-utils && rm -rf /var/lib/apt/lists/*

# Install node
RUN curl https://nodejs.org/dist/v10.15.1/node-v10.15.1-linux-x64.tar.xz | tar xJ -C /opt
ENV PATH="/opt/node-v10.15.1-linux-x64/bin:${PATH}"

# Install pipenv
RUN pip3 install pipenv

RUN npm i -g serverless

ENTRYPOINT ["serverless"]
