# Container Fest

A collection of docker-compose files I'm using in my homelab.

## Archivebox

A website archiving service. Change the environment variable `SEARCH_BACKEND_PASSWORD` (for both the `archivebox` and the `sonic` service) to a random password.

## Heimdall

A dashboard for self-hosted apps. Change the environment variable `TZ` to your local timezone.

## Home Assistant

A home automation system. Change the environment variable `TZ` to your local timezone.

## Jellyfin

A media server for music and videos. This service mounts two NFS shares to `/mnt/music` and `/mnt/videos`. Change the `volumes` section according to your own NFS shares.

## Netdata

A tool for monitoring real-time system metrics. Change `VIRTUALIZATION=kvm` to the virtualization technology of your Docker host (I'm using `kvm` because I'm virtualizing with Proxmox).

## Portainer

A Docker management UI.

## Sonos Samba

A Samba server that mounts a NFS share and exposes it read-only via the SMBv1 protocol. SMBv1 is outdated and insecure but unfortunately the only version of Samba that Sonos supports. Your main Samba server should have SMBv1 disabled and this Docker container can be used as a workaround for Sonos. Change the `volumes` section according to your own NFS share and change the environment variable `TZ` to your local timezone.
