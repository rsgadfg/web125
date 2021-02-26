-- a basic ATM implementation
local lang = vRP.lang
local cfg = module("cfg/atms")
local atms = cfg.atms

local webhook2 = "" 

function sendWebhookMessage(webhook2,message)
	if webhook2 ~= "none" then
		PerformHttpRequest(webhook2, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
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

local function play_atm_enter(player)
  vRPclient.playAnim(player,{false,{{"amb@prop_human_atm@male@enter","enter"},{"amb@prop_human_atm@male@idle_a","idle_a"}},false})
end

local function play_atm_exit(player)
  vRPclient.playAnim(player,{false,{{"amb@prop_human_atm@male@exit","exit"}},false})
end

local function atm_choice_deposit(player,choice)
  play_atm_enter(player) --anim

  vRP.prompt(source,lang.atm.deposit.prompt(),"",function(player,v)
    play_atm_exit(player)

    v = parseInt(v)

    if v > 0 then
      local user_id = vRP.getUserId(source)
      if user_id ~= nil then
        if vRP.tryDeposit(user_id,v) then
          TriggerClientEvent("pNotify:SendNotification",source,{text = "<big>اودعت فلوسك</big> <br/><b style='color:green'> الملبغ : "..v.."</b><br/>", type = "info", timeout = (3000),layout = "gta"})
		  sendWebhookMessage(webhook2,"```xl\r\n User_id " .. user_id .." ايداع " .. v .."```")
		  vRPbm.logInfoToFile("atmLog.txt","Uesr id:" .. user_id .. " ايداع " .. v .. "\r\n")
		else  
        TriggerClientEvent("pNotify:SendNotification",source,{text = "<big>ما عندك فلوس كثير </big>", type = "info", timeout = (3000),layout = "gta"})
        end
      end
    else
     TriggerClientEvent("pNotify:SendNotification",source,{text = "<big>المبلغ غير صحيح</big>", type = "info", timeout = (3000),layout = "gta"})
    end
  end)
end

local function atm_choice_withdraw(player,choice)
  play_atm_enter(player)

  vRP.prompt(source,lang.atm.withdraw.prompt(),"",function(player,v)
    play_atm_exit(player) --anim

    v = parseInt(v)

    if v > 0 then
      local user_id = vRP.getUserId(source)
      if user_id ~= nil then
        if vRP.tryWithdraw(user_id,v) then
          TriggerClientEvent("pNotify:SendNotification",source,{text = "<big>سحبت فلوسك</big> <br/><b style='color:green'> الملبغ : "..v.."</b><br/>", type = "info", timeout = (3000),layout = "gta"})
		  sendWebhookMessage(webhook2,"```xl\r\n User_id " .. user_id .." سحب " .. v .."```")
		  vRPbm.logInfoToFile("atmLog.txt","Uesr id:" .. user_id .. " سحب " .. v .. "\r\n")
        else
          TriggerClientEvent("pNotify:SendNotification",source,{text = "<big>ما عندك فلوس كثير</big>", type = "info", timeout = (3000),layout = "gta"})
        end
      end
    else
      TriggerClientEvent("pNotify:SendNotification",source,{text = "<big>المبلغ غير صحيح</big>", type = "info", timeout = (3000),layout = "gta"})
    end
  end)
end

local atm_menu = {
  name=lang.atm.title(),
  css={top = "75px", header_color="rgba(0,255,125,0.75)"}
}

atm_menu[lang.atm.deposit.title()] = {atm_choice_deposit,lang.atm.deposit.description()}
atm_menu[lang.atm.withdraw.title()] = {atm_choice_withdraw,lang.atm.withdraw.description()}

local function atm_enter()
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    atm_menu[lang.atm.info.title()] = {function()end,lang.atm.info.bank({vRP.getBankMoney(user_id)})}
    vRP.openMenu(source,atm_menu) 
  end
end

local function atm_leave()
  vRP.closeMenu(source)
end

local function build_client_atms(source)
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    for k,v in pairs(atms) do
      local x,y,z = table.unpack(v)
      vRPclient.addScaledBlip(source,{x,y,z,1.0,108,4,lang.atm.title()})
      vRPclient.addCustomMarker(source,{29,x,y,z,0,0,0,1,1,1,0,255,0, 255, 49,1,0,0})
      vRP.setArea(source,"vRP:atm"..k,x,y,z,1,1.5,atm_enter,atm_leave)
    end
  end
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
  if first_spawn then
    build_client_atms(source)
  end
end)