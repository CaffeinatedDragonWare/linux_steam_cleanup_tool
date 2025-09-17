#!/bin/bash
declare -a drives=()
declare -a games=()
declare shaders_deleted="false"
declare compatdata_deleted="false"

drives+=($(ls -1 /run/media/$USER))
drives+=("internal")

for drive in "${drives[@]}"; do
    if [[ "$drive" == "internal" ]]; then
        steampath="/home/$USER/.steam/steam/steamapps"
    else
        steampath="/run/media/$USER/$drive/SteamLibrary/steamapps"
    fi
    
    # Check if the path exists
    if [[ -d "$steampath" ]]; then
        for manifest in "$steampath"/appmanifest_*.acf; do
            appid=$(basename "$manifest" | sed -E 's/appmanifest_([0-9]+)\.acf/\1/')
            name=$(grep '"name"' "$manifest" | head -1 | sed 's/.*"\s*name"\s*"\(.*\)"/\1/')
            games+=("$appid: $name")
        done
    fi
done

choice=$(zenity --list \
    --title="Select a Game" \
    --column="Games" \
    --width=400 --height=700 \
    --print-column=1 \
    < <(for game in "${games[@]}"; do echo "$game"; done))
    
if [[  "$choice" == "" ]]; then
    exit
fi
    
operation=$(zenity --list \
    --title="What do you want to do with this game?" \
    --column="Options" \
    --width=400 --height=300 \
    --print-column=1 \
    "Delete Shader Cache" \
    "Delete Compatibility Data" \
    "Erase All Game Data")

if [[ "$operation" == "Delete Compatibility Data" || "$operation" == "Erase All Game Data" ]]; then
    if zenity --question --text="Warning: This could delete save data. Are you sure you want to proceed?"; then
        echo "Deleting data"
    else
        exit
    fi
fi
    
if [[ -n "$choice" ]]; then
    appid="${choice%%:*}"
    echo $appid
    for drive in "${drives[@]}"; do
        if [[ "$drive" == "internal" ]]; then
            steampath="/home/$USER/.steam/steam/steamapps"
        else
            steampath="/run/media/$USER/$drive/SteamLibrary/steamapps"
        fi
        
        case "$operation" in
            "Delete Compatibility Data")
                if [[ -d "$steampath/compatdata/$appid" ]]; then
                    rm -r "$steampath/compatdata/$appid"
                    compatdata_deleted="true"
                fi
                ;;
            "Delete Shader Cache")
                if [[ -d "$steampath/shadercache/$appid" ]]; then
                    rm -r "$steampath/shadercache/$appid"
                    shaders_deleted="true"
                fi
                ;;
            "Erase All Game Data")
                if [[ -d "$steampath/shadercache/$appid" ]]; then
                    rm -r "$steampath/shadercache/$appid"
                    shaders_deleted="true"
                fi
                
                if [[ -d "$steampath/compatdata/$appid" ]]; then
                    rm -r "$steampath/compatdata/$appid"
                    compatdata_deleted="true"
                fi
                ;;
         esac
     done
         
         
else
    echo "Nothing selected"e
    exit
fi

if [[ "$shaders_deleted" == "true" && "$compatdata_deleted" == "true" ]]; then
    zenity --info --text="Game data successfull deleted."

elif [[ "$shaders_deleted" == "true" && "$compatdata_deleted" == "false" ]]; then
    zenity --info --text="Shaders sucessfully deleted."

elif [[  "$shaders_deleted" == "false" && "$compatdata_deleted" == "true" ]]; then
    zenity --info --text="Compatibility Data successfully deleted."
elif [[  "$shaders_deleted" == "false" && "$compatdata_deleted" == "false" ]]; then
    zenity --info --text="No game data found."
else
    echo "error"
fi

exit