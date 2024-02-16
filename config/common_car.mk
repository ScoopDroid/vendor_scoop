# Inherit common ScoopDroid stuff
$(call inherit-product, vendor/scoop/config/common.mk)

# Inherit ScoopDroid car device tree
$(call inherit-product, device/scoop/car/scoop_car.mk)

# Inherit the main AOSP car makefile that turns this into an Automotive build
$(call inherit-product, packages/services/Car/car_product/build/car.mk)
