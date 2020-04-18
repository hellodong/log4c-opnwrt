#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=log4c
PKG_VERSION:=1.2.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://sourceforge.mirrorservice.org/l/lo/log4c/log4c/1.2.3/
PKG_MD5SUM:=f35264f40c33dc308cff12193583981d

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_LICENSE:=GPL-2.0+

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/log4c
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A log library
  URL:=http://www.oberhumer.com/opensource/lzo/
endef

define Package/lib4c/description
 lib4c
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \

TARGET_CFLAGS += $(FPIC)
MAKE_FLAGS += $(TARGET_CFLAGS)

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	#$(CP) $(PKG_INSTALL_DIR)/usr/include/lzo $(1)/usr/include/
	#$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblzo2.{a,so*} $(1)/usr/lib/
endef

define Package/log4c/install
	$(INSTALL_DIR) $(1)/usr/lib
	#$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblzo2.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,log4c))
