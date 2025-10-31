# proxmox-datacenter-manager

container version of proxmox datacenter manager - untested ymmv

root password is set to proxmox

```services:
  proxmox-datacenter-manager:
    image: ghcr.io/teamzuzu/proxmox-datacenter-manager:main
    network_mode: host
```
