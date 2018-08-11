LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_POWERHAL_VARIANT),ham)
USE_ME := true
endif

ifneq (,$(filter true,$(USE_ME)))

include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE := power.msm8974
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := liblog libcutils libdl
LOCAL_SRC_FILES += \
     power-8974.c \
     power.c \
     power-feature-default.c \
     metadata-parser.c \
     utils.c \
     list.c \
     hint-data.c

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
  LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

include $(BUILD_SHARED_LIBRARY)

endif # TARGET_POWERHAL_VARIANT == ham
