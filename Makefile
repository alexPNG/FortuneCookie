INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = armv7 armv7s arm64 arm64e
TARGET = iphone:clang::7.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FortuneCookie
FortuneCookie_FILES = Tweak.xm

SUBPROJECTS += prefs

include $(THEOS_MAKE_PATH)/tweak.mk

include $(THEOS_MAKE_PATH)/aggregate.mk