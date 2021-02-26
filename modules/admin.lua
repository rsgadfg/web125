local htmlEntities = module("lib/htmlEntities")
local Tools = module("lib/Tools")

local player_ad = {}
local admin_ticket_time = 60000 -- غير الوقت من هنا

local webhook = "" -- الادمنية

function sendWebhookMessage(webhook,message)
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


local adminw = "" -- طلبات الادمن

function sendADH(WW,message)
	if WW ~= "none" then
		PerformHttpRequest(WW, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end




vRPbm = {}

-- LOG FUNCTION
function vRPbm.logInfoToFile(file,info)
  file = io.open(file, "a")
  if file then
    file:write(os.date("%c").." => "..info.."\n")
  end
  file:close()
end
-- this module define some admin menu functions

local player_lists = {}

local function ch_list(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.list") then
    if player_lists[player] then -- hide
      player_lists[player] = nil
      vRPclient.removeDiv(player,{"user_list"})
    else -- show
      local content = ""
      local count = 0
      for k,v in pairs(vRP.rusers) do
        count = count+1
        local source = vRP.getUserSource(k)
        vRP.getUserIdentity(k, function(identity)
          if source ~= nil then
            content = content.."<br />"..k.." => <span class=\"pseudo\">"..vRP.getPlayerName(source).."</span> <span class=\"endpoint\">"..vRP.getPlayerEndpoint(source).."</span>"
            if identity then
              content = content.." <span class=\"name\">"..htmlEntities.encode(identity.firstname).." "..htmlEntities.encode(identity.name).."</span> <span class=\"reg\">"..identity.registration.."</span> <span class=\"phone\">"..identity.phone.."</span>"
            end
          end

          -- check end
          count = count-1
          if count == 0 then
            player_lists[player] = true
            local css = [[
.div_user_list{ 
  margin: auto; 
  padding: 8px; 
  width: 650px; 
  margin-top: 80px; 
  background: black; 
  color: white; 
  font-weight: bold; 
  font-size: 1.1em;
} 

.div_user_list .pseudo{ 
  color: rgb(0,255,125);
}

.div_user_list .endpoint{ 
  color: rgb(255,0,0);
}

.div_user_list .name{ 
  color: #309eff;
}

.div_user_list .reg{ 
  color: rgb(0,125,255);
}
              
.div_user_list .phone{ 
  color: rgb(211, 0, 255);
}
            ]]
            vRPclient.setDiv(player,{"user_list", css, content})
          end
        end)
      end
    end
  end
end

local function ch_whitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.whitelist") then
    vRP.prompt(player,"User id to whitelist: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,true)
      sendWebhookMessage(webhook,"```xl\r\n User_id " .. user_id .." whitelist " .. id .. "```")
	  vRPbm.logInfoToFile("whitelistlog.txt",user_id .. " whitelist " .. id .."\r\n")
      vRPclient.notify(player,{"whitelisted user "..id})
    end)
  end
end



local function ch_unwhitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unwhitelist") then
    vRP.prompt(player,"User id to un-whitelist: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,false)
      sendWebhookMessage(webhook,"```xl\r\n User_id " .. user_id .." un-whitelist " .. id .. "```")
	  vRPbm.logInfoToFile("whitelistlog.txt",user_id .. " un-whitelist " .. id .."\r\n")
      vRPclient.notify(player,{"un-whitelisted user "..id})
    end)
  end
end

local function ch_addgroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.add") then
    vRP.prompt(player,"User id: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Group to add: ","",function(player,group)
	if group == superadmin and not vRP.hasPermission(user_id,"player.group.add.superadmin") then
	  do return end
	end
	if group == admin and not vRP.hasPermission(user_id,"player.group.add.admin") then
	  do return end
	end  		  
	vRP.addUserGroup(id,group)
	vRPclient.notify(player,{group.." added to user "..id})
      end)
    end)
  end
end

local function ch_removegroup(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.remove") then
    vRP.prompt(player,"User id: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Group to remove: ","",function(player,group)
        vRP.removeUserGroup(id,group)
        vRPclient.notify(player,{group.." removed from user "..id})
      end)
    end)
  end
end

local function ch_kick(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.kick") then
    vRP.prompt(player,"User id to kick: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Reason: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.kick(source,reason)
		  sendWebhookMessage(webhook,"```xl\r\n User_id " .. user_id .." kicked " .. id .. " for " .. reason .. "```")
		  vRPbm.logInfoToFile("kickLog.txt",user_id .. " kicked " .. id .. " for " .. reason .. "\r\n")
          vRPclient.notify(player,{"kicked user "..id})
        end
      end)
    end)
  end
end

local function ch_ban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.ban") then
    vRP.prompt(player,"User id to ban: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Reason: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.ban(source,reason)
          vRPclient.notify(player,{"banned user "..id})
		  vRPbm.logInfoToFile("bannedLog.txt",user_id .. " banned " .. id .. " for " .. reason .. "\r\n")
		  sendWebhookMessage(webhook,"```xl\r\n User_id " .. user_id .." banned " .. id .. " for " .. reason .. "```")
        end
      end)
    end)
  end
