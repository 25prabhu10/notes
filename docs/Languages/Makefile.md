---
title: Makefile
description: A configuration file used by the Unix make utility to manage the process of compiling programs from multiple source files
---

# Makefile

A Makefile is a configuration file used by the Unix make utility to manage the process of compiling programs from multiple source files. It contains a list of source files to be compiled, as well as configuration options for the compiler. Makefiles also set rules to determine which parts of a program need to be recompiled, and issue commands to do so

> If recursive Make is considered evil, `Autotools` is literally the devil

The file is named `Makefile` or `makefile` and is located in the root directory of the project. The make utility reads the file to determine how to compile the program and which files to compile

## Syntax and Rules

- Comments are lines that start with a `#`
- Variables are defined with `VAR = value`
- Variables are accessed with `$(VAR)`
- Variables can be assigned with `:=` for simple expansion
- Tabs are used to indent recipes (not spaces)
- Targets are the files to be built
- Recipes (actions) are shell commands to run

```make
# -*- Makefile -*-

target: dependencies
    recipe
```

Run `make` to build the target:

```bash
make
```

`make` will look for a file named `Makefile` in the current directory and execute the first target in the file if none are specified

- If the first target has not changed since the last build, `make` will not run the recipe
- To run a specific target, use `make [target]`
- If you want to run multiple targets then define `all` as the first target

```make
all: target1 target2 target3
```

## Assignment Operators

```make
# verbatim assignment
SRCS = main.c


# simple expansion
SRCS := $(wildcard *.c)


# shell output
SRCS != find . -name '*.c'
SRCS := $(shell find . -name '*.c')


# append to
CC_FLAGS += -Wextra


# conditional assignment
CFLAGS ?= $(CC_FLAGS)


FOO := $(BAR)
```

## Built in functions

```make
# text functions
$(SRCS:.c=.o)


# filename functions
$(addprefix build/,$(OBJS))


# cinditional functions
$(if ..) $(or ..) $(and ..)


# looping functions
$(foreach var,list,text) $(call ..)


# value functions
$(value (VARIABLE))


# shell functions
$(shell ..)


# control functions
$(error ..) $(warning ..) $(info ..)
```

## Rules

Rules are shell commands emitted by Make to produce an output file

- Rules use pattern matching on file types. The rule Make uses depends on how the recipe is configured

- There are many implicit rules built into Make for different file types

- Implicit rules become obsolete very quickly

```make
# implicit rules for different file types


%.o: %.c
    $(CC) -c $(CFLAGS) -o $@ $<


$.o: $.cpp
    $(CXX) -c $(CXXFLAGS) -o $@ $<


%.o: %.f
    $(FC) -c $(FFLAGS) -o $@ $<


%.o: %.p
    $(PC) -c $(PFLAGS) -o $@ $<
```

## Recipes

Define targets

- First defined target is executed if none are specified

- How you tell make about prerequisites

- Hierarchical structure

- Allows you to include optional shell commands to run

- Phony targets (targets that don't produce files)

- Tells Make what rules to use if any

```make
SRCS = main.c
OBJS := $(SRCS:.c=.o)


TARGET := foo


.PHONY: all clean


all: $(TARGET)


foo: $(OBJS)
    $(CC) -o $@ $^


clean:
    rm -f $(OBJS)
```

## Automatic variables

- `$@` - The file name of the target of the rule (current target)
- `$<` - The name of the first prerequisite
- `$^` - The names of all the prerequisites, with spaces between them
- `$?` - The names of all the prerequisites that are newer than the target (that have changed), with spaces between them
- `$|` - The names of all the order-only prerequisites, with spaces between them

```make
SRCS = main.c
OBJS := $(SRCS:.c=.o)
DIR := build
OBJS := $(addprefix $(DIR), $(OBJS))


TARGET := foo


.PHONY: clean


$(DIR)/%.o: %.c
    $(CC) -c $(CFLAGS) -o $@ $<


$(TARGET): $(OBJS) | $(DIR)
    $(CC) -o $@ $^


$(DIR):
    mkdir -p $@
```

## Automatic dependency

Make integrates with the compiler

- Dependency files contain information
  - `-MT`: name of the target
  - `-MMD`: list user header files
  - `-MP`: add phony targets
  - `-MF`: name of the file

- The `DEPFILES` recipe and the include line **must** be the last lines in the file

- Make will only rebuild prerequisites which have a newer timestamp than the generated dependency file

```make
DEPDIR = .deps
DEPFILES := $(SRCS:.c=$(DEPDIR)/%.d)
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d


$.o: %.c $(DEPDIR)/%.d | $(DEPDIR)
    $(CC) -c $(CFLAGS) $(DEPFLAGS) -o $@ $<


# rest of your rules/recipes ...


$(DEPDIR):
    mkdir -p $(DEPDIR)


$(DEPFILES):


include $(wildcard $(DEPFILES))
```

## Template Makefile

```make
SRCS := $(wildcard *.c)
OBJDIR = .build
OBJS := $(SRCS:%.c=$(OBJDIR)/%.o)


DEPDIR = .dep
DEPS := $(SRCS:%.c=$(DEPDIR)/%.d)
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d


.PHONY: clean
TARGET = foo
#        ^^^ Change this


$(OBJDIR)/%.o: %.c | $(OBJDIR) $(DEPDIR)
    @echo [CC] $@
      @$(CC) -c $(CFLAGS) $(DEPFLAGS) -o $@ $<


$(TARGET): $(OBJS)
      @echo [LD] $@
      @$(CC) $(LDFLAGS) -o $@ $^


clean:
      @rm -rf $(OBJDIR) $(DEPDIR) $(TARGET)


$(OBJDIR) $(DEPDIR):
      @mkdir -p $@


$(DEPFILES):


include $(wildcard $(DEPFILES))
```
