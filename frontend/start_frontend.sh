isInUse8080=$(lsof -ti:8080)

if ! [ -z "$isInUse8080" ]; then
    echo "8080 Port is in use"
    exit 0
fi

# Enforce ipv4 addressing
ForceIPv6=" --bind 127.0.0.1"
if [ "$1" = "ipv6" ]; then
  ForceIPv6=""
fi

# Start frontend processes
cd dist && python3 -m http.server 8080 $ForceIPv6