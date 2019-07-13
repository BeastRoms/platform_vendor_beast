# Copyright (C) 2019 BeastROMs
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Required packages

PRODUCT_PACKAGES += \
    Gallery2 \
    Beast \
    GboardGoPreb \
    Launcher3 \
    LiveWallpapers \
    LiveWallpapersPicker \
    MarkupGoogle \
    messaging \
    SubstratumSignature \
    WellbeingPrebuilt \
    OmniStyle \
    WallpaperPickerGoogle \
    WeatherClient

# Weather permissions
PRODUCT_COPY_FILES += \
	vendor/beast/prebuilt/common/etc/permissions/org.pixelexperience.weather.client.xml:system/etc/permissions/org.pixelexperience.weather.client.xml \
    vendor/beast/prebuilt/common/etc/permissions/default-permissions/org.pixelexperience.weather.client.xml:system/etc/default-permissions/org.pixelexperience.weather.client.xml
	
# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/beast/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Filesystems tools
PRODUCT_PACKAGES += \
    BluetoothExt \
    Calendar \
    ExactCalculator \
    LatinIME \
    Launcher3QuickStep \
    messaging \
    Stk

 # Extra tools
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    e2fsck \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    nano \
    openvpn \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# exFAT tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank
endif

# Overlays
PRODUCT_PACKAGES += \
    AmberAccent \
    BlueAccent \
    BlueGreyAccent \
    BrownAccent \
    CyanAccent \
    DeepOrangeAccent \
    DeepPurpleAccent \
    DuiDark \
    GreenAccent \
    GreyAccent \
    IndigoAccent \
    LightBlueAccent \
    LightGreenAccent \
    LimeAccent \
    OrangeAccent \
    PinkAccent \
    PurpleAccent \
    RedAccent \
    RosyAccent \
    SettingsDark \
    SystemDark \
    TealAccent \
    YellowAccent

# QS tile styles
PRODUCT_PACKAGES += \
    QStileCircleTrim \
    QStileDefault \
    QStileDualToneCircle \
    QStileSquircleTrim \
    QStileAttemptMountain \
    QStileCircleDual \
    QStileCircleGradient \
    QStileDottedCircle \
    QStileNinja \
    QStilePokesign \
    QStileWavey \
    QStileSquaremedo \
    QStileOreo \
    QStileOreoCircleTrim \
    QStileOreoSquircleTrim \
    QStileInk \
    QStileInkDrop \
    QStileTeardrop \
    QStileCookie \
    QStilesCircleOutline \
    QStileHexagon \
    QStileStar \
    QStileSquare \
    QStileGear \
    QStileBadge \
    QStileBadgetwo \
    QStileSquircle \
    QStileDiamond \
    QStileNeonlike \
    QStileOxygen \
    QStileTriangles \
    QStileDivided \
    QStileCosmos
	
# QS header styles
PRODUCT_PACKAGES += \
    QSHeaderBlack \
    QSHeaderGrey \
    QSHeaderLightGrey \
    QSHeaderAccent \
    QSHeaderTransparent

# Charger images
PRODUCT_PACKAGES += \
    charger_res_images
	
#Font package
PRODUCT_PACKAGES += \
    Custom-Fonts
	
#Phonograph
PRODUCT_PACKAGES += \
	Phonograph
	
# JamesDSP
PRODUCT_PACKAGES += \
   MusicFX \
   libjamesdsp
	

