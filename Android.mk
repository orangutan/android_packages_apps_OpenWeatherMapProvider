LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := OpenWeatherMapProvider
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := OpenWeatherMapProvider

owmp_root  := $(LOCAL_PATH)
owmp_dir   := app
owmp_out   := $(OUT_DIR)/target/common/obj/APPS/$(LOCAL_MODULE)_intermediates
owmp_build := $(owmp_root)/$(owmp_dir)/build
owmp_apk   := build/outputs/apk/release/$(owmp_dir)-release-unsigned.apk

$(owmp_root)/$(owmp_dir)/$(owmp_apk):
	rm -Rf $(owmp_build)
	mkdir -p $(owmp_out)
	ln -sf $(owmp_out) $(owmp_build)
	cd $(owmp_root)/$(owmp_dir) && ../gradlew clean && ../gradlew assembleRelease

LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(owmp_dir)/$(owmp_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)
