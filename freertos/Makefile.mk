# FreeRTOS library Makefile

GCC_BIN ?= $(GCC_BIN_PATH)

FREERTOS_KERNEL_VERSION_NUMBER ?= v9.0.0
TRACEALIZER_VERSION_NUMBER ?= v3.1.3

PROJECT = libfreertos

#
# Objects
#
OBJECTS += ./$(FREERTOS_KERNEL_VERSION_NUMBER)/queue.o 
OBJECTS += ./$(FREERTOS_KERNEL_VERSION_NUMBER)/list.o
OBJECTS += ./$(FREERTOS_KERNEL_VERSION_NUMBER)/tasks.o  
OBJECTS += ./$(FREERTOS_KERNEL_VERSION_NUMBER)/portable/MemMang/heap_1.o 
OBJECTS += ./$(FREERTOS_KERNEL_VERSION_NUMBER)/portable/GCC/ARM_CM4F/port.o

#
# Includes
#
INCLUDE_PATHS += -I..
INCLUDE_PATHS += -I./$(FREERTOS_KERNEL_VERSION_NUMBER)
INCLUDE_PATHS += -I./$(FREERTOS_KERNEL_VERSION_NUMBER)/include
INCLUDE_PATHS += -I./$(FREERTOS_KERNEL_VERSION_NUMBER)/portable/GCC/ARM_CM4F

OBJECTS += ../Tracealizer/$(TRACEALIZER_VERSION_NUMBER)/trcKernelPort.o
OBJECTS += ../Tracealizer/$(TRACEALIZER_VERSION_NUMBER)/trcSnapshotRecorder.o
OBJECTS += ../Tracealizer/$(TRACEALIZER_VERSION_NUMBER)/trcStreamingRecorder.o
  
INCLUDE_PATHS += -I../Tracealizer/v3.1.3/config
INCLUDE_PATHS += -I../Tracealizer/v3.1.3/include

MBED_INCLUDE_PATHS += -I../mbed/frdm-k64f
MBED_INCLUDE_PATHS += -I../mbed/drivers
MBED_INCLUDE_PATHS += -I../mbed/hal
MBED_INCLUDE_PATHS += -I../mbed/platform
MBED_INCLUDE_PATHS += -I../mbed/TARGET_K64F
MBED_INCLUDE_PATHS += -I../mbed/TARGET_K64F/TARGET_Freescale
MBED_INCLUDE_PATHS += -I../mbed/TARGET_K64F/TARGET_Freescale/TARGET_KSDK2_MCUS/api
MBED_INCLUDE_PATHS += -I../mbed/TARGET_K64F/TARGET_Freescale/TARGET_KSDK2_MCUS/TARGET_MCU_K64F/
MBED_INCLUDE_PATHS += -I../mbed/TARGET_K64F/TARGET_Freescale/TARGET_KSDK2_MCUS/TARGET_MCU_K64F/device
MBED_INCLUDE_PATHS += -I../mbed/TARGET_K64F/TARGET_Freescale/TARGET_KSDK2_MCUS/TARGET_MCU_K64F/drivers
MBED_INCLUDE_PATHS += -I../mbed/TARGET_K64F/TARGET_Freescale/TARGET_KSDK2_MCUS/TARGET_MCU_K64F/TARGET_FRDM
INCLUDE_PATHS += $(MBED_INCLUDE_PATHS)

############################################################################### 
AR = $(GCC_BIN)arm-none-eabi-ar
CC = $(GCC_BIN)arm-none-eabi-gcc