end

local function ch_unban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
    vRP.prompt(player,"User id to unban: ","",function(player,id)
      id = parseInt(id)
      vRP.setBanned(id,false)
      vRPclient.notify(player,{"un-banned user "..id})
		  vRPbm.logInfoToFile("unbannedLog.txt",user_id .. " unbanned " .. id .. "\r\n")
		  sendWebhookMessage(webhook,"```xl\r\n User_id " .. user_id .." unbanned " .. id .."```")
    end)
  end
end

local function ch_emote(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.custom_emote") then
    vRP.prompt(player,"Animation sequence ('dict anim optional_loops' per line): ","",function(player,content)
      local seq = {}
      for line in string.gmatch(content,"[^\n]+") do
        local args = {}
        for arg in string.gmatch(line,"[^%s]+") do
          table.insert(args,arg)
        end

        table.insert(seq,{args[1] or "", args[2] or "", args[3] or 1})
      end

      vRPclient.playAnim(player,{true,seq,false})
    end)
  end
end

local function ch_sound(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.custom_sound") then
    vRP.prompt(player,"Sound 'dict name': ","",function(player,content)
      local args = {}
      for arg in string.gmatch(content,"[^%s]+") do
        table.insert(args,arg)
      end
      vRPclient.playSound(player,{args[1] or "", args[2] or ""})
    end)
  end
end

local function ch_coords(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRP.prompt(player,"Copy the coordinates using Ctrl-A Ctrl-C",x..","..y..","..z,function(player,choice) end)
  end)
end

local function ch_tptome(player,choice)
  vRPclient.getPosition(player,{},function(x,y,z)
    vRP.prompt(player,"User id:","",function(player,user_id) 
      local tplayer = vRP.getUserSource(tonumber(user_id))
      if tplayer ~= nil then
        vRPclient.teleport(tplayer,{x,y,z})
      end
    end)
  end)
end

local function ch_tpto(player,choice)
  vRP.prompt(player,"User id:","",function(player,user_id) 
    local tplayer = vRP.getUserSource(tonumber(user_id))
    if tplayer ~= nil then
      vRPclient.getPosition(tplayer,{},function(x,y,z)
        vRPclient.teleport(player,{x,y,z})
      end)
    end
  end)
end

local function ch_tptocoords(player,choice)
  vRP.prompt(player,"Coords x,y,z:","",function(player,fcoords) 
    local coords = {}
    for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
      table.insert(coords,tonumber(coord))
    end

    local x,y,z = 0,0,0
    if coords[1] ~= nil then x = coords[1] end
    if coords[2] ~= nil then y = coords[2] end
    if coords[3] ~= nil then z = coords[3] end

    vRPclient.teleport(player,{x,y,z})
  end)
end


local function ch_givemoney(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Amount:","",function(player,amount) 
      amount = parseInt(amount)
      vRP.giveMoney(user_id, amount)
	  vRPbm.logInfoToFile("givemoneyLog.txt",user_id .. " took money " .. amount .. "\r\n")
	  sendWebhookMessage(webhook,"```xl\r\n User_id " .. user_id .." took money " .. amount .."```")
    end)
  end
end

local function ch_giveitem(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Id name:","",function(player,idname) 
      idname = idname or ""
      vRP.prompt(player,"Amount:","",function(player,amount) 
        amount = parseInt(amount)
        vRP.giveInventoryItem(user_id, idname, amount,true)
		  vRPbm.logInfoToFile("giveitemLog.txt",user_id .. " took item [" .. idname .. "] amount " .. amount .. "\r\n")
	  sendWebhookMessage(webhook,"```xl\r\n User_id " .. user_id .." took item " .. idname .." amount " .. amount .."```")
      end)
    end)
  end
end

RegisterCommand('aadd', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.add") then
    vRP.prompt(player,"User id: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Group to add: ","",function(player,group)
        vRP.addUserGroup(id,group)
        vRPclient.notify(player,{group.." added to user "..id})
      end)
    end)
  end
end)

RegisterCommand('aadmin', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Describe your problem:","",function(player,desc) 
      desc = desc or ""
      if desc ~= nil and desc ~= "" then
      local answered = false
      local players = {}
      for k,v in pairs(vRP.rusers) do
        local player = vRP.getUserSource(tonumber(k))
        -- check user
        if vRP.hasPermission(k,"admin.tickets") and player ~= nil then
          table.insert(players,player)
        end
      end

      -- send notify and alert to all listening players
      for k,v in pairs(players) do
        vRP.request(v,"Admin ticket (user_id = "..user_id..") take/TP to ?: "..htmlEntities.encode(desc), 60, function(v,ok)
          if ok then -- take the call
            if not answered then
              -- answer the call
              vRPclient.notify(player,{"An admin took your ticket."})
              vRPclient.getPosition(player, {}, function(x,y,z)
                vRPclient.teleport(v,{x,y,z})
              end)
              answered = true
            else
              vRPclient.notify(v,{"Ticket already taken."})
            end
          end
        end)
      end
      else
        vRPclient.notify(player,{"Empty Admin Call."})
      end
    end)
  end
end)

