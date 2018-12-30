#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wrt3200acm-temperature
PKG_VERSION:=1
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  TITLE:=Show temperatures for WRT3200ACM
  MAINTAINER:=Ross Shen
  DEPENDS:=@TARGET_mvebu
endef

define Package/$(PKG_NAME)/description
Show CPU, RAM and Wi-Fi temperatures for WRT3200ACM
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/i18n/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/index.htm $(1)/etc/index.htm
	$(INSTALL_DATA) ./files/lease_status.htm $(1)/etc/lease_status.htm
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -f /etc/index.htm ] && mv /etc/index.htm /usr/lib/lua/luci/view/admin_status/index.htm
[ -f /etc/lease_status.htm ] && mv /etc/lease_status.htm /usr/lib/lua/luci/view/admin_network/lease_status.htm
exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
