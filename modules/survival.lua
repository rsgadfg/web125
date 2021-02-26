
local cfg = module("cfg/survival")
local lang = vRP.lang

-- api

function vRP.getHunger(user_id)
  local data = vRP.getUserDataTable(user_id)
  if data then
    return data.hunger
  end

  return 0
end

function vRP.getThirst(user_id)
  local data = vRP.getUserDataTable(user_id)
  if data then
    return data.thirst
  end

  return 0
end

function vRP.setHunger(user_id,value)
  local data = vRP.getUserDataTable(user_id)
  if data then
    data.hunger = value
    if data.hunger < 0 then data.hunger = 0
    elseif data.hunger > 100 then data.hunger = 100 
    end

    -- update bar
    local source = vRP.getUserSource(user_id)
    TriggerClientEvent("vrp_ladderhud:updateBasics",source, data.hunger, data.thirst)
    --vRPclient.setProgressBarValue(source, {"vRP:hunger",data.hunger})
    if data.hunger >= 100 then
      --vRPclient.setProgressBarText(source,{"vRP:hunger",lang.survival.starving()})
    else
      --vRPclient.setProgressBarText(source,{"vRP:hunger",""})
    end
  end
end

function vRP.setThirst(user_id,value)
  local data = vRP.getUserDataTable(user_id)
  if data then
    data.thirst = value
    if data.thirst < 0 then data.thirst = 0
    elseif data.thirst > 100 then data.thirst = 100 
    end

    -- update bar
    local source = vRP.getUserSource(user_id)
    TriggerClientEvent("vrp_ladderhud:updateBasics",source, data.hunger, data.thirst)
    --vRPclient.setProgressBarValue(source, {"vRP:thirst",data.thirst})
    if data.thirst >= 100 then
      --vRPclient.setProgressBarText(source,{"vRP:thirst",lang.survival.thirsty()})
    else
      --vRPclient.setProgressBarText(source,{"vRP:thirst",""})
    end
  end
end

function vRP.varyHunger(user_id, variation)
  local data = vRP.getUserDataTable(user_id)
  if data then
    local was_starving = data.hunger >= 100
    data.hunger = data.hunger + variation
    local is_starving = data.hunger >= 100

    -- apply overflow as damage
    local overflow = data.hunger-100
    if overflow > 0 then
      vRPclient.varyHealth(vRP.getUserSource(user_id),{-overflow*cfg.overflow_damage_factor})
    end

    if data.hunger < 0 then data.hunger = 0
    elseif data.hunger > 100 then data.hunger = 100 
    end

    -- set progress bar data
    local source = vRP.getUserSource(user_id)
    TriggerClientEvent("vrp_ladderhud:updateBasics",source, data.hunger, data.thirst)
    --vRPclient.setProgressBarValue(source,{"vRP:hunger",data.hunger})
    if was_starving and not is_starving then
      --vRPclient.setProgressBarText(source,{"vRP:hunger",""})
    elseif not was_starving and is_starving then
      --vRPclient.setProgressBarText(source,{"vRP:hunger",lang.survival.starving()})
    end
  end
end

function vRP.varyThirst(user_id, variation)
  local data = vRP.getUserDataTable(user_id)
  if data then
    local was_thirsty = data.thirst >= 100
    data.thirst = data.thirst + variation
    local is_thirsty = data.thirst >= 100

    -- apply overflow as damage
    local overflow = data.thirst-100
    if overflow > 0 then
      vRPclient.varyHealth(vRP.getUserSource(user_id),{-overflow*cfg.overflow_damage_factor})
    end

    if data.thirst < 0 then data.thirst = 0
    elseif data.thirst > 100 then data.thirst = 100 
    end

    -- set progress bar data
    local source = vRP.getUserSource(user_id)
    TriggerClientEvent("vrp_ladderhud:updateBasics",source, data.hunger, data.thirst)
    --vRPclient.setProgressBarValue(source,{"vRP:thirst",data.thirst})
    if was_thirsty and not is_thirsty then
      --vRPclient.setProgressBarText(source,{"vRP:thirst",""})
    elseif not was_thirsty and is_thirsty then
      --vRPclient.setProgressBarText(source,{"vRP:thirst",lang.survival.thirsty()})
    end
  end
end

-- tunnel api (expose some functions to clients)

function tvRP.varyHunger(variation)
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    vRP.varyHunger(user_id,variation)
  end
