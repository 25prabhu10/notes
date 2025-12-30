---
title: Shell Scripting
description: Working with Unix Shells like GNU Bash
---

# Shell Scripts

Scripts contain a series of commands. An interpreter executes these commands

- Anything you can type at the command line, you can put in a script

## Shell

A shell is a command-line interpreter that provides a user interface for access to an operating system's services (like file management, process management, etc.)

- A shell is a program that takes commands from the keyboard and gives them to the operating system to perform (it is a command language interpreter)

## Bash

GNU Bash is a Unix shell

- "Bourne-Again SHell", a pun on Stephen Bourne (author of the direct ancestor of the current Unix shell `sh`)
- Bash is the default shell on most Linux distributions
- Bash is an sh-compatible shell that incorporates useful features from the Korn shell (`ksh`) and C shell (`csh`)
- Bash is a command processor. Bash can read and execute commands from a file, called a shell script
- It is POSIX-compliant, specifically the POSIX 1003.1 standard

### POSIX

Portable Operating System Interface (POSIX) is a family of standards specified by the IEEE for maintaining compatibility between operating systems

- POSIX defines the application programming interface (API), along with command line shells and utility interfaces, for software compatibility with variants of Unix and other operating systems

## First Shell Script

Let's create a simple script, that prints `Hello World` to the terminal

1. Create a `script.sh` file with the below content:

   ```bash
   #!/bin/bash
   echo "Hello World"
   ```

2. Make the script executable:

   ```bash
   chmod +x script.sh
   # or
   chmod 755 script.sh
   ```

3. To execute this script, just enter the file name in the command line

   ```bash
   ./script.sh`
   ```

4. Output:

   ```bash
   Hello World
   ```

If you want to run the script from any path, you can add the path to the script to the `PATH` environment variable

```bash
export PATH=$PATH:/path/to/script
```

### Location for Scripts

- `/usr/local/bin`: For scripts that are available system-wide (all users)
- `/usr/local/sbin`: For scripts that are available system-wide (all users) but are for system administration

## Use of Shebang

It is used to specify the shell program that needs to be used to execute the script file

When the interpreter executes the script. The first line, i.e. shebang is used as an argument for the path of the shell program. This can be observed below:

```bash
# run the script in background
./script.sh &

# check the process
ps -ef process_id

# check commands executed by script.sh
pstree -p process_id
```

Different Bash shebang:

- `#!/usr/bin/env bash`: Flexibility on different systems (protability)
  - Different `*nixes` put `bash` in different places

- `#!/usr/bin/bash`: Explicit control on a given system of what executable is called

Why Shebang is needed?

- If no shebang is specified, then your default shell will be used
- Different shells have slightly varying syntax and this may cause errors

> [!TIP] OTHER INTERPRETERS
> Use python interpreter path as shebang if executing python script or any other interpreter path for that matter

## Syntax

- **Case Sensitive**: `Hello` and `hello` are different
- **Whitespace**: Spaces are important in bash
- **End of Line**: Each command must be on a separate line
- **Semicolon**: Used to separate multiple commands on a single line

### Reserved Words

These are words that have special meaning in bash

`if`, `then`, `elif`, `else`, `fi`, `time`, `for`, `in`, `until`, `while`, `do`, `done`, `case`, `esac`, `coproc`, `select`, `function`, `{`, `}`, `[[`, `]]`, `!`

`in`is recognized as a reserved word if it is the third word of a case or select command. `in` and `do` are recognized as reserved words if they are the third word in a `for` command

### Comments

Pound sign (`#`) is used for writing in-line comments

### Pipelines

A _pipeline_ is a sequence of one or more commands separated by the pipe character `|` or `|&`

```bash
[time [-p]] [!] command1 [ | or |& command2 ] ...
```

- `|` sends the output of the first command to the input of the second command
- `|&` sends both the standard output and standard error of the first command to the second command, it is similar to `2>&1 |`

### List of Commands

