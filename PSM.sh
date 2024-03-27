#!/bin/bash

# display the Current time in KST
echo_ct_kst() {
    echo "TIME: $(TZ='Asia/Seoul' date +'%y-%m-%d-%H-%M-%S')"
}

# Start Palworld server docker container
start_palworld() {
    echo "Starting Palworld Server..."
    echo_ct_kst
    sudo docker start palworld-server
    sleep 15
    echo "Palworld Server start successfully."
}

# Stop Palworld server docker container
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
    echo "Palworld Server stop successfully."
}

# Backup Palworld save files
backup_palworld() {
    echo_ct_kst
    echo "Archiving Palworld Server save files..."
    sleep 5
    TIMESTAMP=$(TZ='Asia/Seoul' date +'%y-%m-%d-%H-%M-%S')
    cd /home/user/Server/PalWorld/serverfile/palworld/Pal && zip -r /home/user/Server/PalWorld/backups/${TIMESTAMP}-palworld-saved.zip Saved/
    echo "Archiving Completed."

}

# Main logic to call functions based on passed argument
case "$1" in
    start)
        start_palworld
        ;;
    stop)
        stop_palworld
        ;;
    backup)
        backup_palworld
        ;;
    *)
        echo "Unknown Command. select this one: $0 {start|stop|backup}"
        exit 1
        ;;
esac

