# Retag Correspondents

```bash
docker exec -ti paperless-ngx_webserver_1 python /usr/src/paperless/src/manage.py document_retagger -c
```

# Export / Backup

```bash
docker exec -ti paperless-ngx_webserver_1 python /usr/src/paperless/src/manage.py document_exporter /tmp/export/dir/ -c -d
```
