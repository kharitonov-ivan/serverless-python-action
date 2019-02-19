# GitHub Action for Serverless with Python

This Action wraps the [Serverless Framework](https://serverless.com), pip, pipenv,
and poetry to enable common Serverless commands in python projects.

## Usage
An example workflow to deploy a python project with serverless:


```
workflow "Deploy master branch" {
  on = "push"
  resolves = ["serverless deploy"]
}

action "master branch only" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "npm install" {
  uses = "actions/npm@master"
  args = "install"
  needs = ["master branch only"]
}

action "serverless deploy" {
  uses = "dschep/serverless-python-action@master"
  args = "deploy"
  needs = ["npm install"]
  secrets = ["AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY"]
}
```

### Secrets

* `AWS_ACCESS_KEY_ID` - **Required**. The AWS Access Key ID
* `AWS_SECRET_ACCESS_KEY` - **Required**. The AWS Secret Access Key


## License

The Dockerfile and associated scripts and documentation in this project are released under the Apache-2 license.
