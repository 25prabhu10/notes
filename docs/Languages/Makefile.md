---
title: Makefile
description: A configuration file used by the Unix make utility to manage the process of compiling programs from multiple source files
---

# Makefile

A Makefile is a configuration file used by the Unix [`make`](https://www.gnu.org/software/make/manual/make.html) utility to manage the process of compiling programs from multiple source files

It contains a list of source files to be compiled, as well as configuration options for the compiler. Makefiles also set rules to determine which parts of a program need to be recompiled, and issue commands to do so

> If recursive `make` is considered evil, `Autotools` is literally the devil

The file is named `Makefile` or `makefile` and is located in the root directory of the project. The [`make`](#make) utility reads the file to determine how to compile the program and which files to compile

## `make`

The `make` utility automatically determines which pieces of a large program need to be recompiled, and issues commands to recompile them

To use `make`, first we must write a file called `Makefile` that describes the relationships among files in your program and provides commands for updating each file

## Syntax and Rules

- **Tabs** are used to indent recipes (not spaces)
- Comments are lines that start with a `#`
- [Variables](#variables) are defined with `VAR = value`
- Continue lines with a backslash `\`

Makefiles consist of [rules](#rules) with the following structure:

- A target, followed by a colon `:`
  - Targets are the files to be built
- A list of prerequisites separated by spaces
  - Prerequisites are files that the target depends on
- A recipe (action) indented by a tab character
  - Recipes are shell commands to run

```make
# -*- Makefile -*-

target: prerequisites
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

### Variables

Variables in Makefiles are used to store values that can be reused throughout the file. They help to avoid repetition and make it easier to update values in one place

#### Assignment Operators

- Variables can be assigned with `:=` for simple expansion
- Variables can be assigned with `?=` for conditional assignment
- Variables can be assigned with `+=` to append to existing value
- You can pass variables from the command line with `make VAR=value`
- Variables are accessed with `$(VAR)`
- Use `$$` to escape a dollar sign in recipes

```make
# verbatim assignment
SRCS = main.c

# assign from another variable
FOO := $(BAR)

# simple expansion
SRCS := $(wildcard *.c)

# shell output
SRCS != find . -name '*.c'
SRCS := $(shell find . -name '*.c')
```

| Operator | Name        | When Expanded           |
| -------- | ----------- | ----------------------- |
| `:=`     | Simple      | Once, at definition     |
| `?=`     | Conditional | If not already set      |
| `=`      | Recursive   | Each use (late binding) |
| `+=`     | Append      | Adds to existing value  |
| `!=`     | Shell       | At definition           |

```makefile
CC := gcc              # Immediate
CFLAGS ?= -O2          # Default, overridable
DEBUG = $(VERBOSE)     # Late binding
CFLAGS += -Wall        # Append
```

#### Special Variables

- `CC`: The C compiler to use (default: `cc`)
- `CXX`: The C++ compiler to use (default: `c++`)
- `MAKEFLAGS`: Flags to pass to `make`
- `MAKEFILE_LIST`: List of all makefiles read
- `CURDIR`: Current working directory
- `SHELL`: The shell to use for executing recipes (default: `/bin/sh`
- `MAKE`: The path to the `make` program itself
- `MAKELEVEL`: The recursion level of `make` (0 for top-level)
- `MAKECMDGOALS`: The goals specified on the command line
- `.RECIPEPREFIX`: The character that prefixes recipe lines (default: tab)

### Built in functions

Functions allow you to do text processing in the makefile to compute the files to operate on or the commands to use in recipes

```make
$(function arguments)
${function arguments}
```

Common built-in functions:

```make
# text functions
# this replaces suffixes making .c to .o, here OBJS becomes
# main.o utils.o helper.o
SRCS = main.c utils.c helper.c
OBJS := $(SRCS:.c=.o)


$(subst from,to,text)

# Example
$(subst ee,EE,feet on the street)
# Result: "fEEt on the strEEt"


$(patsubst pattern,replacement,text)

# Example
$(patsubst %.c,%.o,foo.c bar.c)
# Result: "foo.o bar.o"

# Shorthand for variables
$(var:pattern=replacement)
$(sources:.c=.o)


$(strip string)

# Example
$(strip   a  b   c   )
# Result: "a b c"


$(findstring find,in)

# Returns find if found, empty otherwise
$(findstring a,abc)      # "a"
$(findstring x,abc)      # ""


$(filter pattern...,text)

# Example
sources := foo.c bar.c baz.s qux.h
c_sources := $(filter %.c,$(sources))
# Result: "foo.c bar.c"


$(filter-out pattern...,text)

# Example
objects := main.o foo.o test.o
prod_objects := $(filter-out test.o,$(objects))
# Result: "main.o foo.o"
```

```make
# filename functions
$(dir names...)

# Example
$(dir src/foo.c hacks)
# Result: "src/ ./"


$(notdir names...)

# Example
$(notdir src/foo.c hacks)
# Result: "foo.c hacks"


# get filename without suffix, e.g. main.c -> main
$(basename names...)

# Example
$(basename src/foo.c src-1.0/bar.c hacks)
# Result: "src/foo src-1.0/bar hacks"


# get suffix only, e.g. main.c -> .c
$(suffix names...)

# Example
$(suffix src/foo.c src-1.0/bar.c hacks)
# Result: ".c .c"


# get file extension only, e.g. /path/to/main.c -> c
$(extname /path/to/main.c)


# path functions
# add prefix to each word in a list, e.g. build/main.o build/utils.o
$(addsuffix suffix,names...)

# Example
$(addsuffix .c,foo bar)
# Result: "foo.c bar.c"


# conditional functions
$(if ..) $(or ..) $(and ..)

# looping functions
$(foreach var,list,text) $(call ..)

# value functions
# get value of variable
$(value (VARIABLE))

# shell functions
$(shell ..)

# control functions
$(error ..) $(warning ..) $(info ..)
```

## Targets

- Targets are the files to be built or actions to be performed
- Targets can be files, phony targets (not files), or special targets
- First target in makefile becomes default goal, you can change it with `.DEFAULT_GOAL`

```make
# first target is default goal
all: program

# phony target
.PHONY: clean
clean:
    rm -f *.o program

# multi-target, builds both prog1 and prog2 separately
prog1 prog2: common.o
    $(CC) -o $@ $^

# grouped target, builds prog1 and prog2 together
foo.h foo.c &: foo.idl
    idl_compiler $<
```

- Special targets: targets with special meanings

| Special Target     | Description                                  |
| ------------------ | -------------------------------------------- |
| `.PHONY`           | Declares phony targets                       |
| `.DEFAULT_GOAL`    | Sets the default goal                        |
| `.SUFFIXES`        | Defines suffixes for implicit rules          |
| `.PRECIOUS`        | Prevents deletion of targets on interruption |
| `.INTERMEDIATE`    | Marks targets as intermediate files          |
| `.SECONDARY`       | Prevents deletion of intermediate files      |
| `.DELETE_ON_ERROR` | Deletes targets if a recipe fails            |
| `.SILENT`          | Suppresses command echoing for targets       |

## Prerequisites

- Prerequisites are files that a target depends on
- If any prerequisite is newer than the target, the target is considered out-of-date and will be rebuilt
- Prerequisites can be files, other targets, or patterns

```make
# target with prerequisites
program: main.o utils.o helper.o
    $(CC) -o $@ $^

# target with pattern prerequisites
%.o: %.c
    $(CC) -c $(CFLAGS) -o $@ $<
```

Order-only prerequisites: prerequisites that do not affect the target's timestamp

- Used for directories or files that must exist but do not trigger a rebuild

```make
$(OBJDIR)/%.o : %.c | $(OBJDIR)
        $(CC) -c $< -o $@

$(OBJDIR):
        mkdir -p $@
```

| Type              | Triggers Rebuild? | Use Case                 |
| ----------------- | ----------------- | ------------------------ |
| Normal (`:`)      | Yes, if newer     | Source files, headers    |
| Order-only (`\|`) | No                | Directories, setup tasks |

## Recipes

- Recipes are a series of shell commands to be executed
- Each command must be preceded by a **tab character**
- First defined target is executed if none are specified
- Phony targets (targets that don't produce files)
- How you tell make about prerequisites
- Hierarchical structure
- Allows you to include optional shell commands to run
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

Each line in a recipe is executed by a separate shell instance. To run multiple commands in the same shell, you can use line continuation with a backslash `\` or group commands using parentheses `()` or curly braces `{}`

```make
target:
    command1 && command2 && command3

# or
target:
    command1 && \
    command2 && \
    command3

# or
target:
    (command1; command2; command3)

# or
target:
    { command1; command2; command3; }
```

## Rules

Rules are shell commands emitted by `make` to produce an output file

- Rules use pattern matching on file types. The rule `make` uses depends on how the recipe is configured

### Implicit rules

Make has a set of built-in implicit rules for common file types and operations

- Implicit rules become obsolete very quickly

Some common implicit rules:

- Compiling C source files to object files: `%.o: %.c`
- Compiling C++ source files to object files: `%.o: %.cpp`
- Compiling Fortran source files to object files: `%.o: %.f`
- Linking object files to create executables: `$(CC) $(LDFLAGS) -o $@ $^`

```make
# You write:
prog: main.o utils.o
        $(CC) -o $@ $^

# Make automatically knows:
# main.o comes from main.c using cc -c
# utils.o comes from utils.c using cc -c


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

You can disable implicit rules with:

```make
.SUFFIXES:

# or

MAKEFLAGS += --no-builtin-rules
```

Wildcards and pattern rules allow you to define rules that apply to multiple files based on their names or extensions

```make
# variables
SRCS := main.c utils.c helper.c

# can be simplified with wildcard
SRCS := $(wildcard src/*.c)

# but
SRCS := *.c # will have literal `*.c` and not expand, need `wildcard`

OBJS := $(SRCS:src/%.c=build/%.o)

# pattern rule example
build/%.o: src/%.c | build
    $(CC) -c $(CFLAGS) -o $@ $<
```

## Automatic variables

- `$@` - The file name of the **target** of the rule (current target)
- `$<` - The name of the **first prerequisite**
- `$^` - The names of **all prerequisites** (unique), with spaces between them
- `$+` - The names of **all prerequisites** (including duplicates)
- `$?` - The names of all prerequisites that are **newer than target** (that have changed)
- `$*` - The stem with which an implicit rule matches
- `$%` - The target member name, when the target is an archive member
- `$|` - The names of all the order-only prerequisites

- `$(@D)` - The directory part of the target
- `$(@F)` - The file part of the target
- `$(<D)` - The directory part of the first prerequisite
- `$(<F)` - The file part of the first prerequisite

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

## Error Handling

By default, `make` will stop executing the recipe if any command returns a non-zero exit status (indicating an error). However, you can modify this behaviour in several ways:

- Prefix a command with a hyphen `-` to ignore errors for that specific command:

```make
target:
    -command_that_might_fail
    command_that_must_succeed
```

- Use the `.IGNORE` special target to ignore errors for all commands in the Makefile:

```make
.IGNORE:
target:
    command_that_might_fail
```

- `error` function to generate a custom error message and stop execution:

```make
ifeq ($(SOME_VAR),)
    $(error SOME_VAR is not set)
endif
```

## `make` Flags

`make` supports various command-line flags to modify its behaviour. Some commonly used flags include:

- `--no-builtin-rules`: Disables the built-in implicit rules
- `--warn-undefined-variables`: Warns about the use of undefined variables in the Makefile
- `--debug[=FLAGS]`: Enables debugging output. If `FLAGS` is omitted, all debugging information is printed
- `--silent` or `-s`: Suppresses the output of commands as they are executed
- `--trace`: Prints a trace of the targets as they are built
- `-f FILE`: Specifies an alternative Makefile to use instead of the default `Makefile` or `makefile`
- `-j [N]`: Allows `make` to run multiple jobs in parallel. If `N` is specified, it limits the number of jobs to `N`
- `-k`: Continues building other targets even if some targets fail
- `-n`: Displays the commands that would be executed without actually running them (dry run)
- `-B`: Forces `make` to consider all targets out-of-date and rebuild them
- `-C DIR`: Changes to directory `DIR` before reading the Makefile
- `--warn-undefined-variables`: Warns about the use of undefined variables in the Makefile

To use these flags, simply include them when invoking `make` from the command line. For example:

```bash
make -j4 --silent
```

Or add them to the `MAKEFLAGS` variable within the Makefile itself:

```make
MAKEFLAGS += --no-builtin-rules --warn-undefined-variables
```

## Best Practices

1. **First target = default goal**: Make it `all` or `help`
2. **Explicit prerequisites**: Don't rely on implicit rules alone
3. **Group related rules**: Organize by feature/component
4. **Document with comments**: Especially non-obvious dependencies
5. Use `:=` by default: Predictable, efficient
6. Use `?=` for overridable settings: CLI flexibility
7. Export only what's needed: Don't pollute subprocess environment
8. Use UPPER-CASE for configuration: `DEBUG`, `VERBOSE`
9. Use lowercase for internal: `sources`, `objects`
10. Always use `.PHONY` for non-file targets
11. Make `help` or `all` the default (first target)
12. Use `@` for cosmetic echo: Don't show echo commands
13. Test recipes with `-n`: Verify before running (dry run)

## Common Patterns

### Self-Documenting Help

```makefile
.DEFAULT_GOAL := help

help: ## Show available targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

install: ## Install dependencies
	uv sync

test: ## Run tests
	uv run pytest
```

### Platform Detection

```makefile
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
    OPEN := open
else ifeq ($(UNAME_S),Linux)
    OPEN := xdg-open
endif
```

### Build Directory

```makefile
BUILDDIR := build
SOURCES := $(wildcard src/*.c)
OBJECTS := $(patsubst src/%.c,$(BUILDDIR)/%.o,$(SOURCES))

$(BUILDDIR)/%.o: src/%.c | $(BUILDDIR)
	$(CC) -c $< -o $@

$(BUILDDIR):
	mkdir -p $@
```

### Environment Export

```makefile
export PYTHONPATH := $(PWD)/src
export DATABASE_URL

test:
	pytest tests/  # sees exported variables
```

### Complete Examples

```makefile
# Makefile Template
.DEFAULT_GOAL := help
SHELL := /bin/bash
.SHELLFLAGS := -ec

.PHONY: help install test lint format clean

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

install: ## Install dependencies
	uv sync --extra dev

test: ## Run tests
	uv run pytest tests/ -v

lint: ## Run linters
	uv run ruff check .

format: ## Format code
	uv run ruff format .

clean: ## Clean artifacts
	rm -rf build/ dist/ .pytest_cache
```

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
