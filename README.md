<h3>Linux Steam Cleanup Tool:</h3>
<p>This tool scans your steam libraries and generates a list of all of your instaled games using the Steam Manifest. You can choose a game from this list and delete its compatdata and/or shadercache.</p>

<ol>
   <li>Download the script: steam_cleanup_tool.sh</li>
   <li>Make the script executable, run the following command in your terminal: <br>
      chmod +x linux_steam_cleanup_tool.sh</li>
   <li>Run the script: <br>
      Double-click it in your file manager (if your environment supports it) <br>
      Run it from the terminal: ./linux_steam_cleanup_tool.sh</li>
   <li>The script will scan your Steam libraries, including: <br>
      Internal Steam library: (~/.steam/steam/steamapps) <br>
      External or secondary libraries under /run/media/yourusername/yourdrivename/SteamLibrary/steamapps/</li>
   <li>Choose a Game (The script will generate a list of games it finds using the steam manifest files)</li>
   <li>Choose an Operation <br>
   Delete Compatiblity Data: Removes the game's compatdata folder <br>
   Delete Shader Cache: Removes the game's shadercache folder <br>
   Delete All Game Data: Removes both the game's compatdata folder and the game's shadercache folder</li>
   <li>Confirmation message: <br>
   "Compatibility Data successfully deleted." <br>
   "Shaders successfully deleted." <br>
   "Game data successfully deleted." <br>
   "No game data found." if nothing was deleted.</li>
</ol>
