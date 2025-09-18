<h3>Linux Steam Cleanup Tool:</h3>
<p>This tool scans your steam libraries (Internal: (~/.steam/steam/steamapps) and External or secondary libraries under /run/media/yourusername/yourdrivename/SteamLibrary/steamapps/) to generate a list of all of your instaled games using the Steam Manifest files. You can choose a game from this list and delete its compatdata and/or shadercache.</p>

<h4>Usage:</h4>
<ol>
   <li>Download the script: steam_cleanup_tool.sh</li>
   <li>Make the script executable, run the following command in your terminal: <br>
      chmod +x linux_steam_cleanup_tool.sh</li>
   <li>Run the script: <br>
      Double-click it in your file manager (if your environment supports it) <br>
      Run it from the terminal: ./linux_steam_cleanup_tool.sh</li>
   <li>Choose a Game (The script will generate a list of all of your installed games)</li>
   <li>Choose an Operation <br>
   Delete Compatiblity Data: Removes the game's compatdata folder <br>
   Delete Shader Cache: Removes the game's shadercache folder <br>
   Delete All Game Data: Removes both the game's compatdata folder and the game's shadercache folder</li>
   <li>Confirmation messages: <br>
   "Compatibility Data successfully deleted." <br>
   "Shaders successfully deleted." <br>
   "Game data successfully deleted." <br>
   "No game data found." if nothing was deleted.</li>
</ol>
