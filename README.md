# cert-updater

Cert update container for [letsencrypt-wwlabs.space](https://wiki.westwoodlabs.de/letsencrypt-wwlabs.space).

## Docker Compose Example

```docker-compose
  cert-updater:
    container_name: traefik-certupdate
    build: ./cert-updater
    volumes:
      - ./data/:/data
      - ./config/traefik_dynamic.yml:/traefik_dynamic.yml
    restart: always
    environment:
      CERT_WEB: https://cert.wwlabs.space/letsencrypt/fullchain.pem
      CERT_LOCAL: /data/wwlabs.space.pem
      TRAEFIK_DYNAMIC: /traefik_dynamic.yml
      CHECK_INTERVAL: 3600
```
