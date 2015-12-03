# swift-docker
ubuntu:14.04 with Apple swift

## Quick start on OS X

```bash
brew install docker docker-machine
docker-machine create -d virtualbox dev
docker-machine start dev
eval "$(docker-machine env dev)"
```

## Usage

```bash
docker run -it letterer/swift-docker swift --version
> Swift version 2.2-dev (LLVM 46be9ff861, Clang 4deb154edc, Swift 778f82939c)
```
