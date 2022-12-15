# git-repo manifest

- [Install repo tool](#install-repo-tool)
  - [ubuntu](#ubuntu)
  - [macOS](#macos)
- [Usage](#usage)
  - [Prepare all sources](#prepare-all-sources)
  - [Build](#build)

## Install repo tool

<https://gerrit.googlesource.com/git-repo/+/refs/heads/master/README.md#install>

### ubuntu

Prerequisites:

- curl
- python3 (python-is-python3)

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

### Prepare all sources

```sh
# Create working directory
$ mkdir workspace && cd workspace

# Download sources using `repo` command
$ repo init -u git@github.com:nu120/manifest
$ repo sync
```

If you have already downloaded the source code through the `repo` command and want to update all repositories to the latest, just run `repo sync` as shown below.

```sh
# Update to latest
$ repo sync
```

### Build

```sh
$ ./enter_buildenv.sh

root@ed46e5b49c32:/opt/buildroot# echo 8 | source ./buildroot/build/setenv.sh
root@ed46e5b49c32:/opt/buildroot# make
root@ed46e5b49c32:/opt/buildroot# exit
```
