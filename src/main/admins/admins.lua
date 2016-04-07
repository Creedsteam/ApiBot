admins = {
    list = {
        "121414901",
        "34235668"
    }
}

function isAdmin(id)
    for k,v in pairs(admins.list) do
        if ( tostring(id) == tostring(v) ) then
            return true;
        end
    end
    return false;
end
admins.isAdmin = isAdmin;

return admins;