RegisterCommand('white', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.whitelist") then
    vRP.prompt(player,"User id to whitelist: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,true)
      sendWebhookMessage(webhook,"```xl\r\n User_id " .. user_id .." whitelist " .. id .. "```")
	  vRPbm.logInfoToFile("whitelistlog.txt",user_id .. " whitelist " .. id .."\r\n")
      vRPclient.notify(player,{"whitelisted user "..id})
    end)
  end
end)

RegisterCommand('unwhite', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unwhitelist") then
    vRP.prompt(player,"User id to un-whitelist: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,false)
      sendWebhookMessage(webhook,"```xl\r\n User_id " .. user_id .." un-whitelist " .. id .. "```")
	  vRPbm.logInfoToFile("whitelistlog.txt",user_id .. " un-whitelist " .. id .."\r\n")
      vRPclient.notify(player,{"un-whitelisted user "..id})
    end)
  end
end)

RegisterCommand('ccclip', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.noclip") then
  vRPclient.toggleNoclip(player, {})
  end
end)

RegisterCommand('ttpm', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.tptome") then
  vRPclient.getPosition(player,{},function(x,y,z)
    vRP.prompt(player,"الشخص المراد سحبه:","",function(player,user_id) 
      local tplayer = vRP.getUserSource(tonumber(user_id))
      if tplayer ~= nil then
        vRPclient.teleport(tplayer,{x,y,z})
        end
      end)
    end)
  end
end)

RegisterCommand('bbaan', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.ban") then
    vRP.prompt(player,"ايد الشخص المراد حظرة: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Reason: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.ban(source,reason)
          vRPclient.notify(player,{"banned user "..id})
        end
      end)
    end)
  end
end)

RegisterCommand('kkick', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.kick") then
    vRP.prompt(player,"User id to kick: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Reason: ","",function(player,reason)
        local source = vRP.getUserSource(id)
        if source ~= nil then
          vRP.kick(source,reason)
          vRPclient.notify(player,{"kicked user "..id})
        end
      end)
    end)
  end
end)

RegisterCommand('ttp', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.tpto") then
  vRP.prompt(player,"أيدي الشخص المراد الانتقال اليه:","",function(player,user_id) 
    local tplayer = vRP.getUserSource(tonumber(user_id))
    if tplayer ~= nil then
      vRPclient.getPosition(tplayer,{},function(x,y,z)
        vRPclient.teleport(player,{x,y,z})
      end)
    end
  end)
  end
end)
RegisterCommand('uunban', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
    vRP.prompt(player,"User id to unban: ","",function(player,id)
      id = parseInt(id)
      vRP.setBanned(id,false)
      vRPclient.notify(player,{"un-banned user "..id})
    end)
  end
end)

