# Inherit full common ScoopDroid stuff
$(call inherit-product, vendor/scoop/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include ScoopDroid LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/scoop/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

# GApps
WITH_GMS := true
# Inherit from GMS product config
ifeq ($(TARGET_USES_MINI_GAPPS),true)
$(call inherit-product, vendor/gms/gms_mini.mk)
else ifeq ($(TARGET_USES_PICO_GAPPS),true)
$(call inherit-product, vendor/gms/gms_pico.mk)
else
$(call inherit-product, vendor/gms/gms_full.mk)
endif

# Pixel Framework
$(call inherit-product, vendor/pixel-framework/config.mk)

# Inherit from telephony config
$(call inherit-product, vendor/scoop/config/telephony.mk)
