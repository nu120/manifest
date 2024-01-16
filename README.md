# git-repo manifest

- [Install repo tool](#install-repo-tool)
  - [ubuntu](#ubuntu)
  - [macOS](#macos)
- [Usage](#usage)
  - [Prepare working directories](#prepare-working-directories)
  - [Download using repo command](#download-using-repo-command)
    - [Option-A: With all git history (for developer, slow)](#option-a-with-all-git-history-for-developer-slow)
    - [Option-B: Without git history (for build machine, fast)](#option-b-without-git-history-for-build-machine-fast)
  - [Update to latest](#update-to-latest)
  - [Build](#build)

## Install repo tool

Reference: <https://gerrit.googlesource.com/git-repo/+/refs/heads/master/README.md#install>

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

### Prepare working directories

```sh
# Create cache directory
$ mkdir ~/cache

# Create working directory
$ mkdir workspace && cd workspace
```

### Download using repo command

#### Option-A: With all git history (for developer, slow)

```sh
# use default.xml manifest
$ repo init -u git@github.com:nu120/manifest
$ repo sync --fetch-submodules
```

#### Option-B: Without git history (for build machine, fast)

```sh
# use buildroot.xml manifest
$ repo init -u git@github.com:nu120/manifest -m buildroot.xml
$ repo sync --fetch-submodules
```

### Update to latest

After that, if you want to keep all repositories up-to-date, you can run the `repo sync` command as shown below.

```sh
# Update to latest
$ repo sync
```

### Build

All builds run inside docker containers, so you must have an environment where you can run docker.

The cache directory and the current directory are shared with the docker container via the `-v` option.

```sh
$ ./enter_buildenv.sh

root@ed46e5b49c32:/opt/buildroot# echo 8 | source ./buildroot/build/setenv.sh
root@ed46e5b49c32:/opt/buildroot# make
root@ed46e5b49c32:/opt/buildroot# exit
```

The generated image can be found in the path `output/mesonaxg_s420_32_release/images/aml_upgrade_package.img`.

### Manifest list

* `buildroot.xml` - NU120 product device
* `buildroot_evk_49.xml` - Linkplay EVK(Evaluation Kit) with Kernel 4.9
* `buildroot_evk_54.xml` - Linkplay EVK with Kernel 5.4