RegisterCommand('groupremove', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.group.remove") then
    vRP.prompt(player,"User id: ","",function(player,id)
      id = parseInt(id)
      vRP.prompt(player,"Group to remove: ","",function(player,group)
        vRP.removeUserGroup(id,group)
        vRPclient.notify(player,{group.." removed from user "..id})
      end)
    end)
  end
end)

RegisterCommand('ggivem', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.givemoney") then
    vRP.prompt(player,"Amount:","",function(player,amount) 
      amount = parseInt(amount)
      vRP.giveMoney(user_id, amount)
    end)
  end
end)

RegisterCommand('takit', function(player, args, rawCommand)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.giveitem") then
    vRP.prompt(player,"Id name:","",function(player,idname) 
      idname = idname or ""
      vRP.prompt(player,"Amount:","",function(player,amount) 
        amount = parseInt(amount)
        vRP.giveInventoryItem(user_id, idname, amount,true)
      end)
    end)
  end
end)
-----------------------------------------------------------------------------------------------------------------------------------------

local function ch_calladmin(player,choice) -- 265
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		vRP.prompt(player,"الرجاء شرح مشكلتك","",
			function(player,desc) 
				if player_ad[player] == nil then
					player_ad[player] = true
				end
				if player_ad[player] == true then
					player_ad[player] = false
					SetTimeout(admin_ticket_time,
						function ()
							player_ad[player] = true
							TriggerClientEvent("pNotify:SendNotification",player,{text = "<span color='red'>يمكنك طلب ادمن الان.</span>", type = "error", timeout = (3000),layout = "centerRight"})
						end
					)
					desc = desc or ""
					if desc ~= nil and desc ~= "" then
						local answered = false
						local players = {}
						for k,v in pairs(vRP.rusers) do
							local player = vRP.getUserSource(tonumber(k))
							if vRP.hasPermission(k,"admin.tickets") and player ~= nil then
								table.insert(players,player)
							end
						end
						for k,v in pairs(players) do
							vRP.request(v,"طلب ادمن (user_id = "..user_id..") هل تريد القبول ?: "..htmlEntities.encode(desc), 60, 
								function(v,ok)
									if ok then -- take the call
										if not answered then
											-- answer the call
											vRPclient.notify(player,{""})
											TriggerClientEvent("pNotify:SendNotification",player,{text = "<span color='red'>تم قبول طلب الادمن.</span>", type = "error", timeout = (3000),layout = "centerRight"})
											vRPclient.getPosition(player, {}, 
												function(x,y,z)
													vRPclient.teleport(v,{x,y,z})
												end
											)
											answered = true
											sendADH(adminw,"```xl\r\nUser ID [ " .. vRP.getUserId(v) .. " ] Took a Ticket for ID [ " .. vRP.getUserId(player) .. " ] Saying [ " .. desc .. " ].```")
										else
											TriggerClientEvent("pNotify:SendNotification",player,{text = "<span color='red'>تم اخذ الطلب من قبل شخص اخر.</span>", type = "error", timeout = (3000),layout = "centerRight"})
										end
									end	
								end
							)
						end
					else
						TriggerClientEvent("pNotify:SendNotification",player,{text = "<span color='red'>الرجاء شرح مشكلتك.</span>", type = "error", timeout = (3000),layout = "centerRight"})
					end
				else
					TriggerClientEvent("pNotify:SendNotification",player,{text = "<span color='red'>الرجاء عدم الطلب اكثر من مره.</span>", type = "error", timeout = (3000),layout = "centerRight"})
				end
			end
		)
	end
end


local player_customs = {}

local function ch_display_custom(player, choice)
  vRPclient.getCustomization(player,{},function(custom)
    if player_customs[player] then -- hide
      player_customs[player] = nil
      vRPclient.removeDiv(player,{"customization"})
    else -- show
      local content = ""
      for k,v in pairs(custom) do
        content = content..k.." => "..json.encode(v).."<br />" 
      end

      player_customs[player] = true
      vRPclient.setDiv(player,{"customization",".div_customization{ margin: auto; padding: 8px; width: 500px; margin-top: 80px; background: black; color: white; font-weight: bold; ", content})
    end
  end)
