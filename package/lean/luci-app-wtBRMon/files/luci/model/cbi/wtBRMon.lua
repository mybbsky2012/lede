local fs = require "nixio.fs"
local netdata_on = (luci.sys.call("pidof netdata > /dev/null") == 0)
local router_ip = luci.sys.exec("uci get network.lan.ipaddr")

m=Map("wtBRMon",translate("wtBRMon"),translate("这是一个带宽显示的配置页面<br /><p align=\"justify\"><script type=\"text/javascript\"></script><input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"进入页面\" onclick=\"window.open('http://'+window.location.host+'/wtBRMon')\" /></p>"))

s =m:section(TypedSection,"interface", translate("wtBRMon setting"))
s.anonymous=true

o=s:option(Value, "upload", translate("Upload bandwidth"), translate("units Mb/s"))
o.rmempty = true
o.placeholder = "100000"

o=s:option(Value, "download", translate("Download bandwidth"), translate("units Mb/s"))
o.rmempty = true
o.placeholder = "100000"

return m
