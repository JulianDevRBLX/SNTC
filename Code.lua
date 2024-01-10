local SNTC = {
	["getPublicJoy"]={};
	["publicVar"]={};
	["librariesUnLoaded"] = {};
	["localVersion"] = "1.0"
}


SNTC.joy = function(fun)
	if fun then
		fun()
	end
end

SNTC.void = function(fun)
	if fun then
		return fun
	end
end

--SNTC.publica = function(id, fun)
--	if id then
--		if fun then
--			table.insert(
--				SNTC.getPublicJoy
--				,{
--					["ID"] = id;
--					["FUN"] = fun
--				})
--			print("New public joy: "..id)
--		end
--	end
--end

--SNTC.publicjoy = function(id)
--	for i,v in pairs(SNTC.getPublicJoy) do
--		if v.ID then
--			if v.FUN then
--				if v.ID == id then
--					v.FUN()
--				else
--					continue
--				end
--			end
--		end
--	end
--end

SNTC.load= function()
	print("Loading script...")
	print("Requesting online data...")
	local versionManager = require(15936861509)
	print("Data requested")
	print("Checking SNTC Version...")
	if versionManager.LastVerision == SNTC.localVersion then 
		print("Version of SNTC checked: Updated")
		print("This version of SNTCis updated.")
		print("==============================")
		print("Loaded version: "..SNTC.localVersion)
		print("Last version: "..versionManager.LastVerision)
		print("==============================")
		print("Stay updated") 
	else
		warn("Version of SNTC checked: Not updated")
		warn("This version of SNTC is outdated.")
		warn("==============================")
		warn("Loaded version: "..SNTC.localVersion)
		warn("Last version: "..versionManager.LastVerision)
		warn("==============================")
		warn("This version is outdated,")
		warn("it may have errors and security gaps")
		
	end
	print("Loading extra libraries...")
	--Other loads
	print("Complete")
	
end

SNTC.method = {
	["public"]={
		["joy"]={
			["new"] = function(id:string, fun)
				if id then
					if fun then
						table.insert(
							SNTC.getPublicJoy
							,{
								["ID"] = id;
								["FUN"] = fun
							})
						print("New public joy: "..id)
					end
				end
			end;
			["run"] = function(id)
				for i,v in pairs(SNTC.getPublicJoy) do
					if v.ID then
						if v.FUN then
							if v.ID == id then
								v.FUN()
							else
								continue
							end
						end
					end
				end
			end
			
		};
		["var"] = {
			["new"] = function(id,value,AutoSetDeafultValue,deaultValue)
				if id then
					if value then
						if AutoSetDeafultValue then
							if AutoSetDeafultValue ==true then
								table.insert(SNTC.publicVar,
									{
										["ID"] = id;
										["value"] = value;
										["Default"] = deaultValue;
									})
							end
							if AutoSetDeafultValue ==false then
								table.insert(SNTC.publicVar,
									{
										["ID"] = id;
										["value"] = value;
										["Default"] = value;
									})
							end
						end
					end
				end
			end,
			["set"] = function(id,newvalue)
				if id then
					for i,v in pairs(SNTC.publicVar) do
						if v.ID then
							if v.value then
								if v.ID==id then
									v.value = newvalue
								end
							end
						end
					end
				else
					warn("NO HAY ID")
				end
				
			end,
			["resetToDefault"] = function(id)
				if id then
					for i,v in pairs(SNTC.publicVar) do
						if id and id == v.ID then
							v.value=v.Default
						end
					end
				end
			end,
			["changeDefault"] = function(id,newDefault)
				if id and newDefault then
					for i,v in pairs(SNTC.publicVar) do
						if v.ID==id then
							v.Default=newDefault
						end
					end
				end
			end,
		}
	},
	["math"] = {
		["sqrt"] = function (x:number)
			if x then
				return math.sqrt(x)
			end
		end
	}
	
	
}

SNTC.import = {
	["Other"] = {
		["method"] = {
			["Version"] = function()
				print("SNTC Version 1.0")
			end,
		}
	},
	["ilim"] = function(id:number)
		if id then
			return require(id)
		end
	end,
}
return SNTC
