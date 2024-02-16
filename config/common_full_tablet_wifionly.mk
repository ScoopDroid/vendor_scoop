$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit full common ScoopDroid stuff
$(call inherit-product, vendor/scoop/config/common_full.mk)

# GApps
WITH_GMS := true
# Inherit from GMS product config
$(call inherit-product, vendor/gms/gms_full_tablet_wifionly.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include ScoopDroid LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/scoop/overlay/dictionaries

# Pixel Framework
$(call inherit-product, vendor/pixel-framework/config.mk)

$(call inherit-product, vendor/scoop/config/wifionly.mk)
