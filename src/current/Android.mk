ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH := $(call my-dir)

# Build iozone as executable
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	libbif.c iozone.c

LOCAL_CFLAGS := \
	-DLINUX_ARM -Dlinux -DHAVE_ANSIC_C -DO_RSYNC=O_SYNC \
	-DNAME='"linux-android"' -D__off64_t_defined
LOCAL_MODULE := iozone
LOCAL_MODULE_TAGS := eng tests
LOCAL_MULTILIB := 64
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

include $(BUILD_EXECUTABLE)

# Build iozone as static library
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	libbif.c iozone.c

LOCAL_CFLAGS := \
	-DLINUX_ARM -Dlinux -DHAVE_ANSIC_C -DO_RSYNC=O_SYNC \
	-DNAME='"linux-android"' -D__off64_t_defined \
	-Dmain=IOZone_main
LOCAL_MODULE := libiozone
LOCAL_MODULE_TAGS := eng tests
LOCAL_MULTILIB := 64

include $(BUILD_STATIC_LIBRARY)

endif # ! TARGET_SIMULATOR
