# simple-bot-start

## Version
0.1.0

## Description
A simple mod for Factorio where you start the game with an exoskeleton armour with 1x fission reactor, 2x personal robot ports MK2, night vision, 1x exoskeleton and 50x fusion construction robots. The exoskeleton armour provides no protection and its grid is locked, so you can't remove any equipment. The fusion robots are fireproof, don't need recharging, and are faster than their vanilla counterparts. However, their maximum speed is limited, so normal construction robots will become faster after researching Worker Robot Speed 5. Neither item can be crafted, so you get what you get.

In single player, the mod will try to spawn the exoskeleton armour and fusion construction robots in the wreckage of the spaceship if the intro scene hasn't finished yet. As the vanilla function "set_debris_items" stops spawning items when there's no more room, it may happen that the items are not spawned properly. In this case, there is a custom command, /sbs-give-armor, which allows the player whose armour is missing to spawn it. If the mod was added after the game started, it will try to find the wreckage to spawn the items. If the wreckage has been removed, the mod will spawn the items directly from the player's inventory.

In multiplayer, if there are less than 4 players, the mod will also try to spawn the items in the wreckage of the ship. This increases the risk of items not spawning properly, so this may change in the future. If there are more than four players, the items should spawn directly in the players' inventories. Multiplayer functionality hasn't been tested yet.

## Compatibility
This mod should be compatible with the following mods: 
- Any Planet Launch 

It is currently not compatible with the following mods:

## Planned features 
- Refine the item spawning and detection script 
- Add a setting for Admins so that only they can spawn armour for players 
- Add a setting to spawn armour for players who join later.

## Available Settings
Currently None

## Known Issues
Probably many. 
