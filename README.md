# docker-postfix-foward
Docker image to receive email for your domains, and forward them to other addresses.


## Usage

Before running, set up the forwarding rules:
- In docker-compose.yml, change the DOMAINS environment variable to your list of domains.
- In virtual, set up the email forwarding rules. For more details see the [postfix mail forwarding documentation](http://postfix.cs.utah.edu/VIRTUAL_README.html#forwarding).

Then start the container by running:
``` shell
docker-compose up -d
```
