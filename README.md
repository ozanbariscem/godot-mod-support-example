# Basic way to implement mod and dlc support in Godot.

The game_scene.pck and menu_scene.pck has their on repositories as Godot projects, check them out.
 - Game: https://github.com/ozanbariscem/godot-mod-support-example-game
 - Menu: https://github.com/ozanbariscem/godot-mod-support-example-menu


# What?
 - This is basically a "game" that loads Godot packages at runtime.

# Why?
 - Modding is awesome.
 - You can treat your DLCs as mods.
 - You can change or update a part of the game with small updates. Unlike PUBG where we have to download the entire game again just for a 2 line change.
 - I believe to make an actually modable game you have to make that game by moding it yourself.

# How it works?
 - When the game starts it checks the "mod" and "game" folders in the app directory for Godot packages.
 - If it can find any it loads them.
 - So actual game is also develop as a mod would. It's just in the game folder instead of mod.
 - If 2 other packages have same files, 2nd overrides 1st one. You can also use this to package game updates.
 - It loads to menu scene by default and everything else is given as an example.

# Problems
 - You can't use static typing for custom classes in mod/dlc/update files. But you can load these custom classes using preload and load functions of Godot. This also enables posibility of "sub-mods" -mod of another mod-
 - GDScript has acces to operating system so mods can be malicious.
 - Testing a part of the game can become boring since you can't test it in editor, you constantly have to export.

# Notes
 - This example is created to test in editor.
 - If you export this project as it is, it will include the game and mod folder in the exports .pck file. Which isn't something we want. Correct use is to export the game without game and mod folders. Then create game and mod folders in the export directory. And export every game or mod .pck you have to their respective folders.
 - If you have a solution to any of these problems please let me know.
