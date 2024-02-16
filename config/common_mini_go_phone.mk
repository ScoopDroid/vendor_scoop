# Set ScoopDroid specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common ScoopDroid stuff
$(call inherit-product, vendor/scoop/config/common_mini_phone.mk)
