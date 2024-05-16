# Hooked Player Controller

Player controller with hooks for custom input actions or other events.

If you're making a mod and you want to respond to an input action you created, you need a hook in the player controller. If everyone supplied their own hooked player controller, no mods would be compatible with each other. This project aims to be a collaboratively-developed player controller extension which contains all hooks for all mods.

### Contribution rules

To keep this project backwards compatible with supported mods, this project is __append only__. In other words, contributors are not allowed to delete or modify any hooks that already exist.

You're probably contributing to this project to add support for your mod. Please refrain from adding logic for your mod here. Just add your dummy, call into it, and do the rest in your own project.

### How to add a hook

1. In your mod project (not this project), add a blueprint library with a function (name it whatever you like).
1. In _this_ project, add a dummy of that blueprint library (i.e. same path, same asset name, same function name, same function signature; function definition not required).
1. In `BP_PlayerGoatMain`, call the blueprint library function you just dummied.

Congratulations, you now have a hook into the player controller!

### How to build

1. Run `cook.bat`
1. Run `deploy.bat`
1. Run the game

### Notes

- A big reason we can do this is that if an asset is referenced but not found, the game won't crash and in fact behaves like nothing happened. So say this mod currently has hooks for mods A and B, and you have this mod and mod A installed but you don't have mod B installed. If the hook (i.e. the dummy blueprint library function) for mod B gets invoked, the game will try to call into mod B's blueprint library, not be able to find mod B's blueprint library asset, and then... nothing happens. Game doesn't crash. Interestingly, the game _will crash_ if you call a function that doesn't exist in a blueprint library that does exist. So if you're wondering why we don't put everyone's hooks in one big blueprint library, that's why.
