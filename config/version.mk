# Copyright (C) 2016-2017 AOSiP
# Copyright (C) 2022 ScoopDroid
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

# Versioning System
ifeq ($(SCOOP_VERSION_APPEND_TIME_OF_DAY),true)
    BUILD_DATE := $(shell date +%Y%m%d-%H%M)
else
    BUILD_DATE := $(shell date +%Y%m%d)
endif

TARGET_PRODUCT_SHORT := $(subst scoop_,,$(SCOOP_BUILDTYPE))

SCOOP_BUILDTYPE ?= Community
SCOOP_STATUS := Stable
SCOOP_BUILD_VERSION := $(PLATFORM_VERSION)
SCOOP_VERSION := $(SCOOP_BUILD_VERSION)-$(SCOOP_BUILDTYPE)-$(SCOOP_STATUS)-$(SCOOP_BUILD)-$(BUILD_DATE)
ROM_FINGERPRINT := ScoopDroid/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date +%H%M)

ifeq ($(SCOOP_BUILDTYPE), CI)
    BUILD_KEYS := release-keys
endif

PRODUCT_SYSTEM_PROPERTIES += \
  ro.scoop.build.version=$(SCOOP_BUILD_VERSION) \
  ro.scoop.build.date=$(BUILD_DATE) \
  ro.scoop.buildtype=$(SCOOP_BUILDTYPE) \
  ro.scoop.fingerprint=$(ROM_FINGERPRINT) \
  ro.scoop.version=$(SCOOP_VERSION) \
  ro.modversion=$(SCOOP_VERSION)

ifneq ($(OVERRIDE_OTA_CHANNEL),)
PRODUCT_SYSTEM_PROPERTIES += \
    scoop.updater.uri=$(OVERRIDE_OTA_CHANNEL)
endif
