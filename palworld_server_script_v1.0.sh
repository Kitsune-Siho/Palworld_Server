#!/bin/bash

# display the current time in KST
echo_ct_kst() {
    echo "TIME: $(TZ='Asia/Seoul' date +'%y-%m-%d-%H-%M-%S')"
}

# start the palworld-server Docker container
start_palworld() {
    echo "Starting Palworld Server..."
    echo_ct_kst
    sudo docker start palworld-server
    sleep 15
    echo "Palworld Server start successfully!"
}

# Function to stop the palworld-server Docker container
stop_palworld() {
    echo "Stopping Palworld Server..."
    echo_ct_kst
    sudo docker exec -i palworld-server rcon-cli save
    sleep 10
    echo "World save complete."
    sudo docker exec -i palworld-server rcon-cli shutdown
    echo "Server will shut down after 30 seconds."
    sleep 31
    sudo docker stop palworld-server
    echo "Palworld Server stop successfully!"
    echo_ct_kst
}

# Main logic to call functions based on passed argument
case "$1" in
    start)
        start_palworld
        ;;
    stop)
        stop_palworld
        ;;
    *)
        echo "Unknown Command. select this one: $0 {start|stop}"
        exit 1
        ;;
esac

