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

    local wrecks = surface.find_entities_filtered({type = "container", position = {-5,-6}, radius = 50})
    for key, wreck in pairs(wrecks) do
        if wreck.name ~= "crash-site-spaceship" and not string.find(wreck.name, "wreck-medium", 1, true) and not string.find(wreck.name, "wreck-big", 1, true) then
            table.remove(wrecks, key)
        end
    end

    return wrecks

end

local function init()

    if remote.interfaces["freeplay"] and not remote.call("freeplay", "get_disable_crashsite") then

        if not remote.call("freeplay", "get_init_ran") then

            local item_location = game.is_multiplayer() and remote.call("freeplay", "get_created_items") or remote.call("freeplay", "get_debris_items")

            for item, count in pairs(items) do
                item_location[item] = count
            end

            remote.call("freeplay", game.is_multiplayer() and "set_created_items" or "set_debris_items", item_location)

        else

            local wrecks = get_spaceship_wrecks()

            for _, player in pairs(game.players) do

                if wrecks and next(wrecks) then

                    for key, wreck in pairs(wrecks) do
                        if add_items_to_inventory(wreck.get_inventory(defines.inventory.chest)) then
                            player.print("Simple Bot Start: Your items were spawned in the crashsite. Go get them")
                            break
                        else
                            table.remove(wrecks, key)
                        end
                    end

                else
                    if not add_items_to_inventory(player.get_main_inventory()) then
                        player.print("Simple Bot Start: Mod was unable to insert items into your inventory. Please run command /sbs-give-items or contact an admin once you have ensured there are two free inventory slots")
                    end
                end
            end

        end

    else

        for _, player in pairs(game.players) do
            if not add_items_to_inventory(player.get_main_inventory()) then
                player.print("Simple Bot Start: Mod was unable to insert items into your inventory. Please run command /sbs-give-items or contact an admin once you have ensured there are two free inventory slots")
            end
        end

    end

end

local function cutscene_over(event)

    if remote.interfaces["freeplay"] and not remote.call("freeplay", "get_disable_crashsite") or script.active_mods["any-planet-start"] then

        if not game.is_multiplayer() then

            local player = game.get_player(event.player_index)
            local wrecks = get_spaceship_wrecks()
            local armor_found = false
            local total_robots_found = 0
            
            for _, wreck in pairs(wrecks) do

                for i = 1, #wreck.get_inventory(defines.inventory.chest) do
                    
                    local item = wreck.get_inventory(defines.inventory.chest)[i]

                    if item.valid_for_read then
                        if item.name == "exoskeleton-armor" and not armor_found then
                            insert_equipment(item.grid)
                            armor_found = true
                        elseif item.name == "fusion-construction-robot" then
                            total_robots_found = total_robots_found + item.count
                        end
                    end

                end

            end

            if not armor_found then
                    player.get_main_inventory().insert({name = "exoskeleton-armor", count = 1})
                    insert_equipment(player.get_main_inventory().find_item_stack("exoskeleton-armor").grid)
            end

            if total_robots_found ~= items["fusion-construction-robot"] then
                local missing_robots = items["fusion-construction-robot"] - total_robots_found
                player.get_main_inventory().insert({name = "exoskeleton-armor", count = missing_robots})
            end
                
        else
            for _, player in pairs(game.players) do
                insert_equipment(player.get_main_inventory().find_item_stack("exoskeleton-armor").grid)
            end
        end

    end

end


local function give_items_to_player(event)

    if not remote.interfaces["freeplay"] or not remote.call("freeplay", "get_disable_crashsite") or not remote.call("freeplay", "get_init_ran") then

        local player = game.get_player(event.player_index)
        if not add_items_to_inventory(player.get_main_inventory()) then
            player.print("Simple Bot Start: Mod was unable to insert items into your inventory. Please run command /sbs-give-items or contact an admin once you have ensured there are two free inventory slots")
        end

    end

end

local function give_item_command(event)

    if not event.name ~= "sbs-give-items" then return end

    local player = game.get_player(event.player_index)

    if settings.global["sbs-command-admin-only"].value and not player.admin then
        player.print("Only admins are allowed to use this command")
        return
    end

    if player.admin and event.parameter then
        
        local admin = player
        player = game.get_player(event.parameter)
        
        if not player then 
            admin.print("Invalid user selected")
        end
    end

    if not add_items_to_inventory(player.get_main_inventory()) then
        player.print("Simple Bot Start: Mod was unable to insert items into your inventory. Please run command /sbs-give-items or contact an admin once you have ensured there are two free inventory slots")
    end

end


script.on_init(init)
script.on_event({defines.events.on_cutscene_cancelled, defines.events.on_cutscene_finished}, cutscene_over)
script.on_event(defines.events.on_player_joined_game, give_items_to_player)