A _list_ is a sequence of one or more pipelines separated by one of the operators `;`, `&`, `&&`, or `||`, and optionally terminated by one of `;`, `&`, or a newline

- `&&` and `||` have equal precedence, followed by `;` and `&`, which have equal precedence

```bash
# command1 is executed, then command2
command1 ; command2

# command2 is executed in the background
command1 & command2

# if command1 returns an exit status of zero (success), then command2 is executed
command1 && command2

# if command1 returns an exit status other than zero (failure), then command2 is executed
command1 || command2
```

### Looping Constructs

Use `for`, `while`, and `until` loops to iterate over a sequence of items

#### `until`

Execute consequent-commands as long as test-commands has an exit status which is not zero (failure)

```bash
until text-commands; do
  consequent-commands
done
```

#### `while`

Execute consequent-commands as long as test-commands has an exit status of zero (success)

```bash
while test-commands; do
  consequent-commands
done
```

#### for Loop

Execute a sequence of commands for each item in a list

```bash
for VARIABLE_NAME in ITEM_1 ITEM_2 ITEM_N
do
  command n
done
```

Example:

```bash
for COLOR in red green blue
do
  echo "COLOR: \$COLOR"
done
```

- The list is usually stored inside a variable. With white space separating each item

  ```bash
  COLORS="red green blue"

  for COLOR in $COLORS
    do
      echo "COLOR: $COLOR"
  done
  ```

### Conditional Constructs

### `if-else`

```bash
if [ condition-is-true ]; then
  command 1
elif [ condition-is-true ]; then
  command 2
else
  command n
fi

# double bracket [[
# this construct is not POSIX compliant
# and only available in Bash shell along with a few other shells
if [[ $MY_SHELL == "bash" ]]
```

Example:

```bash
if [ "$MY_SHELL"="bash" ]
then
  echo "You seem to like bash shell."
elif [ "$MY_SHELL"="ksh" ]
then
  echo "You seem to like ksh Shell."
else
  echo "You don't seem to like the bash shell."
fi
```

> [!TIP]
> Use variables under quotes to prevent unknown errors

### `case`

`if` vs `case`:

- `if` is used when you have a single condition to evaluate
- `case` is used when you have multiple conditions to evaluate

```bash
case word in
    [ [(] pattern [| pattern]…) command-list ;;]#...
esac

case EXPRESSION in
  PATTERN_1)
    command 1
    ;;
  PATTERN_2)
    command 2
    ;;
  PATTERN_N)
    command n
    ;;
  *)
    default command
    ;;
esac
```

- `;;` is used to terminate a pattern
- `*)` is used to match any pattern
- `|` is used to separate multiple patterns
- `(` and `)` are used to group patterns
- If the `;;` operator is used, no subsequent matches are attempted after the first pattern match
- Using `;&` will continue to the next pattern after the first match
- Using `;;&` will continue to the next pattern after the first match

_Example:_

```bash
echo -n "Enter the name of an animal: "

read ANIMAL

echo -n "The $ANIMAL has "

case $ANIMAL in
  horse | dog | cat) echo -n "four";;
  man | kangaroo ) echo -n "two";;
  *) echo -n "an unknown number of";;
esac

echo " legs."
```

### Variables

Storage locations that have a name

- By convention variables are **written in UPPER-CASE**

#### Declaring Variables

```bash
VARIABLE_NAME="Value"

# examples
age=30
name="John"
is_human=true
```

- **Do not use spaces** before or after `=` sign

You can assign command output to a variable, by enclosing the command inside `$()` syntax (preferred) or backticks

```bash
USER_NAME=$(who)

# examples
MY_HOME=$(echo $HOME)
ALPHABET=$(echo {a..z})

# or
MY_HOME=`echo $HOME`
```

### Using Variables

There are two ways to use them:

1. Prefix dollar (`$`) sign to the variable:

   ```bash
   MY_SHELL="BASH"
   echo "I like the $MY_SHELL shell."
   ```

