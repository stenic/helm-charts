# Githooks

This project takes advantange of [git-hooks](https://github.com/git-hooks/git-hooks) to ensure code quality.

Whenever a commit is done, some quick and basic validations will be performed. 
See the `githooks` folder for more info.

## Requirements

 - [helm-docs](https://github.com/norwoodj/helm-docs)

## Installation

```bash
brew install norwoodj/tap/helm-docs
brew install git-hooks-go
```

## Enable

```bash
git hook install
```
