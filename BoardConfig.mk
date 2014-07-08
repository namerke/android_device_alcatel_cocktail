# Copyright (C) 2013 The CyanogenMod Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Custom kernel header
TARGET_SPECIFIC_HEADER_PATH := device/alcatel/cocktail/include

# Platform
TARGET_BOOTLOADER_BOARD_NAME := cocktail
TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_INITLOGO := true

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := scorpion
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Screens dimension
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Kernel stuff
BOARD_KERNEL_CMDLINE := console=ttyDCC0 androidboot.hardware=cocktail
BOARD_KERNEL_BASE := 0x00200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01500000
BOARD_KERNEL_PAGESIZE := 4096
# Compile kernel inline
TARGET_KERNEL_SOURCE := kernel/alcatel/cocktail
TARGET_KERNEL_CONFIG := cyanogen_cocktail_defconfig


# cat /proc/partitions
 
#major     minor  #blocks name

# 179        0    1912832 mmcblk0
# 179        1      51200 mmcblk0p1
# 179        2        500 mmcblk0p2
# 179        3       1500 mmcblk0p3
# 179        4          1 mmcblk0p4
# 179        5       1000 mmcblk0p5
# 179        6       2000 mmcblk0p6
# 179        7       3072 mmcblk0p7
# 179        8       3072 mmcblk0p8
# 179        9       5120 mmcblk0p9 ## boot
# 179       10       7000 mmcblk0p10
# 179       11       3072 mmcblk0p11
# 179       12       3072 mmcblk0p12
# 179       13       1024 mmcblk0p13
# 179       14     256000 mmcblk0p14 ## system
# 179       15     307200 mmcblk0p15 ## custpack:= system/app
# 179       16    1039360 mmcblk0p16 ## data
# 179       17     204800 mmcblk0p17 ## cache
# 179       18       5120 mmcblk0p18 ## recovery
# 179       19       1024 mmcblk0p19
# 179       20       5359 mmcblk0p20 ## misc

# Partition sizes
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x0500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x05000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 576716800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1064304640
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 4096

# Build
TARGET_SYSTEMIMAGE_USE_SQUISHER := true
SKIP_SET_METADATA := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/alcatel/cocktail/ramdisk/fstab.cocktail
TARGET_PREBUILT_RECOVERY_KERNEL := device/alcatel/cocktail/kernel_cwm
BOARD_UMS_LUNFILE := "sys/class/android_usb/f_mass_storage/lun/file"
COMMON_GLOBAL_CFLAGS += -DRECOVERY_CANT_USE_CONFIG_EXT4_FS_XATTR

# OTA
TARGET_OTA_ASSERT_DEVICE := cocktail,OT-995
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/alcatel/cocktail/releasetools/ota_from_target_files

#    pm8xxx-vibrator: implement sysfs for intensity level
#    Node: /sys/devices/virtual/timed_output/vibrator/level
#    Range: 12 - 31
BOARD_HARDWARE_CLASS := device/alcatel/cocktail/cmhw

# EGL
BOARD_EGL_CFG := device/alcatel/cocktail/egl.cfg
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Display stuff
#TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := false
TARGET_NO_HW_VSYNC := true
USE_OPENGL_RENDERER := true
BOARD_HAVE_HDMI_SUPPORT := true
BOARD_USE_MHEAP_SCREENSHOT := true

# Audio
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true

# QCOM hardware
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_QCOM_MEDIA_VARIANT := legacy
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK

# Camera
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DNEEDS_VECTORIMPL_SYMBOLS
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_DISABLE_ARM_PIE := true
USE_CAMERA_STUB := false

# QCOM stuff
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
BOARD_VENDOR_QCOM_AMSS_VERSION := 6225
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_LIBS := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := cocktail
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# HACK: Use old Webkit for pmem compatibility
TARGET_FORCE_CPU_UPLOAD := true
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.qcom

# Dalvik
TARGET_ARCH_LOWMEM := true

# radio interface
BOARD_MOBILEDATA_INTERFACE_NAME = "rmnet0"

# WiFi
WIFI_BAND                   := 802_11_ABGN
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4330_b2
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/etc/wifi/firmware/fw_bcmdhd_p2p.bin"
BOARD_LEGACY_NL80211_STA_EVENTS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/alcatel/cocktail/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/alcatel/cocktail/bluetooth/vnd_cocktail.txt

# Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Don't build official CM updaters
DISABLE_OTA := true

# External apps on SD
TARGET_EXTERNAL_APPS = sdcard0