2. Enclose the variable inside curly `{}` braces and prefix `$` sign. This is used whenever you need to concatenate the variable with some other text:

   ```bash
   echo "I like ${MY_SHELL}ing script"
   ```

You can unset a variable using `unset` command

```bash
unset MY_SHELL
```

#### Local Variables

By default, variables are global

- Global variables are available throughout the script

To make them local, use the `local` keyword

- The scope of local variables is limited to the function in which they are declared

```bash
GLOBAL_VAR="I am global"

function my_function() {
  local MY_VAR="I am local"
  echo $MY_VAR
}
```

## Test Command

It checks for a condition, if the condition is met then it proceeds to execute the code enclosed within its block. Else it will skip that block and proceed with the next statements

```bash
text expression

# or more commonly used

[ expression ]
```

To check the different test operators use `help test` or `man test`

_Example:_

```bash
#!/bin/bash

# test-file: Evaluate the status of a file

FILE=~/.bashrc

if [ -e "$FILE" ]; then
  if [ -f "$FILE" ]; then
    echo "$FILE is a regular file."
  fi
  if [ -d "$FILE" ]; then
    echo "$FILE is a directory."
  fi
  if [ -r "$FILE" ]; then
    echo "$FILE is readable."
  fi
  if [ -w "$FILE" ]; then
    echo "$FILE is writable."
  fi
  if [ -x "$FILE" ]; then
    echo "$FILE is executable/searchable."
  fi
else
    echo "$FILE does not exist"
    exit 1
fi

exit
```

Using `"` (double quotes) is recommended to prevent errors

- If the variable is empty, then the test command will throw an error
- Using the quotes around the parameter insures that the operator is always followed by a string, even if the string is empty

### File Expressions

| Expression        | Is True If:                                                                                       |
| ----------------- | ------------------------------------------------------------------------------------------------- |
| `-b FILE`         | File exists and is a block special (device) file                                                  |
| `-c FILE`         | File exists and is a character special (device) file                                              |
| `-d FILE`         | File exists and is a directory                                                                    |
| `-e FILE`         | File exists                                                                                       |
| `-f FILE`         | File exists and is a regular file                                                                 |
| `-g FILE`         | File exists and is set-group-ID                                                                   |
| `-G FILE`         | File exists and is owned by the effective group ID                                                |
| `-k FILE`         | File exists and has its "sticky bit" set                                                          |
| `-L FILE`         | File exists and is a symbolic link                                                                |
| `-O FILE`         | File exists and is owned by the effective user ID                                                 |
| `-p FILE`         | File exists and is a named pipe (FIFO)                                                            |
| `-r FILE`         | File exists and is readable (has readable permission for the effective user)                      |
| `-s FILE`         | File exists and has length greater than zero                                                      |
| `-S FILE`         | File exists and is a network socket                                                               |
| `-t FD`           | File descriptor `FD` is open and associated with a terminal                                       |
| `-u FILE`         | File exists and its set-user-ID bit is set                                                        |
| `-w FILE`         | File exists and is writable (has write permission for the effective user)                         |
| `-x FILE`         | File exists and is executable (has execute permission for the effective user)                     |
| `file1 -ef file2` | Both files have the same inode numbers (the two filenames refer to the same file by hard linking) |
| `file1 -nt file2` | `file1` is newer than `file2`                                                                     |
| `file1 -ot file2` | `file1` is older than `file2`                                                                     |

### String Expressions

| Expression                              | Is True If:                                     |
| --------------------------------------- | ----------------------------------------------- |
| `STRING`                                | `STRING` is not null                            |
| `-n STRING`                             | The length of `STRING` is non-zero              |
| `-z STRING`                             | The length of `STRING` is zero                  |
| `STRING1=STRING2` or `STRING1==STRING2` | `STRING1` is equal to `STRING2` (`==` prefered) |
| `STRING1!=STRING2`                      | `STRING1` is not equal to `STRING2`             |
| `STRING1<STRING2`                       | `STRING1` sorts after `STRING2`                 |
| `STRING1>STRING2`                       | `STRING1` sorts before `STRING2`                |

