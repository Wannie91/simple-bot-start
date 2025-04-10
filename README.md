# simple-bot-start

## Version
0.1.0

## Description
A simple mod for Factorio where you start the game with exoskeleton armour with 1x fission reactor, 2x personal robotports MK2, night vision, 1x exoskeleton and 50x fusion construction robots. The exoskeleton armour provides no protection and its grid is locked, so equipment can't be removed. The fusion robots are fireproof, don't need recharging and are faster than their vanilla counterparts. However, their maximum speed is limited, meaning that normal construction robots will become faster after researching Worker Robot Speed 5. 

Neither item can be crafted, so you get what you get.

In single player, the mod attempts to spawn the exoskeleton armour and fusion construction robots in the debris wreckage of the ship. As the vanilla function "set_debris_items" stops spawning items without a message when there is no more space, it can happen that the items don't spawn properly. In this case, there is a custom command, /sbs-give-armor, which allows the player whose armour is missing to spawn it. In multiplayer, if there are less than 4 players, the mod will also try to spawn the item in the debris of the spaceship. If there are more than four players, the items should spawn directly in the players' inventories. Multiplayer functionality hasn't been tested yet.

In freeplay, the equipment is automatically placed in the armour when the intro cutscene ends.

The sprites of the fusion construction robots were inspired by the "fusion robots" mod by mindmix. Since the graphcis of his mod are older, I tried to make the vanilla construction robots look "fusion" myself. If you want the GIMP files, please contact me.

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
