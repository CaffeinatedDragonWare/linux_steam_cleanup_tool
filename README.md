1. Download the script:
steam_cleanup_tool.sh

2. Make the script executable:
Run the following command in your terminal: chmod +x linux_steam_cleanup_tool.sh

3. Run the script:
You can double-click it in your file manager (if your environment supports it), or run it from the terminal:
./linux_steam_cleanup_tool.sh

4. The script will scan your Steam libraries, including:
Internal Steam library: (~/.steam/steam/steamapps)
External or secondary libraries under /run/media/yourusername/yourdrivename/SteamLibrary/steamapps/

5. Choose a Game (The script will generate a list of games it finds using the steam manifest files)

6. Choose an Operation
   Delete Compatiblity Data: Removes the game's compatdata folder
   Delete Shader Cache: Removes the game's shadercache folder
   Delete All Game Data: Removes both the game's compatdata folder and the game's shadercache folder
   
7. Confirmation message:
   "Compatibility Data successfully deleted."
   "Shaders successfully deleted."
   "Game data successfully deleted."
   "No game data found." if nothing was deleted.