> [!WARNING]
> The `>` and `<` operators must be quoted (or escaped with a backslash) to prevent the shell from interpreting them as redirection operators

### Arithmetic Expressions

| Expression      | Is True If:                               |
| --------------- | ----------------------------------------- |
| `ARG1 -eq ARG2` | `ARG1` is equal to `ARG2`                 |
| `ARG1 -ne ARG2` | `ARG1` is not equal to `ARG2`             |
| `ARG1 -le ARG2` | `ARG1` is less than or equal to `ARG2`    |
| `ARG1 -lt ARG2` | `ARG1` is less than `ARG2`                |
| `ARG1 -ge ARG2` | `ARG1` is greater than or equal to `ARG2` |
| `ARG1 -gt ARG2` | `ARG1` is greater than `ARG2`             |

### New Test Command

`[[` is a new bash specific syntax that is more powerful and more flexible than the old test command `[`

- `[[` is a keyword, not a command
- `[[` does not require quoting of variables

```bash
# if
$number # is unset or empty,
[ $number -ne 1 ] # will emit an error message, but
[[ $number -ne 1 ]] # will handle it sanely
```

- `[[` is more powerful than `[` because it supports additional operators like `&&`, `||`, `==`, `=~`, `<=`, `>=`

- The `==` and `!=` operators in `[[` perform pattern matching, while in `[` they perform string comparison
  - This makes `[[` useful for evaluating file and path names

_Example:_

```bash
FILE=foo.bar

if [[ $FILE == foo.* ]]; then
  echo "$FILE matches pattern 'foo.*'"
fi

# foo.bar matches pattern 'foo.*'
```

- The `=~` operator in `[[` performs regex matching

### Integer Test Command

`((` is used for arithmetic truth tests

- An arithmetic truth test results in true if the result of the arithmetic evaluation is non-zero
- The `((` and `))` operators are used to evaluate arithmetic expressions

```bash
(( EXPRESSION ))
```

### Logical Operators

| Operator | `test` Equivalent | `[[` and `((` Equivalent |
| -------- | ----------------- | ------------------------ |
| AND      | `-a`              | `&&`                     |
| OR       | `-o`              | `\|\|`                   |
| NOT      | `!`               | `!`                      |

## Positional Parameters

From `$0`-`$9` are used as positional parameters

- `$0` : Name of the script being run
- Rest are parameters passed through command line
- `$@` is the list of all arguments. It can be used to loop through the parameters

## Exit Status

Every command returns an exit status. This is a number between `0` and `255`

- `0` means success (default exit status if not specified and no error)
- Any other number means failure

You can check the exit status of the last command using `$?`

```bash
echo "Hello World"
echo $?
```

Why is this useful?

- You can use this to check if a command was successful or not

```bash
if [ $? -eq 0 ]
then
  echo "Command was successful"
else
  echo "Command failed"
fi
```

## User Input (STDIN)

The `read` command accepts STDIN

Syntax:

```bash
read -p "PROMPT" VARIABLE
```

## Output

File descriptors:

- `0` is `stdin` the _standard input_
- `1` is `stdout` the _standard output_
- `2` is `stderr` the _standard error_

```bash
# redirect stdout to file.txt
echo test > file.txt
echo test 1> file.txt

# redirect stderr to file.txt
echo test 2> file.txt

# redirect stderr and stdout to file.txt
echo test 2>&1 file.txt
```

- `>`: _redirection_
- `>>`: append to target if exists

- `>&`: redirect a _stream_ to another _file descriptor_

Thus, in `2>&1`:

- `2>` redirects `stderr` to an _(unspecified) file_
- `&1` redirects `stderr` to `stdout`

## References

Great for automating repetitive tasks

- [Explain Shell Commands](https://explainshell.com/)
- [ShellCheck: Finds bugs in your shell scripts](https://www.shellcheck.net/)
