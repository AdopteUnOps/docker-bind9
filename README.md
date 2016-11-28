docker-bind9
================
This project build a bind9 domain name server configured to serve and accept updates for the root domain $BIND9_ROOTDOMAIN env variable.

Use the following ENV when running :
- "BIND9_IP" : public IP of the DNS
- "BIND9_ROOTDOMAIN" : the root domain (like : example.com)
- "BIND9_KEYNAME" : the name of the key
- "BIND9_KEY" : the key base64 encoded
- "BIND9_FORWARDERS" : the forwarders (like : 8.8.8.8;8.8.8.4;)
- "BIND9_IPV4ONLY" : set bind9 to support only IPV4
- "BIND9_SOA_SERIAL" : a number of seconds before the zone should be refreshed (not an obligation as this image support update DNS)
- "BIND9_SOA_REFRESH" : number of seconds before the zone should be refreshed
- "BIND9_SOA_RETRY" : number of seconds before a failed refresh should be retried
- "BIND9_SOA_EXPIRE" : upper limit in seconds before a zone is considered no longer authoritative
- "BIND9_SOA_NEGATIVE_TTL" : negative result TTL (for example, how long a resolver should consider a negative result for a subdomain to be valid before retrying)

The port 53 must be exposed in tcp and udp to answer DNS requests. The server will accept any query, cache request, this is unsecure, be sure to know what you are doing.

Run with :
sudo docker run -e "BIND9_IP=10.10.12.23" -e "BIND9_ROOTDOMAIN=example.com" -e "BIND9_KEYNAME=secret" -e "BIND9_KEY=c2VjcmV0"  -e "BIND9_FORWARDERS=8.8.8.8;8.8.4.4;" -p 53:53/udp -p 53:53 digitallumberjack/docker-bind9:latest
