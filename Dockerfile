FROM debian:stretch

RUN apt-get update
RUN apt-get install -y tor torsocks iputils-ping

RUN { \
        echo "DNSPort 5300"; \
        echo "TransPort 9090"; \
        echo "AutomapHostsOnResolve 1"; \
        echo "ControlPort 9051"; \
        echo "CookieAuthentication 1"; \
        echo "HashedControlPassword CHANGE:IT:WITH:HASH"; \
    } > /etc/tor/torrc

USER debian-tor

ENTRYPOINT [ \
  "/usr/bin/tor", \
  "-f", "/etc/tor/torrc", \
  "--RunAsDaemon", "0" \
]
