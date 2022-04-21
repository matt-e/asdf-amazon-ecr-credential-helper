<div align="center">

# asdf-amazon-ecr-credential-helper [![Build](https://github.com/matt-e/asdf-amazon-ecr-credential-helper/actions/workflows/build.yml/badge.svg)](https://github.com/matt-e/asdf-amazon-ecr-credential-helper/actions/workflows/build.yml) [![Lint](https://github.com/matt-e/asdf-amazon-ecr-credential-helper/actions/workflows/lint.yml/badge.svg)](https://github.com/matt-e/asdf-amazon-ecr-credential-helper/actions/workflows/lint.yml)


[amazon-ecr-credential-helper](https://github.com/awslabs/amazon-ecr-credential-helper) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.

# Install

Plugin:

```shell
asdf plugin add amazon-ecr-credential-helper
# or
asdf plugin add amazon-ecr-credential-helper https://github.com/matt-e/asdf-amazon-ecr-credential-helper.git
```

amazon-ecr-credential-helper:

```shell
# Show all installable versions
asdf list-all amazon-ecr-credential-helper

# Install specific version
asdf install amazon-ecr-credential-helper latest

# Set a version globally (on your ~/.tool-versions file)
asdf global amazon-ecr-credential-helper latest

# Now amazon-ecr-credential-helper commands are available
docker-credential-ecr-login -v
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/matt-e/asdf-amazon-ecr-credential-helper/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Matthew Eddey](https://github.com/matt-e/)
