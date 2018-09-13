FROM debian:stretch

RUN apt-get update
RUN apt-get install -y tor torsocks iputils-ping

RUN { \
        echo "DNSPort 5300"; \
        echo "TransPort 9090"; \
        echo "AutomapHostsOnResolve 1"; \
    } > /etc/tor/torrc

USER debian-tor

ENTRYPOINT [ \
  "/usr/bin/tor", \
  "-f", "/etc/tor/torrc", \
  "--RunAsDaemon", "0" \
]
