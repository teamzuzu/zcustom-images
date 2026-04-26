#!/bin/bash
set -euo pipefail

DOWNLOAD_DIR="/mirror"
VERBOSE="${VERBOSE:-0}"

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*"
}

debug() {
    if [[ $VERBOSE -eq 1 ]]; then
        echo "[DEBUG] $*" >&2
    fi
}

download_ubuntu() {
  log "Downloading Ubuntu cloud image..."
  local release="resolute"
  local url="https://cloud-images.ubuntu.com/${release}/current/${release}-server-cloudimg-amd64.img"
	if ! [ -e "${DOWNLOAD_DIR}/ubuntu-${release}.img" ] ; then
    debug "Ubuntu URL: $url"
    curl -L -o "${DOWNLOAD_DIR}/ubuntu-${release}.img" "$url" 2>/dev/null
    log "✓ Downloaded: ubuntu-${release}.img"
  fi
}

# Debian: Get latest stable release
download_debian() {
    log "Downloading Debian cloud image..."
    local release="bookworm"  # Debian 12
    local url="https://cloud.debian.org/images/cloud/${release}/latest/debian-${release}-genericcloud-amd64.img"
		if ! [ -e "${DOWNLOAD_DIR}/debian-${release}.img" ] ; then
      debug "Debian URL: $url"
      curl -L -o "${DOWNLOAD_DIR}/debian-${release}.img" "$url" 2>/dev/null
      log "✓ Downloaded: debian-${release}.img"
    fi
}

download_fedora() {
    log "Downloading Fedora cloud image..."
    local release="39"
    local url="https://download.fedoraproject.org/pub/fedora/linux/releases/${release}/Cloud/x86_64/images/Fedora-Cloud-Base-${release}-1.6.x86_64.raw.xz"
	if ! [ -e "${DOWNLOAD_DIR}/fedora-${release}.img" ] ; then

    debug "Fedora URL: $url"
    if curl -L -f -o "${DOWNLOAD_DIR}/fedora-${release}.raw.xz" "$url" 2>/dev/null; then
        log "✓ Downloaded: fedora-${release}.raw.xz (compressed)"
        if command -v unxz &>/dev/null; then
            unxz "${DOWNLOAD_DIR}/fedora-${release}.raw.xz"
            mv "${DOWNLOAD_DIR}/fedora-${release}.raw" "${DOWNLOAD_DIR}/fedora-${release}.img"
            log "✓ Decompressed: fedora-${release}.img"
        fi
    else
        log "! Failed to download Fedora image"
    fi
  fi
}

# Arch Linux: Get latest release
download_arch() {
    log "Downloading Arch Linux cloud image..."
    local url="https://linuximages.blob.core.windows.net/arch/ArchLinux-cloudimg-latest.qcow2"

    # Arch provides qcow2; try Azure mirror for .img
    local img_url="https://mirror.pkgbuild.com/images/latest/Arch-cloudimg-latest.qcow2"
	if ! [ -e "${DOWNLOAD_DIR}/arch-latest.qcow2" ] ; then

    debug "Arch Linux URL: $url"
    if curl -L -f -o "${DOWNLOAD_DIR}/arch-latest.qcow2" "$url" 2>/dev/null; then
        log "✓ Downloaded: arch-latest.qcow2 (qcow2 format used)"
    else
        log "! Failed to download Arch image"
    fi
  fi
}

# Main
main() {
    if [[ ! -d "$DOWNLOAD_DIR" ]]; then
        mkdir -p "$DOWNLOAD_DIR"
        log "Created directory: $DOWNLOAD_DIR"
    fi

    log "Starting cloud image downloads to: $DOWNLOAD_DIR"

    download_ubuntu
    download_debian
    download_fedora
    download_arch

    log "✓ Download complete!"
    log "Images saved to: $DOWNLOAD_DIR"
    ls -lh "$DOWNLOAD_DIR"/*.{img,qcow2,raw} 2>/dev/null || true
    cd /mirror && python3 -m http.server 80
}

main "$@"
