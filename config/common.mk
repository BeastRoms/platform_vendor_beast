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
    vendor/beast/prebuilt/common/media/bootanimation.zip:system/product/media/bootanimation.zip

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
    ro.opa.eligible_device=true


# Fix Google dialer
PRODUCT_COPY_FILES += \
    vendor/beast/prebuilt/common/etc/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

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

# Google fonts
PRODUCT_COPY_FILES += \
    vendor/beast/prebuilt/product/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml \
    vendor/beast/prebuilt/product/fonts/ArbutusSlab-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ArbutusSlab-Regular.ttf \
    vendor/beast/prebuilt/product/fonts/GoogleSans-BoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-BoldItalic.ttf \
    vendor/beast/prebuilt/product/fonts/GoogleSans-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Bold.ttf \
    vendor/beast/prebuilt/product/fonts/GoogleSans-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Italic.ttf \
    vendor/beast/prebuilt/product/fonts/GoogleSans-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-MediumItalic.ttf \
    vendor/beast/prebuilt/product/fonts/GoogleSans-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Medium.ttf \
    vendor/beast/prebuilt/product/fonts/GoogleSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Regular.ttf \
    vendor/beast/prebuilt/product/fonts/Lato-BoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-BoldItalic.ttf \
    vendor/beast/prebuilt/product/fonts/Lato-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Bold.ttf \
    vendor/beast/prebuilt/product/fonts/Lato-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Italic.ttf \
    vendor/beast/prebuilt/product/fonts/Lato-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-MediumItalic.ttf \
    vendor/beast/prebuilt/product/fonts/Lato-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Medium.ttf \
    vendor/beast/prebuilt/product/fonts/Lato-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Regular.ttf \
    vendor/beast/prebuilt/product/fonts/Rubik-BoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-BoldItalic.ttf \
    vendor/beast/prebuilt/product/fonts/Rubik-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Bold.ttf \
    vendor/beast/prebuilt/product/fonts/Rubik-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Italic.ttf \
    vendor/beast/prebuilt/product/fonts/Rubik-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-MediumItalic.ttf \
    vendor/beast/prebuilt/product/fonts/Rubik-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Medium.ttf \
    vendor/beast/prebuilt/product/fonts/Rubik-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Regular.ttf \
    vendor/beast/prebuilt/product/fonts/ZillaSlab-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-MediumItalic.ttf \
    vendor/beast/prebuilt/product/fonts/ZillaSlab-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-Medium.ttf \
    vendor/beast/prebuilt/product/fonts/ZillaSlab-SemiBoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-SemiBoldItalic.ttf \
    vendor/beast/prebuilt/product/fonts/ZillaSlab-SemiBold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-SemiBold.ttf

# Markup libs
PRODUCT_COPY_FILES += \
    vendor/beast/prebuilt/google/lib/libsketchology_native.so:system/product/lib/libsketchology_native.so \
    vendor/beast/prebuilt/google/lib64/libsketchology_native.so:system/product/lib64/libsketchology_native.so

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
