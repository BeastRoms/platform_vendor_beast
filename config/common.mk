include vendor/beast/config/ProductConfigQcom.mk

PRODUCT_SOONG_NAMESPACES += $(PATHMAP_SOONG_NAMESPACES)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/beast/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/beast/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/beast/prebuilt/common/bin/50-base.sh:system/addon.d/50-base.sh \

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/beast/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/beast/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/beast/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/beast/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip \

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.build.selinux=1 \
    ro.boot.vendor.overlay.theme=com.beast.overlay.accent.purple;com.beast.overlay.base.stockfixed;com.beast.overlay.lawnconf;com.beast.overlay.shape.circle \
    ro.opa.eligible_device=true


# POSP Common
PRODUCT_COPY_FILES += \
    vendor/beast/prebuilt/common/etc/permissions/privapp-permissions-beast.xml:system/etc/permissions/privapp-permissions-beast.xml

# Fix Google dialer
PRODUCT_COPY_FILES += \
    vendor/beast/prebuilt/common/etc/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Clean up packages cache to avoid wrong strings and resources
PRODUCT_COPY_FILES += \
    vendor/beast/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh


# Set custom volume steps
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.media_vol_steps=30 \
    ro.config.bt_sco_vol_steps=30

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/beast/config/permissions/custom-power-whitelist.xml:system/etc/sysconfig/custom-power-whitelist.xml

# Disable Rescue Party
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.disable_rescue=true

# exFAT
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Markup libs
PRODUCT_COPY_FILES += \
    vendor/beast/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/beast/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so

# GSans font
include vendor/beast/config/fonts.mk

# We modify several neverallows, so let the build proceed
ifneq ($(TARGET_BUILD_VARIANT),user)
    SELINUX_IGNORE_NEVERALLOWS := true
endif

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/beast/overlay/common

# Packages
include vendor/beast/config/packages.mk

# Branding
include vendor/beast/config/branding.mk
