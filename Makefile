# is this a cpp or c project?
FILETYPE := cpp
# Generic compiler variable for the project
COMP := gcc
# Generic flags variable for the project
FLAGS := -Wall -g

# Set project directory to the parent directory of the Makefile
PROJDIR := $(realpath $(CURDIR)/)
SOURCEDIR := $(PROJDIR)/src
BUILDDIR := $(PROJDIR)/obj
BINDIR := $(PROJDIR)/bin


# Name of final executable
TARGET := calc-cli


# Decide if commands should be shown or not
VERBOSE := TRUE
ifeq ($(VERBOSE), TRUE)
	HIDE := 
else
	HIDE = @
endif


# Create list of directories
DIRS := $(patsubst $(SOURCEDIR)/%, %, $(shell find $(SOURCEDIR)/ -type d -print))
SOURCEDIRS := $(foreach dir, $(DIRS), $(addprefix $(SOURCEDIR)/, $(dir)) )
OBJDIRS := $(foreach dir, $(DIRS), $(addprefix $(BUILDDIR)/, $(dir)) )


# Add SOURCEDIRS to VPATH so make will look for the source files in the correct place
VPATH := $(SOURCEDIRS)

# Get all of the sources
SOURCES := $(foreach dir, $(SOURCEDIRS), $(wildcard $(dir)/*.$(FILETYPE)))
# Define the objects
OBJECTS := $(subst $(SOURCEDIR), $(BUILDIR), $(SOURCES:.$(FILETYPE)=.o))
# Define dependencies for all objects
DEPS := $(OBJS:.o=.d)

# Generate all of the includes for GCC by adding -I before each source folder
INCLUDES := $(foreach dir, $(SOURCEDIRS), $(addprefix -I, $(dir)) )


# OS specific (ensures compatability across platforms)
ifeq ($(OS),Windows_NT)
		RM = del /F /Q 
		RMDIR = -RMDIR /S /Q
		MKDIR = -mkdir
		ERRIGNORE = 2>NUL || true
		SEP=\\
else
		RM = rm -rf 
		RMDIR = rm -rf 
		MKDIR = mkdir -p
		ERRIGNORE = 2>/dev/null
		SEP=/
endif

# Remove space after separator
PSEP := $(strip $(SEP))


# Function that generates the rule to compile each file from source --> obj + dep
define generateRules
$(1)/%.o: %.$(FILETYPE)
	@echo Building $$@
	$(HIDE)$(COMP) -c $$(INCLUDES) -o $$(subst /, $$(PSEP), $$@) $$(subst /,$$(PSEP),$$<) -MMD
endef

.PHONY: all clean directories run

all: directories $(TARGET)
	@echo Sources = $(SOURCES)

$(TARGET): $(OBJS)
	$(HIDE)echo Linking $@
	$(HIDE)$(COMP) $(FLAGS) $(OBJS) -o $(BINDIR)/$(TARGET)


# Generate the rules & evaluate them (aka turn them into executable Makefile rules)
$(foreach targetdir, $(OBJDIRS), $(eval $(call generateRules, $(targetdir))))


# Makes the directories for the OBJDIR
directories:
	ifneq ($(strip $(OBJDIRS)),)
		$(HIDE)$(MKDIR) $(subst /,$(PSEP),$(OBJDIRS)) $(ERRIGNORE)
	endif


# Remove all objects, dependencies, & executable files generated during the build
clean:
	@$(RMDIR) $(subst /,$(PSEP),$(OBJDIRS)) $(ERRIGNORE)
	@$(RM) $(BINDIR)/$(TARGET) $(ERRIGNORE)
	@echo Cleaning done!


# Run the binary file
run:
	$(BINDIR)/./$(TARGET)