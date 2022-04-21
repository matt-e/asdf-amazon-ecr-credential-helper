#!/usr/bin/env bash

set -euo pipefail

# TODO: Ensure this is the correct GitHub homepage where releases can be downloaded for amazon-ecr-credential-helper.
GH_REPO="https://github.com/awslabs/amazon-ecr-credential-helper"
TOOL_NAME="amazon-ecr-credential-helper"
BIN_NAME="docker-credential-ecr-login"
TOOL_TEST="${BIN_NAME} -v"
BUCKET="https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//' |
    grep -v '/'
}

list_all_versions() {
  list_github_tags
}

download_release() {
  local version filename url platform arch
  version="$1"
  filename="$2"

  platform="$(uname | tr '[:upper:]' '[:lower:]')"

  arch="$(uname -m)"
  if [[ "$arch" == "x86_64" ]]; then
    arch="amd64"
  fi

  # TODO: Adapt the release URL convention for amazon-ecr-credential-helper
  url="${BUCKET}/${version}/${platform}-${arch}/${BIN_NAME}"

  echo "* Downloading $TOOL_NAME release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"
    cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

    # TODO: Asert amazon-ecr-credential-helper executable exists.
    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
