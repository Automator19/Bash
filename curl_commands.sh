# Check header of URI (s=Silent, D=dump header (displayheader), o=output )
curl -sD - -o /dev/null https://website.com/orders.asmx

# Check header of http URL 
# -L (location) flag will force curl to try with redirected URL. By default it does not redirect. Just say 301 moved permanently. 
curl -sD - -o /dev/null https://website.com/orders.asmx -L

# Check Cache is on or not
# Cache-control header shows no-store meaning cached is disabled.
curl -vosa -k " https://www.google.com/ 
