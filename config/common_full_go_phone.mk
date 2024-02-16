# Set ScoopDroid specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common ScoopDroid stuff
$(call inherit-product, vendor/scoop/config/common_full_phone.mk)