#ifeq ($(TARGET), frdm-k64f)
#  CC_FLAGS = -c -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fmessage-length=0 -fno-exceptions -fno-builtin -ffunction-sections -fdata-sections -funsigned-char -MMD -fno-delete-null-pointer-checks -fomit-frame-pointer -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -std=gnu99 -D__MBED__=1 -DDEVICE_I2CSLAVE=1 -D__FPU_PRESENT=1 -DTARGET_Freescale -DDEVICE_PORTINOUT=1 -DTARGET_RTOS_M4_M7 -DDEVICE_LOWPOWERTIMER=1 -DDEVICE_RTC=1 -DTOOLCHAIN_object -D__CMSIS_RTOS -DFSL_RTOS_MBED -DDEVICE_STORAGE=1 -DMBEDTLS_ENTROPY_HARDWARE_ALT -DTARGET_KPSDK_MCUS -DTOOLCHAIN_GCC -DTARGET_CORTEX_M -DTARGET_KSDK2_MCUS -DTARGET_LIKE_CORTEX_M4 -DDEVICE_ANALOGOUT=1 -DTARGET_M4 -DTARGET_UVISOR_UNSUPPORTED -DTARGET_K64F -DDEVICE_SERIAL=1 -DMBED_BUILD_TIMESTAMP=1482431125.39 -DDEVICE_INTERRUPTIN=1 -DDEVICE_I2C=1 -DDEVICE_PORTOUT=1 -D__CORTEX_M4 -DDEVICE_STDIO_MESSAGES=1 -DCPU_MK64FN1M0VMD12 -DFEATURE_IPV4=1 -DTARGET_LIKE_MBED -DTARGET_FF_ARDUINO -DTARGET_KPSDK_CODE -DTARGET_RELEASE -DDEVICE_SERIAL_FC=1 -DFEATURE_STORAGE=1 -D__MBED_CMSIS_RTOS_CM -DDEVICE_SLEEP=1 -DTOOLCHAIN_GCC_ARM -DTARGET_FRDM -DDEVICE_SPI=1 -DDEVICE_ERROR_RED=1 -DDEVICE_SPISLAVE=1 -DDEVICE_ANALOGIN=1 -DDEVICE_PWMOUT=1 -DDEVICE_PORTIN=1 -DTARGET_MCU_K64F -DARM_MATH_CM4 -MMD -MP
#  CC_SYMBOLS = -D__MBED__=1 -DDEVICE_I2CSLAVE=1 -D__FPU_PRESENT=1 -DTARGET_Freescale -DDEVICE_PORTINOUT=1 -DTARGET_RTOS_M4_M7 -DDEVICE_LOWPOWERTIMER=1 -DDEVICE_RTC=1 -DTOOLCHAIN_object -D__CMSIS_RTOS -DFSL_RTOS_MBED -DDEVICE_STORAGE=1 -DMBEDTLS_ENTROPY_HARDWARE_ALT -DTARGET_KPSDK_MCUS -DTOOLCHAIN_GCC -DTARGET_CORTEX_M -DTARGET_KSDK2_MCUS -DTARGET_LIKE_CORTEX_M4 -DDEVICE_ANALOGOUT=1 -DTARGET_M4 -DTARGET_UVISOR_UNSUPPORTED -DTARGET_K64F -DDEVICE_SERIAL=1 -DMBED_BUILD_TIMESTAMP=1482431125.39 -DDEVICE_INTERRUPTIN=1 -DDEVICE_I2C=1 -DDEVICE_PORTOUT=1 -D__CORTEX_M4 -DDEVICE_STDIO_MESSAGES=1 -DCPU_MK64FN1M0VMD12 -DFEATURE_IPV4=1 -DTARGET_LIKE_MBED -DTARGET_FF_ARDUINO -DTARGET_KPSDK_CODE -DTARGET_RELEASE -DDEVICE_SERIAL_FC=1 -DFEATURE_STORAGE=1 -D__MBED_CMSIS_RTOS_CM -DDEVICE_SLEEP=1 -DTOOLCHAIN_GCC_ARM -DTARGET_FRDM -DDEVICE_SPI=1 -DDEVICE_ERROR_RED=1 -DDEVICE_SPISLAVE=1 -DDEVICE_ANALOGIN=1 -DDEVICE_PWMOUT=1 -DDEVICE_PORTIN=1 -DTARGET_MCU_K64F -DARM_MATH_CM4
#endif

CC_FLAGS += $(CPU) -c -fmessage-length=0 -fno-exceptions -ffunction-sections -fdata-sections -fno-builtin -Wall -MMD -MP

AR_FLAGS = -r

ifeq ($(DEBUG), 1)
  CC_FLAGS += -g
  CC_SYMBOLS += -DDEBUG
else
  CC_FLAGS += -Os
  CC_SYMBOLS += -DNDEBUG
endif

all: $(PROJECT).a	

clean:
	+@echo "Cleaning FreeRTOS object files..."
	@rm -f $(PROJECT).bin $(PROJECT).a $(OBJECTS) $(DEPS)	

.c.o:
	+@echo "Compile: $<"
	$(CC) $(CC_FLAGS) $(CC_SYMBOLS) -std=gnu99 $(INCLUDE_PATHS) -o $@ $<

$(PROJECT).a: $(OBJECTS) $(SYS_OBJECTS)
	+@echo "Linking: $@"
	@$(AR) $(AR_FLAGS) $@ $^ -c

DEPS = $(OBJECTS:.o=.d) $(SYS_OBJECTS:.o=.d)
-include $(DEPS)