# Makefile for building a static library

# Compiler
CXX = g++
# Compiler flags
CXXFLAGS = -Wall -Wextra -fPIC
# Library name
LIBNAME = libisEven.a
# Source files
SRCS = isEven.cpp
# Object files
OBJS = $(SRCS:.cpp=.o)
# Installation directories
LIBDIR = /usr/lib
INCDIR = /usr/include

# Default target
all: $(LIBNAME)

# Rule to create the static library
$(LIBNAME): $(OBJS)
	$(AR) rcs $@ $^

# Rule to compile source files into object files
%.o: %.cpp isEven.hpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Install the library and header
install: $(LIBNAME)
	install -m 644 $(LIBNAME) $(LIBDIR)
	install -m 644 isEven.hpp $(INCDIR)

# Clean up build files
clean:
	rm -f $(OBJS) $(LIBNAME)

# Phony targets
.PHONY: all install clean
