#!/bin/bash
set -euo pipefail

DOWNLOAD_DIR="/mirror"
VERBOSE="${VERBOSE:-0}"

log() {
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*"
}

download_ubuntu() {
  local release="resolute"
  local url="https://cloud-images.ubuntu.com/${release}/current/${release}-server-cloudimg-amd64.img"
	if ! [ -e "${DOWNLOAD_DIR}/ubuntu-${release}.img" ] ; then
    log "Downloading Ubuntu cloud image..."
    curl -L -o "${DOWNLOAD_DIR}/ubuntu-${release}.img" "$url" 2>/dev/null
    log "✓ Downloaded: ubuntu-${release}.img"
  fi
}

download_debian() {
  local release="bookworm"  # Debian 12
  local url="https://cloud.debian.org/images/cloud/${release}/latest/debian-${release}-genericcloud-amd64.img"
	if ! [ -e "${DOWNLOAD_DIR}/debian-${release}.img" ] ; then
    log "Downloading Debian cloud image..."
    curl -L -o "${DOWNLOAD_DIR}/debian-${release}.img" "$url" 2>/dev/null
    log "✓ Downloaded: debian-${release}.img"
  fi
}

main() {

  download_ubuntu
  download_debian

  log "✓ startup complete!"
  ls -lh "$DOWNLOAD_DIR"/*.{img,qcow2,raw} 2>/dev/null || true
  cd /mirror && python3 -m http.server 80
}

main "$@"
