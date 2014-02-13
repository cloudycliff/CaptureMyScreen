FW_DEVICE_IP=192.168.1.105

include theos/makefiles/common.mk

TWEAK_NAME = CaptureMyScreen
CaptureMyScreen_FILES = ActivatorListener.mm CaptureMyScreen.m
CaptureMyScreen_FRAMEWORKS = QuartzCore UIKit CoreGraphics
CaptureMyScreen_PRIVATE_FRAMEWORKS = IOSurface IOMobileFramebuffer IOKit
CaptureMyScreen_LDFLAGS = -lactivator

include $(THEOS_MAKE_PATH)/tweak.mk

# after-install::
# 	install.exec "killall -9 SpringBoard"
