ARCHS = armv7 armv7s arm64 arm64e
TARGET = iphone:clang::7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FortuneCookie

FortuneCookie_FILES = FCCRootListController.m
FortuneCookie_INSTALL_PATH = /Library/PreferenceBundles
FortuneCookie_FRAMEWORKS = UIKit
FortuneCookie_PRIVATE_FRAMEWORKS = Preferences
FortuneCookie_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/FortuneCookie.plist$(ECHO_END)
