require("util")

local items = 
{
    ["exoskeleton-armor"] = 1,   
    ["fusion-construction-robot"] = 50,
}

local equipment =
{
    ["fission-reactor-equipment"] = 1,
    ["exoskeleton-equipment"] = 1,
    ["personal-roboport-mk2-equipment"] = 2,
    ["night-vision-equipment"] = 1,
}

local function insert_equipment(grid)

    for equipment, amount in pairs(equipment) do
        grid.put({name = equipment})
        if amount > 1 then 
            grid.put({name = equipment})
        end
    end
   
end

local function add_items_to_inventory(inventory)

    if inventory.can_insert({name = "exoskeleton-armor", count = 1}) and inventory.can_insert({name = "fusion-construction-robot", count = 50}) then
        for item, count in pairs(items) do
            inventory.insert({name = item, count = count})
        end
        insert_equipment(inventory.find_item_stack("exoskeleton-armor").grid)
        return true   
    end

    return false

end

local function get_spaceship_wrecks()

    local surface = game.surfaces.nauvis

    if script.active_mods["any-planet-start"] and settings.startup["aps-planet"].value ~= "none" then
        surface = game.get_surface(settings.startup["aps-planet"].value)
    end

    return surface.find_entities_filtered({type = "container", position = {-5, -6}, radius = 50})

end

local function does_crashsite_still_exist() 

    if get_spaceship_wrecks() then 
        return true
    end

    return false

end

local function init()

    if remote.interfaces["freeplay"] and not remote.call("freeplay", "get_disable_crashsite") then

        if not remote.call("freeplay", "get_init_ran") then 

            --If game is multiplayer items are given directly to player, else they are spawn in spaceship debris 
            local item_location = game.is_multiplayer() and remote.call("freeplay", "get_created_items") or remote.call("freeplay", "get_debris_items")
            
                for item, count in pairs(items) do 
                    item_location[item] = count
                end

                remote.call("freeplay", game.is_multiplayer() and "set_created_items" or "set_debris_items", item_location)

        elseif does_crashsite_still_exist() and #game.players <= 4 then

            local ship_wrecks = get_spaceship_wrecks()
  
            for _, player in pairs(game.players) do

                if next(ship_wrecks) then

                    for key, wreck in pairs(ship_wrecks) do
                        if add_items_to_inventory(wreck.get_inventory(defines.inventory.chest)) then
                            break
                        else
                            table.remove(ship_wrecks, key)
                        end
                    end
                else
                    if not storage.armorless_players then
                        storage.armorless_players = {}
                    end

                    storage.armorless_players[player.index] = true
                    player.print("Script was unable to insert your items into the crashsite. Please run command /sps-give-items to get your bot start equipment")
                end
            end
        else
            for _, player in pairs(game.players) do 
                if not add_items_to_inventory(player.get_main_inventory() ) then
                    if not storage.armorless_players then
                        storage.armorless_players = {}
                    end

                    storage.armorless_players[player.index] = true
                    player.print("Script was unable to insert items into your inventory. Please run command /sps-give-items once you have ensured there are two free inventory slots")
                end
            end          

        end

    else
        for _, player in pairs(game.players) do 
            if not add_items_to_inventory(player.get_main_inventory() ) then
                if not storage.armorless_players then
                    storage.armorless_players = {}
                end

                storage.armorless_players[player.index] = true
                player.print("Script was unable to insert items into your inventory. Please run command /sps-give-items once you have ensured there are two free inventory slots")
            end
        end
    end

end

local function cutscene_over(event) 

    if remote.interfaces["freeplay"] and not remote.call("freeplay", "get_disable_crashsite") or script.active_mods["any-planet-start"] then

        local ship_wrecks = get_spaceship_wrecks()

        for _, wreck in pairs(ship_wrecks) do

            for i = 1, #wreck.get_inventory(defines.inventory.chest) do
                local item = wreck.get_inventory(defines.inventory.chest)[i]
                if item.valid_for_read and item.name == "exoskeleton-armor" then 
                    insert_equipment(item.grid)
                end
            end
        end
    end

end

local function give_item_to_player(event)

    if event.name ~= "sbs-give-armor" then return end

    local player = game.get_player(event.player_index)

    if not storage.armorless_players then 
        player.print("No player with missing armor found")
        return
    end

    if not storage.armorless_players[player.index] then 
        player.print("Command not valid for players who received their armor")
    else
        if add_items_to_inventory(player.get_main_inventory()) then
		    storage.armorless_players[player.index] = nil
        end
    end

end

script.on_init(init)
script.on_event({defines.events.on_cutscene_cancelled, defines.on_cutscene_finished}, cutscene_over)
-- script.on_event({defines.events.on_player_joined, defines.events.on_player_created}, give_item_to_player)
commands.add_command("sbs-give-armor", "Give exoskeleton armor to player", give_item_to_player)
