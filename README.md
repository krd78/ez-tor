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

## More information

* You'll be able to resolve onion hostnames with a good configured browser
* Minimal logs are sent to the stdout of the container
