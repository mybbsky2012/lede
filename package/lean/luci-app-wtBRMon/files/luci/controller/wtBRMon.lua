--[[
form https://github.com/wtc0der/wtBRMon.git
]]--
module("luci.controller.wtBRMon", package.seeall)
function index()
        if not nixio.fs.access("/etc/config/wtBRMon") then
                return
        end
        entry({"admin", "status", "wtBRMon"}, cbi("wtBRMon"), _("bandwidth Monitor")).dependent = true
end
