# simple-bot-start

## Version
0.1.0

## Description
A simple mod for Factorio where you start the game with exoskeleton armor with 1x fission reactor, 2x personal robotports MK2, night vision, 1x exoskeleton and 50x fusion construction robots. The exoskeleton armor provides no protection and its grid is locked, so equipment can't be removed. The fusion robots are fireproof, don't need recharging and are faster than their vanilla counterparts. However, their maximum speed is limited, meaning that normal construction robots will become faster after researching Worker Robot Speed 5. 

Neither item can be crafted, so you get what you get.

In single player, the mod will try to spawn the exoskeleton armor and fusion construction robots in the debris of the spaceship if the intro scene hasn't finished yet. As the vanilla function "set_debris_items" stops spawning items when there's no more space, it can happen that the items are not spawned properly. In this case, there is a custom command, /sbs-give-armor, which allows the player whose armor is missing to spawn it. If the mod was added after the game started, it will try to find the wreckage to spawn the items. If the wreckage has been removed, the mod will spawn the items directly in the player's inventory.

In multiplayer, if there are less than 4 players, the mod will also try to spawn the items in the debris of the spaceship. If there are more than four players, the items should spawn directly in the players' inventories. Multiplayer functionality hasn't been tested yet.
 
In freeplay, the equipment is automatically placed in the armor when the intro cutscene ends.

The sprites of the fusion construction robots were inspired by the "fusion robots" mod by mindmix. Since the graphics of his mod are older, I tried to make the vanilla construction robots look "fusion" myself. If you want the GIMP files, please contact me.

## Compatibility
The mod should be compatible with following mods: 
- Any planet start

It is currently not compatible with following mods: 

## Planned Features
- Refine the item spawing and detection script
- Add a setting for adminstrators so only they can spawn the armor for players
- Add a setting that makes the armor spawn for players who join later.

## Available Settings
Currently None

## Known Issues
Probably many. 
