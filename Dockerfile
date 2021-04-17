FROM caddy:2.4.0-beta.2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/kirsch33/realip \
    --with github.com/hairyhenderson/caddy-teapot-module \
    --with github.com/greenpau/caddy-auth-portal \
    --with github.com/greenpau/caddy-auth-jwt

FROM caddy:2.4.0-beta.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
