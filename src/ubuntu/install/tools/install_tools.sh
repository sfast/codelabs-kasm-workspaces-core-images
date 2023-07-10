#!/usr/bin/env bash
set -e

echo "Install some common tools for further installation"
if [[ "${DISTRO}" == @(centos|oracle7) ]] ; then
  yum install -y vim wget net-tools bzip2 python3 ca-certificates sudo curl
elif [[ "${DISTRO}" == @(fedora37|oracle8|oracle9|rockylinux9|rockylinux8|almalinux8|almalinux9) ]]; then
  dnf install -y wget net-tools bzip2 python3 tar vim hostname procps-ng sudo curl
  dnf clean all
elif [ "${DISTRO}" == "opensuse" ]; then
  sed -i 's/download.opensuse.org/mirrorcache-us.opensuse.org/g' /etc/zypp/repos.d/*.repo
  zypper install -yn wget net-tools bzip2 python3 tar vim gzip iputils sudo curl
  zypper clean --all
elif [ "${DISTRO}" == "alpine" ]; then
  apk add --no-cache \
    ca-certificates \
    curl \
    gcompat \
    grep \
    libgcc \
    mcookie \
    net-tools \
    openssh-client \
    openssl \
    shadow \
    sudo \
    tar \
    wget 
else
  apt-get update
  # Update tzdata noninteractive (otherwise our script is hung on user input later).
  DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
  apt-get install -y vim wget net-tools locales bzip2 wmctrl software-properties-common mesa-utils sudo curl
  apt-get autoclean 
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/* 

  echo "generate locales für en_US.UTF-8"
  locale-gen en_US.UTF-8
fi

if [ "$DISTRO" = "ubuntu" ]; then
  #update mesa to latest
  add-apt-repository ppa:kisak/turtle
  apt-get update
  apt full-upgrade -y
  apt-get autoclean 
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
fi


### Dooqod ###
# Updating the novnc forked from Kasm fork of novnc ...

# Repo: https://github.com/sfast/codelabs-novnc/releases/tag/dk8-v1.1.1
# Replacing original files under kasmweb with new ones from our release tag.
# We made copy paste and customized some more things like loaders etc ...

mv /usr/share/kasmvnc/www  mv /usr/share/kasmvnc/www-original-bak

mkdir /usr/share/kasmvnc/www

curl -o /tmp/dooqod-novnc-dk8-v1.1.1.tar.gz http://scripts.dooqod.com/v3/distrib/novnc/dooqod-novnc-dk8-v1.1.1.tar.gz

tar -C /usr/share/kasmvnc/www --strip-components=1 -xzf /tmp/dooqod-novnc-dk8-v1.1.1.tar.gz

rm -f /tmp/dooqod-novnc-dk8-v1.1.1.tar.gz