end

local function ch_noclip(player, choice)
  vRPclient.toggleNoclip(player, {})
end

-- Hotkey Open Admin Menu 1/2
function vRP.openAdminMenu(source)
  vRP.buildMenu("admin", {player = source}, function(menudata)
    menudata.name = "Admin"
    menudata.css = {top="75px",header_color="rgba(0,125,255,0.75)"}
    vRP.openMenu(source,menudata)
  end)
end

-- Hotkey Open Admin Menu 2/2
function tvRP.openAdminMenu()
  vRP.openAdminMenu(source)
end

vRP.registerMenuBuilder("main", function(add, data)
  local user_id = vRP.getUserId(data.player)
  if user_id ~= nil then
    local choices = {}

    -- build admin menu
    choices["!-ادمن-!"] = {function(player,choice)
      vRP.buildMenu("admin", {player = player}, function(menu)
        menu.name = "!-ادمن-!"
        menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
        menu.onclose = function(player) vRP.openMainMenu(player) end -- nest menu

  --      if vRP.hasPermission(user_id,"player.list") then
    --      menu["قائمة الاعبين"] = {ch_list,"Show/hide user list."}
     --   end
        if vRP.hasPermission(user_id,"player.whitelist") then
          menu["القائمة البيضاء"] = {ch_whitelist}
        end
        if vRP.hasPermission(user_id,"player.group.add") then
          menu["أعطاء رتبه"] = {ch_addgroup}
        end
        if vRP.hasPermission(user_id,"player.group.remove") then
          menu["أزالة رتبه"] = {ch_removegroup}
        end
        if vRP.hasPermission(user_id,"player.unwhitelist") then
          menu["ازالة القائمة البيضاء"] = {ch_unwhitelist}
        end
        if vRP.hasPermission(user_id,"player.kick") then
          menu["طرد"] = {ch_kick}
        end
        if vRP.hasPermission(user_id,"player.ban") then
          menu["بـاند"] = {ch_ban}
        end
        if vRP.hasPermission(user_id,"player.unban") then
          menu["فك الباند"] = {ch_unban}
        end
        if vRP.hasPermission(user_id,"player.noclip") then
          menu["طيران"] = {ch_noclip}
        end
        if vRP.hasPermission(user_id,"player.custom_emote") then
          menu["الحركات"] = {ch_emote}
        end
--        if vRP.hasPermission(user_id,"player.custom_sound") then
--          menu["الصوت"] = {ch_sound}
--        end
        if vRP.hasPermission(user_id,"player.coords") then
          menu["احداثيات"] = {ch_coords}
        end
        if vRP.hasPermission(user_id,"player.tptome") then
          menu["سحب لاعب الي"] = {ch_tptome}
        end
        if vRP.hasPermission(user_id,"player.tpto") then
          menu["انتقال الى لاعب"] = {ch_tpto}
        end
        if vRP.hasPermission(user_id,"player.tpto") then
          menu["انتقال بالاحداثيات"] = {ch_tptocoords}
        end
        if vRP.hasPermission(user_id,"player.givemoney") then
          menu["سحب فلوس"] = {ch_givemoney}
        end
        if vRP.hasPermission(user_id,"player.giveitem") then
          menu["اخذ اغراض"] = {ch_giveitem}
        end
--       if vRP.hasPermission(user_id,"player.display_custom") then
--          menu["عرض التخصيص"] = {ch_display_custom}
--        end
        if vRP.hasPermission(user_id,"player.t3all") then
          menu["طلب ادمن"] = {ch_calladmin}
        end

        vRP.openMenu(player,menu)
      end)
    end}

    add(choices)
	end
end)

-- admin god mode
-- function task_god()
  -- SetTimeout(10000, task_god)

  -- for k,v in pairs(vRP.getUsersByPermission("admin.god")) do
    -- vRP.setHunger(v, 0)
    -- vRP.setThirst(v, 0)

    -- local player = vRP.getUserSource(v)
    -- if player ~= nil then
      -- vRPclient.setHealth(player, {200})
    -- end
  -- end
-- end

-- task_god()

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/adminmenu" then
vRP.openAdminMenu(source)
			end
end)