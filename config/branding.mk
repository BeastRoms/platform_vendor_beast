ifneq ($(SIGNING_KEYS),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(SIGNING_KEYS)/releasekey
endif

ifndef BUILD_TYPE
    BUILD_TYPE := COMMUNITY
endif

ifndef BUILD_STATE
    BUILD_STATE := UNKNOWN
endif

BEAST_DISH := 10
BEAST_VERNUM := 2.0
ifeq ($(USE_TIME_IN_NAME), true)
    ifeq ($(BUILD_TYPE), COMMUNITY)
       BEAST_VERSION := $(TARGET_PRODUCT)-$(PLATFORM_VERSION)-$(shell date -u +%Y%m%d_%H%M)
    endif
endif

ifndef BEAST_VERSION
    BEAST_VERSION := $(TARGET_PRODUCT)-$(PLATFORM_VERSION)-$(shell date -u +%Y%m%d)
endif

CURRENT_DEVICE := $(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
LIST := $(shell cat vendor/beast/beast.devices)

ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
    ifeq ($(filter-out OFFICIAL WEEKLY MASHED, $(BUILD_TYPE)),)
        BEAST_VERSION := $(BEAST_VERSION).$(BEAST_DISH)-v$(BEAST_VERNUM)
        ifeq ($(BUILD_TYPE), MASHED)
          BUILD_STATE := TEST
        endif
        ifeq ($(filter-out EXPERIMENTAL EXPERIMENTS TESTING TEST, $(BUILD_STATE)),)
            BEAST_VERSION :=$(BEAST_VERSION).MASHED
            PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.beast.type=mashed
        else
            ifeq ($(BUILD_TYPE), WEEKLY)
              BEAST_VERSION :=$(BEAST_VERSION).WEEKLY
              PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.beast.type=weekly
            endif
        endif
    else
        BEAST_VERSION := $(BEAST_VERSION).CHIPS-v$(BEAST_VERNUM).$(BUILD_TYPE)
    endif
else
    ifeq ($(filter-out OFFICIAL WEEKLY, $(BUILD_TYPE)),)
      $(error "Invalid BUILD_TYPE!")
    endif
    BEAST_VERSION := $(BEAST_VERSION).CHIPS-v$(BEAST_VERNUM).$(BUILD_TYPE)
endif

export BEAST_VERNUM
export BEAST_DISH

