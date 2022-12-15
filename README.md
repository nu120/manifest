# git-repo manifest

## Install repo tool

<https://gerrit.googlesource.com/git-repo/+/refs/heads/master/README.md#install>

### ubuntu

Prerequisites:

- curl
- python3

```sh
curl https://storage.googleapis.com/git-repo-downloads/repo > repo
chmod 755 repo
sudo mv repo /usr/bin
```

### macOS

```sh
brew install repo
```

## Usage

```sh
# Create working directory
$ mkdir workspace && cd workspace

# Download sources using `repo` command
$ repo init -u git@github.com:nu120/manifest
$ repo sync
```
