# Inherit common ScoopDroid stuff
$(call inherit-product, vendor/scoop/config/common_mobile.mk)

PRODUCT_SIZE := full

# Apps
PRODUCT_PACKAGES += \
    Gramophone

ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Flash
endif

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd

# Overlays
include vendor/overlay/overlays.mk

# Fonts
include vendor/fontage/config.mk
