#!/usr/bin/env bash
set -euo pipefail
echo "Building Custom Guix Image..."
params=(
  -f docker
  --save-provenance
  -m /workdir/manifest.scm
  --compression=xz
  -r /workdir/guix-container-tools.tar.xz
)
if [ -f /workdir/channels.scm ]; then
  guix time-machine -C /workdir/channels.scm -- pack "${params[@]}"
else
  guix pack "${params[@]}"
fi
TARGET=$(readlink -f /workdir/guix-container-tools.tar.xz)
cp "$TARGET" /workdir/guix-container-tools.tar.xz
echo "✓ Image created: /workdir/guix-container-tools.tar.xz"
ls -lh /workdir/guix-container-tools.tar.xz
