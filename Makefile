# Compiler options
CXX = g++
CXX_FLAGS = -Wall -std=c++11

APP_NAME = LockBox

# Directories
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
TARGET_DIR = bin

# Source, objects, and executable files 
# $(wildcard pattern)
SOURCES := $(wildcard $(SRC_DIR)/*.cpp)

# $(patsubst pattern, replace, textInput)
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o , $(SOURCES))

# Output directory for executable
TARGET := $(TARGET_DIR)/$(APP_NAME)

# Default rule to build the executable
all: $(TARGET)

# Rule to build the executable
$(TARGET): $(OBJECTS)
	@mkdir $(TARGET_DIR)
	$(CXX) $(CXX_FLAGS) -o $(TARGET) $(OBJECTS)

# Rule to build source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir $(BUILD_DIR)
	$(CXX) $(CXX_FLAGS) -I $(INCLUDE_DIR) -c -o $@ $<

clean:
	@rmdir /s /q $(TARGET_DIR) $(BUILD_DIR)

run:
	@$(TARGET)

.PHONY: all run