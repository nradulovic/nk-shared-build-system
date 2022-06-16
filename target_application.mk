
include $(WS)/build/sbs/variant.mk

$(info PROJECT: $(PROJECT_NAME))
ifneq ("$(PROJECT_CONFIG)","")
$(info CONFIGURATION: $(PROJECT_CONFIG))
CC_INCLUDES += $(PROJECT_CONFIG)
endif

# Define ALL rule.
all: size

.PHONY: flash
flash: $(PROJECT_FLASH)
	$(PRINa) "FLASH: $<"

.PHONY: size
size: $(PROJECT_SIZE)
	$(PRINT) "SIZE:"
	$(VERBOSE)cat $<

.PHONY: executable
executable: $(PROJECT_ELF)
	$(PRINT) "EXECUTABLE: $<"

.PHONY: library
library: $(PROJECT_LIB)
	$(PRINT) "LIBRARY: $<"

$(PROJECT_LIB): $(OBJECTS)

$(PROJECT_ELF): $(PROJECT_LIB)

$(PROJECT_SIZE): $(PROJECT_ELF)

$(PROJECT_FLASH): $(PROJECT_ELF)

# Include autogenerated dependency rules.
-include $(DEPENDS)
