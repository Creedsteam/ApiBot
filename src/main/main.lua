local token = "191805318:AAG0JnTJyj5JV_iiQYdo-v6RBG_wA8Y2NSU";

local bot, events = require("api").configure(token);

local http = require("socket.http");
local redis = require("redis.redis");
local data = require("data.data");
local admins = require("admins.admins");

function events.onMessageReceive(msg)
    db = data.load("./data/db.json");
    print(msg.from.username .. " : " .. msg.text)
    db2 = checkStartStop(msg, msg.text, db)
    data.save("./data/db.json", db2); 
end

function events.onInlineQueryReceive(inlineQuery)

end

function checkStartStop(msg, text, db)
    if ( text:lower() == "/start" ) then
        db["usersList"][tostring(msg.from.id)] = {username = msg.from.username};
        bot.sendMessage(msg.chat.id, "*Start*", "Markdown");
        return db;
    elseif ( text:lower() == "/stop" ) then
        db["usersList"][tostring(msg.from.id)] = nil
        bot.sendMessage(msg.chat.id, "*stop*", "Markdown");
        return db;
    else
        return db;
    end
end


events.run()
