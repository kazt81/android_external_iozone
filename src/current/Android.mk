ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH := $(call my-dir)

# Build iozone
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	libbif.c iozone.c

LOCAL_CFLAGS := -DLINUX_ARM -Dlinux -DHAVE_ANSIC_C -DO_RSYNC=O_SYNC -DNAME='"linux-android"'
LOCAL_MODULE := iozone
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

include $(BUILD_EXECUTABLE)

endif # ! TARGET_SIMULATOR
