# Inherit common ScoopDroid stuff
$(call inherit-product, vendor/scoop/config/common.mk)

# Inherit ScoopDroid atv device tree
$(call inherit-product, device/scoop/atv/scoop_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

PRODUCT_PACKAGE_OVERLAYS += vendor/scoop/overlay/tv
