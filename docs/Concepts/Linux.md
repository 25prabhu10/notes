---
title: Linux
description: GNU Linux is a family of OS
---

# Linux

Linux is a family of open-source Unix-like operating systems based on the Linux kernel

## System Tools

- `top` (1984): display Linux tasks
- `htop` (2004): interactive process viewer

```bash
# get CPU info
lscpu
```

## File-system

Typical _File-system Hierarchy Standard_ (FHS): To get more information checkout `man hier`

1. `/bin`:
   - Binaries of important executables and core OS commands (`ls`, `cat`)
   - Typically this directory is symbolically linked to `/usr/bin`

2. `/sbin`:
   - Contains system essential Binaries similar to `/bin`
   - Traditionally the programs in `sbin` were statically linked, thus had fewer library dependencies
   - Binaries containing system administration tools
   - Typically this directory is symbolically linked to `/usr/bin`

3. `/boot`:
   - Contains boot-files, files needed by the bootloader

4. `/dev`:
   - Contains device files
   - These files are dynamically created based on the various physical and virtual devices that are connected to the system
   - Devices are present here
   - All devices are files or directories

5. `/etc`:
   - Critical configuration files and startup scripts
   - System wide configurations
   - Such as settings for `ssh` are present in `vi /etc/ssh/ssh_config`

6. `/home`:
   - Location of the individual user home directories

7. `/lib`, `/lib32`, `/lib64`:
   - Contains shared libraries required by the system programs
   - Typically these directories are symbolically linked to `/usr/lib`

8. `/mnt`:
   - Mount devices temporarily: like attaching a network storage server temporarily
   - Some do permanent mounting

9. `/opt`:
   - Optional directory
   - Optional software packages are placed, mostly by vendors

10. `/proc`:
    - It is a pseudo file-system: a file-system that's created at startup and removed at shutdown
    - It contains the information about every running process on the machine
    - Each active process can have a sub-directory here
    - Also contains system information: such as CPU in `cat /proc/cpuinfo`

11. `/root`:
    - Root directory
    - Home directory for the root user

12. `/run`:
    - Contains information describing the system since boot-time
    - Such as who's logged in and what demons are running
    - Temp `fs` files

13. `/span`:
    - snap packages

14. `/srv`:
    - Occasionally used as a directory for files served by a web server or other server mechanisms such as `ftp`

15. `/sys`:
    - System files
    - Contains information about the devices, drivers, and kernel features
    - Like `/proc` but better structured

16. `/tmp`:
    - Directory to store temporary files and directories

17. `/usr`:
    - Contains most of the programs and utilities the system will run
    - The place where most of the installed programs reside

18. `/var`:
    - System specific variable files: likes logs, temp message files, spool files etc...
    - Variable files that grow
    - Some web servers like Apache server files from `/var/www` directory

19. `lost+found`:
    - Contains chunks of broken files after a system crash

20. `/media`:
    - It is the mount mount for file systems stored on removable media

### File System Tools

- `rm`: remove files or directories
- `cp`: copy files or directories
- `mv`: move files or directories
- `ls`: list directory contents
- `man`: display manual pages
- `bc` (1975): arbitrary-precision calculator language
- `find`

```bash
# list all file types in the present directory
fd -t f . --exec basename {} \; | rg -o '\.[^.]+$' | sort | uniq
```

## Compression Tools

- `tar` (1979): archive files
- `gzip` (1992): compress files
- `bzip2` (1996): compress files
- `xz` (2001): compress files
- `zip` (1989): package and compress files
- `unzip` (1996): extract compressed files

### `7z`

