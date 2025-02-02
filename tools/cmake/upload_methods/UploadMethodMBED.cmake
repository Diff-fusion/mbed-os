### Mbed USB Drive Upload Method
# This method needs the following parameters:
# MBED_RESET_BAUDRATE - Serial baudrate to connect to the target at when resetting it.
# This method creates the following options:

set(UPLOAD_SUPPORTS_DEBUG FALSE)

### Check if upload method can be enabled on this machine
set(UPLOAD_MBED_FOUND ${Python3_FOUND})

if(NOT DEFINED MBED_RESET_BAUDRATE)
	set(MBED_RESET_BAUDRATE 9600)
endif()

### Function to generate upload target
function(gen_upload_target TARGET_NAME BINARY_FILE)

	add_custom_target(flash-${TARGET_NAME}
		COMMAND ${Python3_EXECUTABLE} -m install_bin_file
			${BINARY_FILE}
			${MBED_TARGET}
			${MBED_RESET_BAUDRATE}
			${MBED_UPLOAD_SERIAL_NUMBER}
		WORKING_DIRECTORY
			${mbed-os_SOURCE_DIR}/tools/python
		VERBATIM)

	add_dependencies(flash-${TARGET_NAME} ${TARGET_NAME})

endfunction(gen_upload_target)
