FROM ubuntu:14.04
MAINTAINER Oliver Letterer, oliver.letterer@sparrow-labs.de

ENV SWIFT_VERSION 2.2-SNAPSHOT-2015-12-01-b
ENV SWIFT_PLATFORM ubuntu14.04

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential wget clang libedit-dev python2.7 python2.7-dev libicu52 && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
RUN gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

RUN wget https://swift.org/builds/ubuntu1404/swift-$SWIFT_VERSION/swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz && \
    wget https://swift.org/builds/ubuntu1404/swift-$SWIFT_VERSION/swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz.sig && \
    gpg --verify swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz.sig && \
    tar xzf swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz && \
    rm swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz.sig

ENV PATH /swift-$SWIFT_VERSION-$SWIFT_PLATFORM/usr/bin:"${PATH}"
