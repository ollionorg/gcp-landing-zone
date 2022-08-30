# Check if ports are ready to use
isInUse9000=$(lsof -ti:9000)


if ! [ -z "$isInUse9000" ]; then
    echo "9000 Port is in use"
    exit 0
fi

# Start backend processes
python3 index.py