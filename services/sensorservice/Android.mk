LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	CorrectedGyroSensor.cpp \
    Fusion.cpp \
    GravitySensor.cpp \
    LinearAccelerationSensor.cpp \
    OrientationSensor.cpp \
    RotationVectorSensor.cpp \
    RotationVectorSensor2.cpp \
    SensorDevice.cpp \
    SensorFusion.cpp \
    SensorInterface.cpp \
    SensorService.cpp \


LOCAL_CFLAGS:= -DLOG_TAG=\"SensorService\"

ifneq ($(filter p990 p999 p970, $(TARGET_BOOTLOADER_BOARD_NAME)),)
    LOCAL_CFLAGS += -DUSE_LGE_ALS_DUMMY
    ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),p970)
        LOCAL_CFLAGS += -DUSE_LGE_ALS_OMAP3
    endif
endif

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libhardware \
	libutils \
	libbinder \
	libui \
	libgui



LOCAL_MODULE:= libsensorservice

include $(BUILD_SHARED_LIBRARY)
