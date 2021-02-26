local Proxy = module("vrp", "lib/Proxy")

RegisterServerEvent('paycheck:salary_ad')
AddEventHandler('paycheck:salary_ad', function()
  	local user_id = vRP.getUserId(source)
		if vRP.hasPermission(user_id,"PoliceChief.paycheck") then
		vRP.giveBankMoney(user_id,150000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب وزير الداخلية 150000دينار<br/>"})----------------------وزير الداخلية----------------------
		end
		if vRP.hasPermission(user_id,"Deputy_PoliceChief.paycheck") then
		vRP.giveBankMoney(user_id,100000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب نائب وزير الداخلية 100000دينار<br/>"})----------------------نائب وزير الداخلية----------------------
		end
		if vRP.hasPermission(user_id,"First_Team.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب فريق اول 75000دينار<br/>"})----------------------فريق اول----------------------
		end
		if vRP.hasPermission(user_id,"Team.paycheck") then
		vRP.giveBankMoney(user_id,68000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب فريق 68000دينار<br/>"})---------------------فريق----------------------
		end
		if vRP.hasPermission(user_id,"major_General.paycheck") then
		vRP.giveBankMoney(user_id,60000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب لواء 60000دينار<br/>"})----------------------لواء----------------------
		end
		if vRP.hasPermission(user_id,"dean.paycheck") then
		vRP.giveBankMoney(user_id,55000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب عميد 55000دينار<br/>"})----------------------عميد----------------------
		end
		if vRP.hasPermission(user_id,"Colonel.paycheck") then
		vRP.giveBankMoney(user_id,50000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب عقيد 50000دينار<br/>"})----------------------عقيد----------------------
		end
		if vRP.hasPermission(user_id,"Presented.paycheck") then
		vRP.giveBankMoney(user_id,45000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب مقدم 45000دينار<br/>"})----------------------مقدم----------------------
		end
		if vRP.hasPermission(user_id,"Pioneer.paycheck") then
		vRP.giveBankMoney(user_id,42000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب رائد 42000دينار<br/>"})----------------------رائد----------------------
		end
		if vRP.hasPermission(user_id,"captain.paycheck") then
		vRP.giveBankMoney(user_id,38000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب نقيب 38000دينار<br/>"})----------------------نقيب----------------------
		end
		if vRP.hasPermission(user_id,"first_lieutenant.paycheck") then
		vRP.giveBankMoney(user_id,35000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب ملازم اول 35000دينار<br/>"})----------------------ملازم اول----------------------
		end
		if vRP.hasPermission(user_id,"lieutenant.paycheck") then
		vRP.giveBankMoney(user_id,32000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب ملازم 32000دينار<br/>"})----------------------ملازم----------------------
		end
		if vRP.hasPermission(user_id,"staff_Sergeant1.paycheck") then
		vRP.giveBankMoney(user_id,28000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب رقيب اول 28000دينار<br/>"})----------------------رقيب اول----------------------
		end
		if vRP.hasPermission(user_id,"Sergeant.paycheck") then
		vRP.giveBankMoney(user_id,25000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب رقيب 25000دينار<br/>"})----------------------رقيب----------------------
		end
		if vRP.hasPermission(user_id,"firstsoldier.paycheck") then
		vRP.giveBankMoney(user_id,23000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب عريف 23000دينار<br/>"})----------------------عريف----------------------
		end
		if vRP.hasPermission(user_id,"first_soldier.paycheck") then
		vRP.giveBankMoney(user_id,20000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب جندي أول 20000دينار<br/>"})----------------------جندي أول----------------------
		end
		if vRP.hasPermission(user_id,"soldier.paycheck") then
		vRP.giveBankMoney(user_id,18000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب جندي 18000دينار<br/>"})----------------------جندي----------------------
		end---------------------------------------------------------------------------------------الدولة امن رواتب---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		if vRP.hasPermission(user_id,"amn1.paycheck") then
		vRP.giveBankMoney(user_id,200000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>رئيس وزارة الدفاع 300000دينار<br/>"})----------------------مسؤول امن الدولة----------------------
		end
		if vRP.hasPermission(user_id,"amn2.paycheck") then
		vRP.giveBankMoney(user_id,100000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>نائب رئيس وزارة الدفاع 200000دينار<br/>"})----------------------نائب مسؤول امن الدولة----------------------
		end
		if vRP.hasPermission(user_id,"amn3.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>فريق اول وزارة الدفاع75000دينار<br/>"})----------------------فريق اول امن الدولة----------------------
		end
		if vRP.hasPermission(user_id,"amn4.paycheck") then
		vRP.giveBankMoney(user_id,68000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>فريق وزارة الدفاع68000دينار<br/>"})---------------------فريق امن الدولة----------------------
		end
		if vRP.hasPermission(user_id,"amn5.paycheck") then
		vRP.giveBankMoney(user_id,55000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>لواء وزارة الدفاع 55000دينار<br/>"})----------------------عميد امن الدولة----------------------
		end
		if vRP.hasPermission(user_id,"amn6.paycheck") then
		vRP.giveBankMoney(user_id,50000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>عميد وزارة الدفاع 50000دينار<br/>"})----------------------عقيد امن الدولة----------------------
		end
		if vRP.hasPermission(user_id,"amn7.paycheck") then
		vRP.giveBankMoney(user_id,45000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>عقيد وزارة الدفاع 45000دينار<br/>"})----------------------مقدم امن الدولة----------------------
		end
		if vRP.hasPermission(user_id,"amn8.paycheck") then
		vRP.giveBankMoney(user_id,42000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>مقدم وزارة الدفاع 42000دينار<br/>"})----------------------رائد امن الدولة----------------------
		end
		if vRP.hasPermission(user_id,"amn9.paycheck") then
		vRP.giveBankMoney(user_id,38000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>رائد وزارة الدفاع 38000دينار<br/>"})----------------------نقيب جمارك----------------------
		end
		if vRP.hasPermission(user_id,"amn10.paycheck") then
		vRP.giveBankMoney(user_id,35000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>نقيب وزارة الدفاع 35000دينار<br/>"})----------------------ملازم اول جمارك----------------------
		end
		if vRP.hasPermission(user_id,"amn11.paycheck") then
		vRP.giveBankMoney(user_id,32000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>ملازم اول وزارة الدفاع 32000دينار<br/>"})----------------------ملازم جمارك----------------------
		end
		if vRP.hasPermission(user_id,"amn12.paycheck") then
		vRP.giveBankMoney(user_id,28000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>ملازم اول وزارة الدفاع 30000دينار<br/>"})----------------------رقيب اول جمارك----------------------
		end
		if vRP.hasPermission(user_id,"amn13.paycheck") then
		vRP.giveBankMoney(user_id,28000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>ملازم وزارة الدفاع 28000دينار<br/>"})----------------------رقيب اول جمارك----------------------
		end
		if vRP.hasPermission(user_id,"amn14.paycheck") then
		vRP.giveBankMoney(user_id,25000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>رقيب اول وزارة الدفاع 27000دينار<br/>"})----------------------رقيب جمارك----------------------
		end
		if vRP.hasPermission(user_id,"amn15.paycheck") then
		vRP.giveBankMoney(user_id,25000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>رقيب وزارة الدفاع 25000دينار<br/>"})----------------------رقيب جمارك----------------------
		end
		if vRP.hasPermission(user_id,"amn16.paycheck") then
		vRP.giveBankMoney(user_id,23000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>عريف وزارة الدفاع 23000دينار<br/>"})----------------------عريف جمارك----------------------
		end
		if vRP.hasPermission(user_id,"amn17.paycheck") then
		vRP.giveBankMoney(user_id,20000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>جندي اول وزارة الدفاع 20000دينار<br/>"})----------------------جندي أول جمارك----------------------
		end
		if vRP.hasPermission(user_id,"amn18.paycheck") then
		vRP.giveBankMoney(user_id,18000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>جندي وزارة الدفاع 18000دينار<br/>"})----------------------جندي جمارك----------------------
    	end---------------------------------------------------------------------------------------رواتب المسعفين---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		if vRP.hasPermission(user_id,"ems2.paycheck") then
		vRP.giveBankMoney(user_id,250000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب وزيرالصحة 250000دينار<br/>"})-----------وزيرالصحة---------------
		end
		if vRP.hasPermission(user_id,"ems3.paycheck") then
		vRP.giveBankMoney(user_id,200000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب نائب الوزير الصحة 200000دينار<br/>"})-----------نائب الوزير الصحة--------
		end
		if vRP.hasPermission(user_id,"ems4.paycheck") then
		vRP.giveBankMoney(user_id,100000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب بروفيسور 100000دينار<br/>"})--------------بروفيسور--------------		
		end						
		if vRP.hasPermission(user_id,"ems5.paycheck") then
		vRP.giveBankMoney(user_id,90000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب استشاري 90000دينار<br/>"})---------------استشاري---------------
		end		
		if vRP.hasPermission(user_id,"ems6.paycheck") then
		vRP.giveBankMoney(user_id,80000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب اخصائي 80000دينار<br/>"})---------------اخصائي---------------
		end
		if vRP.hasPermission(user_id,"ems7.paycheck") then
		vRP.giveBankMoney(user_id,55000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب دكتور 55000دينار<br/>"})-------------دكتور--------------
		end
		if vRP.hasPermission(user_id,"ems8.paycheck") then
		vRP.giveBankMoney(user_id,50000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب ممرض 50000دينار<br/>"})------------ممرض--------------				
		end
		if vRP.hasPermission(user_id,"ems9.paycheck") then
		vRP.giveBankMoney(user_id,40000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب مسعف 40000دينار<br/>"})------------مسعف--------------						
		end---------------------------------------------------------------------------------------------------------------------------رواتب المواطنين--------------------------------------------------------------------------------------------------------------------
		if vRP.hasPermission(user_id,"repair.paycheck") then
		vRP.giveBankMoney(user_id,10000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب 10000دينار<br/>"})---------------------------ميكانيكي----------------------------
		end		
		if vRP.hasPermission(user_id,"uber.paycheck") then
		vRP.giveBankMoney(user_id,10000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب 10000دينار<br/>"})---------------------------كاريم------------------------------------------
		end
		if vRP.hasPermission(user_id,"medical.paycheck") then
		vRP.giveBankMoney(user_id,10000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب 10000دينار<br/>"})---------------------------------------حشيش طبي----------------------------------- 				
		end
		if vRP.hasPermission(user_id,"the_ruler.paycheck") then
		vRP.giveBankMoney(user_id,1500000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب الحاكم 1200000دينار<br/>"})-------------------------------------------------الحاكم-------------------------------------
	    end
		if vRP.hasPermission(user_id,"raeswzara.paycheck") then
		vRP.giveBankMoney(user_id,600000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب رئيس الوزراء 600000دينار<br/>"})-------------------------------------------------رئيس الوزراء-------------------------------------
		end
		if vRP.hasPermission(user_id,"prince.paycheck") then
		vRP.giveBankMoney(user_id,40000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب الامير 40000دينار<br/>"})-------------------------------------------------الامير-------------------------------------						
		end ----------------------------------------------vip---------------------------vip----------------------------vip-----------------------------
		if vRP.hasPermission(user_id,"Diamond.paycheck") then
		vRP.giveBankMoney(user_id,100000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب رتبة دايموند 100000دينار<br/>"})-------------------------------------------------الملك-------------------------------------						
		end
		if vRP.hasPermission(user_id,"Platinum.paycheck") then
		vRP.giveBankMoney(user_id,50000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب ال رتبة بلاتينيوم 50000دينار<br/>"})-------------------------------------------------الملك-------------------------------------						
		end
		if vRP.hasPermission(user_id,"Gold.paycheck") then
		vRP.giveBankMoney(user_id,25000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب الرتبة الذهبية 25000 دينار<br/>"})-------------------------------------------------الملك-------------------------------------						
		end
		if vRP.hasPermission(user_id,"Silver.paycheck") then
		vRP.giveBankMoney(user_id,15000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب الرتبة الفضية 15000 دينار<br/>"})-------------------------------------------------الملك-------------------------------------						
		end
		if vRP.hasPermission(user_id,"Bronz.paycheck") then
		vRP.giveBankMoney(user_id,5000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب الرتبة البرونزية 5000دينار<br/>"})-------------------------------------------------الملك-------------------------------------						
		end			-------vip رواتب-------	
        if vRP.hasPermission(user_id,"sfer.paycheck") then
		vRP.giveBankMoney(user_id,15000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب السفير دبلوماسي 15000دينار<br/>"})-------------------------------------------------سفير-------------------------------------										
		end	 ------- رواتب البلاك ماركت -----
        if vRP.hasPermission(user_id,"blackmarket.paycheck") then
		vRP.giveBankMoney(user_id,20000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب البلاك ماركت 20000دينار<br/>"})-------------------------------------------------البلاك ماركت-------------------------------------										
		end	
		-------رواتب عصابات-------		
		if vRP.hasPermission(user_id,"mafia.paycheck") then
		vRP.giveBankMoney(user_id,12000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EXR-Files",false,"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>راتب العصابات 12000دينار<br/>"})
	end
end)

RegisterServerEvent('paycheck:bonus_ad')
AddEventHandler('paycheck:bonus_ad', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"user.paycheck") then
		vRP.giveBankMoney(user_id,6000)
		vRPclient.notify(source,{"<img src='https://cdn.discordapp.com/attachments/789626361051349056/806724468436762627/3D-Logo-Int.gif' alt='Smiley face' width='62' height='62'><br/>هدية من المدينة 6000ليرا<br/>"})
	end
end)
