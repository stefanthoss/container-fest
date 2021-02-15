# Container Fest

A collection of docker-compose files I'm using in my homelab. The Docker host is available on my local network via `docker.internal.example.com`.

## Archivebox

URL: <http://docker.internal.example.com:8000/>

A website archiving service. Change the environment variable `SEARCH_BACKEND_PASSWORD` (for both the `archivebox` and the `sonic` service) to a random password.

## Docker Swag

An Nginx reverse proxy that is used to generate and renew SSL certificates via Let's Encrypt. Change the environment variables `SUBDOMAINS` and `URL`. Check out the [documentation](https://github.com/linuxserver/docker-swag) for details on how to configure the Certbot validation method. The file in this repo uses DNS validation via Cloudflare. Change the environment variable `TZ` to your local timezone.

The SSL certificates for `docker.internal.example.com` get written to `docker-swag/config/etc/letsencrypt/live/docker.internal.example.com/` and can be used by other containers:

```
docker-swag/config/etc/letsencrypt/live/docker.internal.example.com/
├── cert.pem -> ../../archive/docker.internal.example.com/cert1.pem
├── chain.pem -> ../../archive/docker.internal.example.com/chain1.pem
├── fullchain.pem -> ../../archive/docker.internal.example.com/fullchain1.pem
├── priv-fullchain-bundle.pem
├── privkey.pem -> ../../archive/docker.internal.example.com/privkey1.pem
├── privkey.pfx
└── README
```

## Heimdall

URL: <https://docker.internal.example.com/>

A dashboard for self-hosted apps. Change the environment variable `TZ` to your local timezone.

## Home Assistant

URL: <http://docker.internal.example.com:8123/>

A home automation system. Change the environment variable `TZ` to your local timezone.

## Jellyfin

URL: <http://docker.internal.example.com:8096/>

A media server for music and videos. This service mounts two NFS shares to `/mnt/music` and `/mnt/videos`. Change the `volumes` section according to your own NFS shares.

## Netdata

URL: <http://docker.internal.example.com:19999/>

A tool for monitoring real-time system metrics. Change `VIRTUALIZATION=kvm` to the virtualization technology of your Docker host (I'm using `kvm` because I'm virtualizing with Proxmox).

## Portainer

URL: <https://docker.internal.example.com:9000/>

A Docker management UI, useful for debugging and monitoring.

## Sonos Samba

A Samba server that mounts a NFS share and exposes it read-only via the SMBv1 protocol. SMBv1 is outdated and insecure but unfortunately the only version of Samba that Sonos supports. Your main Samba server should have SMBv1 disabled and this Docker container can be used as a workaround for Sonos. Change the `volumes` section according to your own NFS share and change the environment variable `TZ` to your local timezone.