end

function tvRP.varyThirst(variation)
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    vRP.varyThirst(user_id,variation)
  end
end

-- tasks

-- hunger/thirst increase
function task_update()
  for k,v in pairs(vRP.users) do
    vRP.varyHunger(v,cfg.hunger_per_minute)
    vRP.varyThirst(v,cfg.thirst_per_minute)
end

  SetTimeout(70000,task_update)
end
task_update()

-- handlers

-- init values
AddEventHandler("vRP:playerJoin",function(user_id,source,name,last_login)
  local data = vRP.getUserDataTable(user_id)
  if data.hunger == nil then
    data.hunger = 0
    data.thirst = 0
  end
end)

-- add survival progress bars on spawn
AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
  local data = vRP.getUserDataTable(user_id)

  -- disable police
  vRPclient.setPolice(source,{cfg.police})
  -- set friendly fire
  vRPclient.setFriendlyFire(source,{cfg.pvp})

  TriggerClientEvent("vrp_ladderhud:updateBasics",source, data.hunger, data.thirst)
  --vRPclient.setProgressBar(source,{"vRP:hunger","minimap",htxt,255,153,0,0})
  --vRPclient.setProgressBar(source,{"vRP:thirst","minimap",ttxt,0,125,255,0})
  vRP.setHunger(user_id, data.hunger)
  vRP.setThirst(user_id, data.thirst)
end)

-- EMERGENCY

---- revive
local revive_seq_samu = {
  {"mini@cpr@char_a@cpr_def","cpr_intro",1},
  {"mini@cpr@char_a@cpr_str","cpr_pumpchest",1},
  --{"mini@cpr@char_a@cpr_str","cpr_success",1}
}

local revive_seq2_samu = {
  {"mini@cpr@char_b@cpr_str","cpr_kol_to_cpr",1},
  {"mini@cpr@char_b@cpr_str","cpr_success",1}
}

local isRev = false
local choice_revive = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
 	if isRev == false then
	isRev = true
    vRPclient.getNearestPlayer(player,{10},function(nplayer)
      local nuser_id = vRP.getUserId(nplayer)
      if nuser_id ~= nil then
        vRPclient.isInComa(nplayer,{}, function(in_coma)
          if in_coma then
            if vRP.tryGetInventoryItem(user_id,"medkit",1,true) then
              vRPclient.playAnim(player,{false,revive_seq_samu,false}) -- anim
              SetTimeout(15000, function()
                vRPclient.varyHealth(nplayer,{100}) -- heal 50
				vRPclient.playAnim(nplayer,{false,revive_seq2_samu,false})
				vRP.tryFullPayment(nuser_id,500)
				vRP.giveMoney(user_id,2000)
				exports['FlixRankAPI']:addxp(user_id, 500)
        TriggerClientEvent("pNotify:SendNotification",nplayer,{text = "<b style='color:#FFFFFF'>فاتورة انعاش بقيمة 500 ريال<b style='color:#FFFFFF'>",type = "warning",timeout = (5000),layout = "bottomCenter",queue = "global",})	
         end)
          end
           else
            TriggerClientEvent("pNotify:SendNotification",player,{text = "<big>اللاعب ليس في غيبوبة</big>", type = "info", timeout = (5000),layout = "gta"})
          end
        end)
      else
       TriggerClientEvent("pNotify:SendNotification",player,{text = "<big>لا يوجد لاعب بالقرب منك</big>", type = "info", timeout = (5000),layout = "gta"})
      end
    end)
	SetTimeout(15000,function()
	isRev = false
	end)
	else
    TriggerClientEvent("pNotify:SendNotification",player,{text = "<b style='color:#ff6b70'>لا يمكنك الانعاش مره ثانية انتظر 15 ثانية<b style='color:#ff6b70'>",type = "error",timeout = (5000),layout = "centerLeft", sounds = {sources = {"Wait_15_seconds.wav"},volume = 0.2,conditions = {"docVisible"} }})		
  end
  end
end,lang.emergency.menu.revive.description()}


-- add choices to the main menu (emergency)
vRP.registerMenuBuilder("main", function(add, data)
  local user_id = vRP.getUserId(data.player)
  if user_id ~= nil then
    local choices = {}
    if vRP.hasPermission(user_id,"emergency.revive") then
      choices[lang.emergency.menu.revive.title()] = choice_revive
    end

    add(choices)
  end
end)