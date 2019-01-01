# ez-tor
Easy way to run tor in a dockerized environment.

## Building step
```
cd ez-tor/
docker build -t ez-tor .
```

## Running step
```
docker run --net=host ez-tor
```

## FAQ


* *How to manually change my tor IP address ?*
```
echo -e 'AUTHENTICATE "PASSWORD"\nSIGNAL NEWNYM\nQUIT' | nc 127.0.0.1 9051
    250 OK
    250 OK
    250 closing connection
```


* *What are the used port ?*

```
TCP:9050 => Tor socks5 proxy
TCP:9051 => Tor control protocol
TCP:9090 => Tor transport port 
```


* *How to configure my browser ?*


There are lots of possibilities (firefox is used but you can replace it by chromium-browser or else):


1. Using torsocks:
```
apt install torsocks
torsocks firefox <URL>
```


2. Using configuration:


Configure 127.0.0.1:9050 as socks5 or http proxy in your browser


3. Using proxychains:
```
apt install proxychains
echo -e "socks5\t127.0.0.1\r9050" | tee -a /etc/proxychains
proxychains firefox
```

## More information

* You'll be able to resolve onion hostnames with a good configured browser
* Minimal logs are sent to the stdout of the container
