# Inherit mini common ScoopDroid stuff
$(call inherit-product, vendor/scoop/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/scoop/config/wifionly.mk)
