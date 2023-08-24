# Created by AKSHATH JAYAKUMAR

get_ip_info() {
    ip_address="$1"
    url="http://ipinfo.io/${ip_address}/json?token=582f3ac7bf54af"

    response=$(curl -s "$url")
    echo "$response"
}

open_google_maps() {
    lat="$1"
    lon="$2"
    xdg-open "https://www.google.com/maps/place/${lat},${lon}"
}

display_ip_info() {
    ip_info="$1"
    if [[ "$ip_info" ]]; then
        echo -e "\e[38;5;214mIP Address:\e[0m $(echo "$ip_info" | jq -r '.ip')"
        echo -e "\e[38;5;214mLocation:\e[0m $(echo "$ip_info" | jq -r '.city + ", " + .region + ", " + .country')"
        echo -e "\e[38;5;214mCoordinates:\e[0m $(echo "$ip_info" | jq -r '.loc')"
        echo -e "\e[38;5;214mPostal Code:\e[0m $(echo "$ip_info" | jq -r '.postal // "N/A"')"
        echo -e "\e[38;5;214mTimezone:\e[0m $(echo "$ip_info" | jq -r '.timezone // "N/A"')"
        echo -e "\e[38;5;214mISP:\e[0m $(echo "$ip_info" | jq -r '.org // "N/A"')"
        
        loc=$(echo "$ip_info" | jq -r '.loc')
        if [[ "$loc" ]]; then
            lat_lon=($(echo "$loc" | tr ',' ' '))
            if [[ ${#lat_lon[@]} -eq 2 ]]; then
                lat="${lat_lon[0]}"
                lon="${lat_lon[1]}"
                open_google_maps "$lat" "$lon"
            fi
        else
            echo -e "\e[91mCoordinates not available.\e[0m"
        fi
    else
        echo -e "\e[91mError fetching data.\e[0m"
    fi
}

main() {
    echo -e "\e[38;5;49m    ._____________        ___________                     __                        \e[0m"
    echo -e "\e[38;5;49m    |   \______   \       \__    ___/___________    ____ |  | __ ___________ \e[0m"
    echo -e "\e[38;5;49m    |   ||     ___/  ______ |    |  \_  __ \__  \ _/ ___\|  |/ // __ \_  __ \ \e[0m"
    echo -e "\e[38;5;49m    |   ||    |     /_____/ |    |   |  | \// __ \\  \___|    <\  ___/|  | \/ \e[0m"
    echo -e "\e[38;5;49m    |___||____|             |____|   |__|  (____  /\___  >__|_ \\\___  >__|    \e[0m"
    echo -e "\e[38;5;49m                                                \/     \/     \/    \/           \e[0m"
    echo -e "\e[38;5;49m  ------------------------------------------------------------------------------\e[0m"
    echo -e "\e[38;5;49m                                               Akshath Jayakumar\e[0m"
    
    read -p "Enter IP Address: " target_ip
    ip_info=$(get_ip_info "$target_ip")
    display_ip_info "$ip_info"
}

main

