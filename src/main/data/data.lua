local JSON = (loadfile "data/dkjson.lua")()
data = {}

FilePath = "data.db.json";
data.FilePath = FilePath;

-- this function will return the json in the file as lua table
-- if fp == nil then it will load the default data file
function data.load(fp)
    xp = fp or FilePath;
	local f = io.open(xp)

	if not f then
	    --print("File not loaded")
		return {}
	end

	local s = f:read("*all")
	f:close()

	local data = JSON.decode(s)
    --print("File loaded")
	return data
end

-- this function will write the table passed to a file as json
-- if fp == nil then it will save it to the default data file
function data.save(fp, data)
    xp = fp or FilePath;

    local s = JSON.encode(data)
    local f = io.open(xp, "w")
    if ( f ) then
        f:write(s)
        f:close()
        --print("File saved")
    else
        --print("File not saved")
    end
end



return data;