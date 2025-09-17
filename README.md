# linux_steam_cleanup_tool
Allows Linux Users to quickly delete Compata Data and Shaders from Steam.

1. Make sure the script is executable
2. Double click on it
3. The script will look for your steam libraries (It will check the main internal drive as well drives mounted in the /run/media/yourusername/ folder
4. Choose a Game
5. Choose an Operation
   Delete Compatiblity Data: Deletes the game's compatdata folder
   Delete Shader Cache: Deletes the game's shadercache folder
   Delete All Game Data: Deletes both the game's compatdata folder and the game's shadercache folder
6. It will tell you if it deleted the data: "Compatibility Data successfully deleted." or "Shaders sucessfully deleted." depending on the operation specified.
   If there is no data to delete it will say: "No game data found."