[`7z`](https://www.7-zip.org/) is a file archiver with a high compression ratio. It supports several compression, conversion and encryption algorithms

```bash
# compress
7z a archive.7z /path/to/folder-or-file

# ultra compression
7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on archive.7z dir1

# extract
7z x archive.7z
```

## Text Processing Tools

- `cat`: concatenate and display files
- `vi` (1976), [`vim` (1991) and `neovim` (2015)](../Collection/Editors/Vim-Neovim.md) : text editor
- [`diff`](#diff) (1974): compare files line by line
- [`grep`](#grep): search text for patterns
- [`sed`](#sed) (1974): stream editor for filtering and transforming text
- [`awk`](#awk) (1977): pattern scanning and processing language
- `sort`: sort lines of text files
- `uniq`: report or omit repeated lines
- `wc`: word, line, character, byte count
- `cut`: remove sections from each line of files
- [`tr`](#tr): translate or delete characters

### `diff`

[`diff`](https://www.gnu.org/software/diffutils/manual/diffutils.html) is a command-line utility that compares files line by line. It outputs the differences between two files, indicating which lines have been added, removed, or changed

```bash
diff file1 file2
# or to see all the difference similar to (n)vim -d (diff)
nvim <(pacman -Qi nvim) <(pacman -Si nvim)

# compare results of two commands
diff <(ls) <(ll)
```

### `grep`

[`grep`](https://www.gnu.org/software/grep/manual/grep.html) (1973) is a command-line utility for searching plain-text data sets for lines that match a regular expression. Its name comes from the `ed` command `g/re/p` (Global, Regular Expression, Print), which has the same effect

```bash
grep "pattern" "file-name.txt"

# Example: search recursively in all files in current directory for "TODO"
grep -r "TODO" .
```

Options:

```bash
-P       # use Perl-compatible regex (PCRE)
-i       # ignore case distinctions
-v       # invert match (select non-matching lines)
-r       # recursive search
-l       # print only names of files with matching lines
-n       # print line numbers with output lines
-c       # print only a count of matching lines per file
--color  # highlight matching strings
--include="*.ext"   # search only files with specified extension
--exclude="*.ext"   # exclude files with specified extension
```

#### `ripgrep`

[ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) is a similar tool to `grep` written in Rust, that recursively searches directories for a regex pattern while respecting your gitignore rules

```bash
rg "pattern" "file-name.txt"

# Example: search recursively in all files in current directory for "TODO"
rg "TODO" .
```

Options:

```bash
--smart-case  # search case insensitively unless pattern contains upper-case
-v      # invert match (select non-matching lines)
-c      # print only a count of matching lines for matching files only
-t ext  # search only files of type "text"
```

### `sed`

[sed](https://www.gnu.org/software/sed/manual/sed.html) ("Stream EDitor") is a Unix utility that parses and transforms text, using a simple, compact programming language

Use [`sed` playground](https://sed.js.org/) for testing `sed` commands online

- TMP replace pattern:

```bash
# replace "Steven" with "Kate" on each line and print to standard output
sed -i "s/Steven/Kate/" "file-name.txt"

# replace all occurrences of "foo" with "bar" on each line
sed -i "s/foo/bar/g" "file-name.txt"

# replace only the 2nd occurrence of "foo" with "bar" on each line
sed -i "s/foo/bar/2" "file-name.txt"

# apply multiple substitutions on each line
sed -i -e "s/Steven/Kate/g" -e "s/Mike/John/g" file
```

- [`sd`](https://github.com/chmln/sd) is an alternative to `sed` written in Rust, with a simpler syntax for common use-cases
- [`awk`](#awk) can also be used for text substitution

### AWK

AWK (`awk`) is a **domain-specific language** designed for text processing and typically used as a data extraction and reporting tool. Similar to the [Sed](#sed) and [Grep](#grep) commands, it is a filter, and is a standard feature of most Unix-like operating systems

- Unix/Linux:

  ```bash
  awk '/pattern/ {print "$1"}'    # standard Unix shells
  ```

- DOS/Win:

  ```powershell
  awk '/pattern/ {print "$1"}'    # compiled with DJGPP, Cygwin
  awk "/pattern/ {print \"$1\"}"  # GnuWin32, UnxUtils, Mingw
  ```

> [!WARNING] DOS/Windows Quoting Caveats
> The DJGPP compilation (for DOS or Windows-32) permits an `awk` script to follow Unix quoting syntax `'/like/ {"this"}'`. However, if the command interpreter is `CMD.EXE` or `COMMAND.COM`, single quotes will not protect the redirection arrows `(<, >)` nor do they protect pipes `(|)`. These are special symbols which require "double quotes" to protect them from interpretation as operating system directives. If the command interpreter is `bash`, `ksh`, `zsh` or another Unix shell, then single and double quotes will follow the standard Unix usage
>
> Users of MS-DOS or Microsoft Windows must remember that the percent sign `(%)` is used to indicate environment variables, so this symbol must be doubled `(%%)` to yield a single percent sign visible to awk
> To conserve space, use `"1"` instead of `"{print}"` to print each line. Either one will work

#### Handy one-line AWK scripts

- File Spacing:

```bash
 # double space a file
 awk "1;{print ""}"
 awk 'BEGIN{ORS="\n\n"};1'
 # double space a file which already has blank lines in it. Output file
 # should contain no more than one blank line between lines of text
 # NOTE: On Unix systems, DOS lines which have only CRLF (\r\n) are
 # often treated as non-blank, and thus "NF" alone will return TRUE
 awk 'NF{print $0 "\n"}'
 # triple space a file
 awk '1;{print "\n"}'
```

- Numbering and Calculations:

```bash
 # precede each line by its line number FOR THAT FILE (left alignment).
 # Using a tab (\t) instead of space will preserve margins
 awk '{print FNR "\t" $0}' files*
 # precede each line by its line number FOR ALL FILES TOGETHER, with tab
 awk '{print NR "\t" $0}' files*
 # number each line of a file (number on left, right-aligned)
 # Double the percent signs if typing from the DOS command prompt
 awk '{printf("%5d : %s\n", NR,$0)}'
 # number each line of file, but only print numbers if line is not blank
 # Remember caveats about Unix treatment of \r (mentioned above)
 awk 'NF{$0=++a " :" $0};1'
 awk '{print (NF? ++a " :" :"") $0}'
 # count lines (emulates "wc -l")
 awk 'END{print NR}'
 # print the sums of the fields of every line
 awk '{s=0; for (i=1; i<=NF; i++) s=s+$i; print s}'
 # add all fields in all lines and print the sum
 awk '{for (i=1; i<=NF; i++) s=s+$i}; END{print s}'
 # print every line after replacing each field with its absolute value
 awk '{for (i=1; i<=NF; i++) if ($i < 0) $i = -$i; print }'
 awk '{for (i=1; i<=NF; i++) $i = ($i < 0) ? -$i : $i; print }'
 # print the total number of fields ("words") in all lines
 awk '{ total = total + NF }; END {print total}' file
 # print the total number of lines that contain "Beth"
 awk '/Beth/{n++}; END {print n+0}' file
 # print the largest first field and the line that contains it
 # Intended for finding the longest string in field #1
 awk '$1 > max {max=$1; maxline=$0}; END{ print max, maxline}'
 # print the number of fields in each line, followed by the line
 awk '{ print NF ":" $0 } '
 # print the last field of each line
 awk '{ print $NF }'
 # print the last field of the last line
 awk '{ field = $NF }; END{ print field }'
 # print every line with more than 4 fields
 awk 'NF > 4'
 # print every line where the value of the last field is > 4
 awk '$NF > 4'
```

- String Creation:

```bash
 # create a string of a specific length (e.g., generate 513 spaces)
 awk 'BEGIN{while (a++<513) s=s " "; print s}'
 # insert a string of specific length at a certain character position
 # Example: insert 49 spaces after column #6 of each input line
 gawk --re-interval 'BEGIN{while(a++<49)s=s " "};{sub(/^.{6}/,"&" s)};1'
```

- Array Creation:

```bash
 # These next 2 entries are not one-line scripts, but the technique
 # is so handy that it merits inclusion here

 # create an array named "month", indexed by numbers, so that month[1]
 # is 'Jan', month[2] is 'Feb', month[3] is 'Mar' and so on
 split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec", month, " ")
 # create an array named "mdigit", indexed by strings, so that
 # mdigit["Jan"] is 1, mdigit["Feb"] is 2, etc. Requires "month" array
 for (i=1; i<=12; i++) mdigit[month[i]] = i
```

- Text Conversion and Substitution:

```bash
 # IN UNIX ENVIRONMENT: convert DOS newlines (CR/LF) to Unix format
 awk '{sub(/\r$/,"")};1'   # assumes EACH line ends with Ctrl-M
 # IN UNIX ENVIRONMENT: convert Unix newlines (LF) to DOS format
 awk '{sub(/$/,"\r")};1'
 # IN DOS ENVIRONMENT: convert Unix newlines (LF) to DOS format
 awk 1
 # IN DOS ENVIRONMENT: convert DOS newlines (CR/LF) to Unix format
 # Cannot be done with DOS versions of awk, other than gawk:
 gawk -v BINMODE="w" '1' infile >outfile
 # Use "tr" instead
 tr -d \r <infile >outfile            # GNU tr version 1.22 or higher
 # delete leading whitespace (spaces, tabs) from front of each line
 # aligns all text flush left
 awk '{sub(/^[ \t]+/, "")};1'
 # delete trailing whitespace (spaces, tabs) from end of each line
 awk '{sub(/[ \t]+$/, "")};1'
 # delete BOTH leading and trailing whitespace from each line
 awk '{gsub(/^[ \t]+|[ \t]+$/,"")};1'
 awk '{$1=$1};1'           # also removes extra space between fields
 # insert 5 blank spaces at beginning of each line (make page offset)
 awk '{sub(/^/, "     ")};1'
 # align all text flush right on a 79-column width
 awk '{printf "%79s\n", $0}' file*
 # center all text on a 79-character width
 awk '{l=length();s=int((79-l)/2); printf "%"(s+l)"s\n",$0}' file*
 # substitute (find and replace) "foo" with "bar" on each line
 awk '{sub(/foo/,"bar")}; 1'           # replace only 1st instance
 gawk '{$0=gensub(/foo/,"bar",4)}; 1'  # replace only 4th instance
 awk '{gsub(/foo/,"bar")}; 1'          # replace ALL instances in a line
 # substitute "foo" with "bar" ONLY for lines which contain "baz"
 awk '/baz/{gsub(/foo/, "bar")}; 1'
 # substitute "foo" with "bar" EXCEPT for lines which contain "baz"
 awk '!/baz/{gsub(/foo/, "bar")}; 1'
 # change "scarlet" or "ruby" or "puce" to "red"
 awk '{gsub(/scarlet|ruby|puce/, "red")}; 1'
 # reverse order of lines (emulates "tac")
 awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }' file*
 # if a line ends with a backslash, append the next line to it (fails if
 # there are multiple lines ending with backslash...)
 awk '/\\$/ {sub(/\\$/,""); getline t; print $0 t; next}; 1' file*
 # print and sort the login names of all users
 awk -F ":" '{print $1 | "sort" }' /etc/passwd
 # print the first 2 fields, in opposite order, of every line
 awk '{print $2, $1}' file
 # switch the first 2 fields of every line
 awk '{temp = $1; $1 = $2; $2 = temp}' file
 # print every line, deleting the second field of that line
 awk '{ $2 = ""; print }'
 # print in reverse order the fields of every line
 awk '{for (i=NF; i>0; i--) printf("%s ",$i);print ""}' file
 # concatenate every 5 lines of input, using a comma separator
 # between fields
 awk 'ORS=NR%5?",":"\n"' file
```

- Selective Printing of Certain Lines:

```bash
 # print first 10 lines of file (emulates behaviour of "head")
 awk 'NR < 11'
 # print first line of file (emulates "head -1")
 awk 'NR>1{exit};1'
  # print the last 2 lines of a file (emulates "tail -2")
 awk '{y=x "\n" $0; x=$0};END{print y}'
 # print the last line of a file (emulates "tail -1")
 awk 'END{print}'
 # print only lines which match regular expression (emulates "grep")
 awk '/regex/'
 # print only lines which do NOT match regex (emulates "grep -v")
 awk '!/regex/'
 # print any line where field #5 is equal to "abc123"
 awk '$5 == "abc123"'
 # print only those lines where field #5 is NOT equal to "abc123"
 # This will also print lines which have less than 5 fields
 awk '$5 != "abc123"'
 awk '!($5 == "abc123")'
 # matching a field against a regular expression
 awk '$7  ~ /^[a-f]/'    # print line if field #7 matches regex
 awk '$7 !~ /^[a-f]/'    # print line if field #7 does NOT match regex
 # print the line immediately before a regex, but not the line
 # containing the regex
 awk '/regex/{print x};{x=$0}'
 awk '/regex/{print (NR==1 ? "match on line 1" : x)};{x=$0}'
 # print the line immediately after a regex, but not the line
 # containing the regex
 awk '/regex/{getline;print}'
 # grep for AAA and BBB and CCC (in any order on the same line)
 awk '/AAA/ && /BBB/ && /CCC/'
 # grep for AAA and BBB and CCC (in that order)
 awk '/AAA.*BBB.*CCC/'
 # print only lines of 65 characters or longer
 awk 'length > 64'
 # print only lines of less than 65 characters
 awk 'length < 64'
 # print section of file from regular expression to end of file
 awk '/regex/,0'
 awk '/regex/,EOF'
 # print section of file based on line numbers (lines 8-12, inclusive)
 awk 'NR==8,NR==12'
 # print line number 52
 awk 'NR==52'
 awk 'NR==52 {print;exit}'          # more efficient on large files
 # print section of file between two regular expressions (inclusive)
 awk '/Iowa/,/Montana/'             # case sensitive
```

- Selective Deletion of Certain Lines:

```bash
 # delete ALL blank lines from a file (same as "grep '.' ")
 awk NF
 awk '/./'
 # remove duplicate, consecutive lines (emulates "uniq")
 awk 'a !~ $0; {a=$0}'
 # remove duplicate, non-consecutive lines
 awk '!a[$0]++'                     # most concise script
 awk '!($0 in a){a[$0];print}'      # most efficient script
```

### `tr`

[`tr`](https://www.gnu.org/software/coreutils/manual/html_node/tr-invocation.html) (translate or delete characters) is a command in Unix and Unix-like operating systems that translates, squeezes, and/or deletes characters from standard input, writing to standard output

```bash
# translate lowercase to uppercase
tr 'a-z' 'A-Z' < input.txt > output.txt

# delete all digits from input
tr -d '0-9' < input.txt > output.txt

# squeeze multiple spaces into a single space
tr -s ' ' < input.txt > output.txt

# replace ":" with newlines
echo $PATH
# /home/user/.local/bin:/usr/local/sbin

echo $PATH | tr ':' '\n'
# /home/user/.local/bin
# /usr/local/sbin
```

### PDF

PDF to image:

```bash
# pdftoppm <image_format> <input_pdf> <image_output>

pdftoppm -png resume.pdf resume.png

# by default it will output 100 DPI, which can be increased
pdftoppm -png -rx 300 -ry 300 resume.pdf resume.png
```

### mpv

Use mpv to take snapshots from webcam:

- [Arch Webcam Setup](https://wiki.archlinux.org/title/webcam_setup)

```bash
mpv av://v4l2:/dev/video0 --profile=low-latency --untimed
```

To use MJPEG as the pixelformat instead of the default, which in most cases is YUYV, you can run the following instead:

```bash
mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0
```

In some cases this can lead to drastic improvements in quality and performance (_5 FPS_ -> _30 FPS_ for example), [see the mpv documentation](https://github.com/mpv-player/mpv/wiki/Video4Linux2-Input)

## User Management

| Command                               | Description                |
| ------------------------------------- | -------------------------- |
| `sudo adduser username`               | Create a new user          |
| `sudo userdel username`               | Delete a user              |
| `sudo usermod -aG groupname username` | Add a user to group        |
| `sudo deluser username groupname`     | Remove a user from a group |

## Networking

- `ssh` (1995): secure shell
- `scp` (1995): secure copy
- [`curl`](#curl): transfer data from or to a server
- `wget` (1996): non-interactive network downloader
- `netstat` (1983): network statistics
- `nmap` (1997): network mapper
- `traceroute` (1987): print the route packets take to the network host

### `curl`

[`curl`](https://curl.se/) is a command-line tool for transferring data. It supports various protocols including HTTP, HTTPS, FTP, and more

- Built by Daniel Stenberg in 1998
- [`curl` book](https://everything.curl.dev/)

```bash
# basic GET request
curl http://httpbin.org/get

# download a file
curl -O content.txt http://example.com/file.txt

# send a POST request with data
curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' http://httpbin.org/post
curl --post

# upload files and share for free (limit 10GB)
curl --upload-file ./hello.txt https://transfer.sh/hello.txt
```

Options from [man page](https://curl.se/docs/manpage.html):

```bash
-v                # verbose output (for debugging)
-i                # include response headers in output
-I                # fetch only the headers
-L or --location  # follow redirects

-X                # specify request method (GET, POST, PUT, DELETE, etc.)
-G or --get       # GET request
--json            # send JSON data (implies content-type, and -d)

-H or --head      # add custom headers
-d or --data      # send data in POST request
-s or --silent    # silent mode (no progress meter or error messages)
```

Handy scripts:

```bash
# curl version and supported protocols
curl --version

# download multiple files parallelly
curl -Z -O http://example.com/file1.txt -O http://example.com/file2.txt

# use glob patterns to download multiple files
curl --parallel --parallel-max 5 -O http://example.com/file[1-100].txt

# resume interrupted download
curl -C - -O http://example.com/largefile.zip

# full url of a shortened link
curl -sIL bit.ly/1sNZMwL

# dns lookup
curl -s -o /dev/null -w "dns_lookup: %{time_namelookup}s\nconnect: %{time_connect}s\nappconnect: %{time_appconnect}s\npretransfer: %{time_pretransfer}s\nstarttransfer: %{time_starttransfer}s\nhttp_code: %{http_code}\n---\ntotal: %{time_total}s" https://api.github.com
```

Services:

```bash
# ip lookup
curl ifconfig.me
curl https://checkip.amazonaws.com/
curl https://ipinfo.io/ip

# weather info
curl wttr.in/[location]

# word from the dictionary
curl "dict://dict.org/d:[word]"

# read email via imap
curl -k --url "imaps://imap.gmail.com/INBOX" -u "your_email:password" -X "SEARCH ALL"

# telnet via curl
curl telnet://[hostname]:[port]

# mqtt via curl
curl --output - "mqtt://test.mosquitto.org:1883/demo/hello"
```

- [xh](https://github.com/ducaale/xh) is an alternative to `curl` written in Rust, with a simpler syntax for common use-cases

### OpenSSH

Known Hosts

- Remove Entry from the Known-Hosts File:

```bash
ssh-keygen -R hostname
```

Using the SSH Config File

If you are regularly connecting to multiple remote systems over SSH, you can configure your remote servers with the `.ssh/config` file

_Example:_

```ini
Host dev
    HostName dev.your-domain
    User xcad
  Port 7654
    IdentityFile ~/.ssh/targaryen.key
Host *
    User root
    Compression yes
```

Connect to a host (like `dev` , eg.) with `ssh dev`

#### OpenSSL

- Generate a DKIM private and public keypair:

```bash
openssl genrsa -out dkim_private.pem 2048

openssl rsa -in dkim_private.pem -pubout -outform der 2>/dev/null | openssl base64 -A
```

### `iptables`

Iptables is a user-space utility program that allows a system administrator to configure the IP packet filter rules of the Linux kernel firewall, implemented as different Netfilter modules. The filters are organized in different tables, which contain chains of rules for how to treat network traffic packets. Different kernel modules and programs are currently used for different protocols; iptables applies to IPv4, ip6tables to IPv6, arptables to ARP, and ebtables to Ethernet frames

### UFW (Uncomplicated Firewall)

UFW (uncomplicated firewall) is a firewall configuration tool for Linux that runs on top of [iptables](#iptables), included by default within Ubuntu distributions. It provides a streamlined interface for configuring common firewall use cases via the command line

Enable UFW

- To check if ufw is enabled, run:

```bash
sudo ufw status
```

- To enable UFW on your system, run:

```bash
sudo ufw enable
```

- If for some reason you need to disable UFW, you can do so with the following command:

```bash
sudo ufw disable
```

- Block an IP Address/Subnet:

```bash
sudo ufw deny from 203.0.113.0/24
```

## Images

- Compress image:

  ```bash
  magick -format jpg -quality 50 /path/to/image.svg /path/to/image.jpg

  # or

  mogrify -compress JPEG -quality 50 /path/to/image.jpg

  # or

  convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% /path/to/source/image.jpg /path/to/result/image.jpg

  # or

  jpegoptim --size=512k /path/to/image.jpg
  ```

- Compare images: using [Image magick compare](https://imagemagick.org/script/compare.php)

  ```bash
  magick compare image1.jpg image2.jpg diff.png
  ```

## Other common tools

- `column`: columnate or tabulate input

  ```bash
  # display file in columns
  column -t filename.txt

  # display output of command in columns
  ls -l | column -t

  # format `mount` output into neat columns
  mount | column -t
  ```

## `cron`

A cron expression is simply a string consisting of six fields that each define a specific unit of time

Each line of a crontab file represents a job, and looks like this:

```text
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                   7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * <command to execute>
```

Additionally you can also use the following **special characters to build more advanced expressions**:

| Special Character | Description                        |
| ----------------- | ---------------------------------- |
| `*`               | Trigger on tick of every time unit |
| `,`               | List separator                     |
| `–`               | Specifies a range                  |
| `/`               | Defines an increment               |

_Example:_

```bash
# executes every minute
0 * * * * *

# executes every hour
0 0 * * * *

# executes every day
0 0 0 * * *

# executes every month
0 0 0 0 * *

# executes on first day of jan each year
0 0 0 1 1 *

# executes at 08:30pm every saturday
30 20 * * SAT

# executes at 08:30pm every saturday
30 20 * * 6

# executes every five minutes
0 */5 * * * *

# executes every hour between 8am and 10am
0 0 8-10/1 * * *
```

## Mount

In Linux, `mount` is a command in various operating systems. Before a user can access a file on a Unix-like machine, the file system on the device which contains the file needs to be mounted with the mount command. Frequently mount is used for SD card, USB storage, DVD and other removable storage devices

- List mount-points:

```bash
findmnt (optional)<device/directory>
```

- Unmount:

```bash
umount <device/directory>
```

## Encryption

Encrypt and decrypt files and folders:

```bash
# encrypt
tar -cvf directory.tar directory
gpg --symmetric --cipher-algo AES256 directory.tar

# decrypt
gpg --decrypt directory.tar.gpg > directory.tar

tar -xvf directory.tar
```

## Disable Start-Up Process

1. Stop and disable **Bluetooth**:

   ```bash
   sudo systemctl stop bluetooth.service
   sudo systemctl disable bluetooth.service
   systemctl status bluetooth.service
   ```

   [Cleaning Your Linux start-up Process](https://www.linux.com/topic/desktop/cleaning-your-linux-startup-process/)

2. To stop other service to start Bluetooth, mask it using `sudo systemctl mask bluetooth.service`

## Pacman

- List all installed packages sorted by size:

  ```bash
  pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
  ```

- Clear _pacman_ cache

  ```bash
  # get total cached packages
  sudo ls /var/cache/pacman/pkg/ | wc -l

  # get total cache size
  du -sh /var/cache/pacman/pkg/

  # clean all packages, expect the 3 most recent versions
  sudo paccache -r

  # clean all packages, expect the n most recent versions
  sudo paccache -rk n

  # remove all uninstalled packages
  sudo paccache -ruk0

  # OR
  sudo pacman -Sc

  # remove all installed and uninstalled package cache
  sudo pacman -Scc
  ```

- Alternative create a hook to auto clean cache

  ```bash
  sudo vi /etc/pacman.d/hooks/clean_package_cache.hook
  ```

  ```text
  [Trigger]
  Operation = Upgrade
  Operation = Install
  Operation = Remove
  Type = Package
  Target = *
  [Action]
  Description = Cleaning pacman cache...
  When = PostTransaction
  Exec = /usr/bin/paccache -r
  ```

> Refer: [Recommended ways to clean cache](https://ostechnix.com/recommended-way-clean-package-cache-arch-linux/)

## Starship Prompt

[Starship](https://starship.rs/) is a minimal, blazing-fast, and infinitely customizable cross-shell prompt for any shell

### Installation Linux

1. Install/Update the latest version:

   ```bash
   curl -sS https://starship.rs/install.sh | sh
   ```

2. Add the following to the end of `~/.bashrc` or `~/.zshrc`:

   ```bash
   eval "$(starship init bash)"
   # -- or --
   eval "$(starship init zsh)"
   ```

## Dual Booting OS

Dual boot Windows and Linux

### Remove Linux From Dual Boot

Here are two methods to remove the OS

#### Method 1

1. Boot into _Windows 10_
2. Go to **Disk Management**.
3. Delete the drive(s) containing the _Linux OS_
4. Delete the **Free Partition**.
5. Then rebuild **`mbr`**.

#### Method 2

1. `shift + Restart` -> Troubleshoot -> Advanced options -> `cmd` -> then type:

   ```bash
   bootrec /fixmbr
   bootrec /fixboot
   bootrec /scanos
   bootrec /rebuildbcd
   ```

2. `bcdedit /enum all`

3. `bcdedit /delete identifier`
