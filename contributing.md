# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test amazon-ecr-credential-helper https://github.com/matt-e/asdf-amazon-ecr-credential-helper.git "docker-credential-ecr-login -v"
```

Tests are automatically run in GitHub Actions on push and PR.
