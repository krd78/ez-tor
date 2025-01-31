FROM alpine

ARG HASHED_PASSWORD

RUN apk update && apk add tor torsocks iputils-ping

RUN { \
        echo "DNSPort 5300"; \
        echo "TransPort 9090"; \
        echo "AutomapHostsOnResolve 1"; \
        echo "ControlPort 9051"; \
        echo "CookieAuthentication 1"; \
        echo "HashedControlPassword ${HASHED_PASSWORD}"; \
    } > /etc/tor/torrc

EXPOSE 9050/tcp

ENTRYPOINT [ \
  "/usr/bin/tor", \
  "-f", "/etc/tor/torrc", \
  "--RunAsDaemon", "0" \
]
