#!/bin/bash

set -e

podman=podman
if ! which $podman; then
  podman=docker
fi

img_version=$1
registry=$2

if [ -z "${img_version}" ]; then
  echo "No image version was provided, aborting. Check script for usage."
  exit 1
fi

if [ -z "${registry}" ]; then
  registry=registry.prehensile-tales.com
fi

$podman push godot-export:${img_version} ${registry}/godot/export
$podman push godot-mono-glue:${img_version} ${registry}/godot/mono-glue
$podman push godot-windows:${img_version} ${registry}/godot/windows
$podman push godot-ubuntu-32:${img_version} ${registry}/godot/ubuntu-32
$podman push godot-ubuntu-64:${img_version} ${registry}/godot/ubuntu-64
$podman push godot-javascript:${img_version} ${registry}/godot/javascript
$podman push godot-xcode-packer:${img_version} ${registry}/godot/xcode-packer

$podman push godot-android:${img_version} ${registry}/godot-private/android
$podman push godot-ios:${img_version} ${registry}/godot-private/ios
$podman push godot-osx:${img_version} ${registry}/godot-private/macosx
$podman push godot-msvc:${img_version} ${registry}/godot-private/uwp
