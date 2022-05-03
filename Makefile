# is this a cpp or c project?
FILETYPE := cpp
# Generic compiler variable for the project
COMP := g++
# Generic flags variable for the project
FLAGS := -Wall -g

# Set project directory to the parent directory of the Makefile
PROJDIR := $(realpath $(CURDIR)/)
SOURCEDIR := $(PROJDIR)/src
OBJDIR := $(PROJDIR)/obj
BINDIR := $(PROJDIR)/bin

# The "main" file (or whatever you call it)
ENTRYPOINT := main


# Name of final executable
TARGET := calc-cli


# Decide if commands should be shown or not
VERBOSE := FALSE
ifeq ($(VERBOSE), TRUE)
	HIDE := 
else
	HIDE = @
endif


# Create list of directories
DIRS := $(patsubst $(SOURCEDIR)/%, %, $(shell find $(SOURCEDIR)/ -type d -print))
SOURCEDIRS := $(foreach dir, $(DIRS), $(addprefix $(SOURCEDIR)/, $(dir)) )
OBJDIRS := $(foreach dir, $(DIRS), $(addprefix $(OBJDIR)/, $(dir)) )


# Add SOURCEDIRS to VPATH so make will look for the source files in the correct place
VPATH := $(SOURCEDIR)
VPATH += $(SOURCEDIRS)

# Get all of the sources
SOURCES := $(foreach dir, $(VPATH), $(wildcard $(dir)/*.$(FILETYPE)))
# Define the objects
OBJECTS := $(subst $(SOURCEDIR), $(OBJDIR), $(SOURCES:.$(FILETYPE)=.o))
# Define dependencies for all objects
DEPS := $(OBJECTS:.o=.d)

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
$(1)/%.o: $(2)/%.$(FILETYPE) 
	@echo Building $$@
	$(HIDE)$(COMP) -c $$(INCLUDES) -o $$(subst /,$$(PSEP),$$@) $$(subst /,$$(PSEP),$$<) -MMD 
endef

.PHONY: all clean directories run

all: directories $(TARGET)

test:
	@echo $(DIRS)
	@echo $(OBJDIR)
	@echo $(SOURCEDIR)

$(TARGET): $(OBJECTS)
	$(HIDE)echo Linking $@
	$(HIDE)$(COMP) $(FLAGS) $(OBJECTS) -o $(BINDIR)/$(TARGET)

# Generate the rules & evaluate them (aka turn them into executable Makefile rules)
#$(foreach source, $(./pairlist.py [$(OBJDIRS)] [$(SOURCEDIRS)]), $(eval $(call generateRules, $(source))))
$(foreach targetdir, $(DIRS), $(eval $(call generateRules, $(OBJDIR)/$(targetdir), $(SOURCEDIR)/$(targetdir))))

# super hacky bc I'm tired. I would much prefer if I could automate it
$(OBJDIR)/$(ENTRYPOINT).o: $(SOURCEDIR)/$(ENTRYPOINT).$(FILETYPE)
	$(HIDE)$(COMP) -c $(subst /,$(PSEP),$<) -o $(subst /,$(PSEP),$@) -MMD


# Makes the directories for the OBJDIR
directories:
# make sure BINDIR and OBJDIR exist
	$(HIDE)./directories.sh $(OBJDIR) $(BINDIR) $(OBJDIRS)

# Remove all objects, dependencies, & executable files generated during the build
clean:
	@$(RMDIR) $(subst /,$(PSEP),$(OBJDIR)) $(ERRIGNORE)
	@$(RM) $(BINDIR)$(PSEP)$(TARGET) $(ERRIGNORE)
	@$(RMDIR) $(subst /,$(PSEP),$(BINDIR)) $(ERRIGNORE)
	@echo Cleaning done!


# Run the binary file
run:
	$(HIDE)$(BINDIR)/./$(TARGET)