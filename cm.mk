# Copyright (C) 2011-2013 The CyanogenMod Project
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

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/alcatel/cocktail/full_cocktail.mk)

## Device identifier. This must come after all inclusions

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=cocktail \
    PRODUCT_DEVICE=cocktail \
    BUILD_FINGERPRINT="TCT/one_touch_995_ALHU/one_touch_995_gsm:4.0.4/IceCreamSandwich/787:user/release-keys" \
    PRIVATE_BUILD_DESC="one_touch_995_ALHU-user 4.0.4 IceCreamSandwich 787 release-keys"

# Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_cocktail

# Release name
PRODUCT_RELEASE_NAME := OT-995

# Custom tag for unofficial builds
TARGET_UNOFFICIAL_BUILD_ID := H1N1
