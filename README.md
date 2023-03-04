# Container Fest

A collection of docker-compose files I'm using in my homelab.

`docker.example.com` and all other subdomains used (e.g. `grafana.example.com` or `traefik.example.com`) should resolve to the Docker host machine. You can configure your local DNS server to resolve `*.example.com` to the host's IP.

I use Traefik to route incoming traffic. It will request SSL certificates via ACME from Let's Encrypt and use those locally. The `traefik` labels on each container configures the routing.

All containers can be updated by executing `bash ./update-all.sh` in the Container Fest root directory. This script pulls the latest Docker images, restarts the containers, and removes unused Docker images from the host system to save space.

## Air Quality Bridge

Forwards data from an air quality sensor to Home Assistant via MQTT. See https://github.com/stefanthoss/air-quality-bridge.

## amcrest2mqtt

Forwards data from an Amcrest doorbell to Home Assistant via MQTT. See https://github.com/dchesterton/amcrest2mqtt.

## Archivebox

URL: <http://docker.example.com:8000>

A website archiving service. Change the environment variable `SEARCH_BACKEND_PASSWORD` (for both the `archivebox` and the `sonic` service) to a random password.

## Calibre

URL: <https://calibre.example.com> and <https://calibre-web.example.com>

E-book server. This deployment contains both the linuxserver.io Calibre container and the Calibre Web interface.

## Dashy

URL: <https://dashy.example.com>

Dashboarding app for all my self-hosted services. See https://dashy.to/docs/quick-start/ for a quick-start guide.

## Frigate

URL: <https://frigate.example.com>

An NVR with AI object detection. Needs a `config.yml` file as described on https://docs.frigate.video/configuration/index.

## Grafana / Loki / Promtail

URL: <https://grafana.example.com>

A monitoring and visualization platform, including log aggregation.

## InfluxDB

URL: <https://influxdb.example.com>

A time series database to store metrics and sensor data. The data can be visualized with Grafana.

## Jellyfin

URL: <https://jellyfin.example.com>

A media server for music and videos. This container mounts the read-only Samba share `//192.168.1.8/videos` for the video files.

## Jupyter

URL: <https://docker.example.com:8888>

Jupyter notebook server with a data science environment.

## LibreSpeed

URL: <http://docker.example.com:8010>

A self-hosted speedtest website for your local network.

## Paperless

URL: <https://paperless.example.com:>

A document management system. This container mounts the Samba share `//192.168.1.8/documents` for storing documents.

## Portainer

URL: <https://portainer.example.com>

A Docker management UI, useful for debugging and monitoring.

## Scrutiny

URL: <https://scrutiny.example.com>

A web UI for SMART monitoring of hard drives and SSDs. Needs a collector agent to collect the SMART data. See <https://blog.stefandroid.com/2022/01/14/smart-scrutiny.html> for a detailed description.

## SmokePing

URL: <https://smokeping.example.com>

A latency measurement tool. See https://oss.oetiker.ch/smokeping/doc/smokeping_config.en.html for the configuration documentation.

## Sonos Samba

A Samba server that mounts a NFS share and exposes it read-only via the SMBv1 protocol. SMBv1 is outdated and insecure but unfortunately the only version of Samba that Sonos supports. Your main Samba server should have SMBv1 disabled and this Docker container can be used as a workaround for Sonos. Change the `volumes` section according to your own NFS share and change the environment variable `TZ` to your local timezone.

## Tautulli

URL: <https://tautulli.example.com>

A web application for monitoring, collecting statistics, and analyzing usage of a Plex Media Server.

## Traefik

URL: <https://traefik.example.com>

A reverse proxy that is used to generate and renew SSL certificates via Let's Encrypt and forward traffic to the appropriate containers. See https://doc.traefik.io/traefik/https/acme/ for how to configure the SSL certificates (you should use a DNS challenge for the internal hostnames).

Set `traefik.http.middlewares.traefik-auth.basicauth.users` based on the instructions at https://doc.traefik.io/traefik/middlewares/http/basicauth/.
