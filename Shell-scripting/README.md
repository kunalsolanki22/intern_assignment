# Module 1

---

### Navigation 
* **pwd** - Shows you exactly where you are (Print Working Directory).
* **ls** - Lists everything in your current folder.
* **ls -l** - Lists files with extra details like size and date.
* **cd [folder]** - Moves you into a folder.
* **cd ..** - Moves you back one step (always remember the space!).
* **cd ~** - Takes you straight back to your main Home folder.

---

### Creating & Viewing 
* **mkdir [name]** - Creates a new empty folder.
* **touch [name]** - Creates a new empty file instantly.
* **cat [file]** - Shows you what is written inside a file.
* **cat > [file]** - Lets you create a file and start typing. Press `Ctrl+D` to save.
* **nano [file]** - Opens a simple text editor (useful for writing scripts).

---

### Moving & Renaming
* **mv "old.txt" "new.txt"** - Renames a file if the location is the same.
* **mv [file] [folder]** - Moves a file into a different folder.
* **mv -v** - "Verbose" mode: Tells you exactly what was moved or renamed.
* **mv -n**	- "No-clobber" mode: Prevents overwriting any existing file entirely.
* **mv -i** - "Interactive" mode: Asks you before overwriting an existing file.

---

### Deleting
* **rm [file]** - Deletes a file forever.
* **rmdir [folder]** - Deletes a folder, but only if it's empty.
* **rm -r [folder]** - Deletes a folder and everything inside it (Be careful!).

---

### Redirecting
* **>** - Overwrites: Sends text to a file and replaces what was already there.
* **>>** - Appends: Adds text to the bottom of a file without deleting the old stuff.

---

# Module 2
---

### Hash-bang (`#!/bin/bash`)
* **Definition:** The first line of a script that tells the OS which interpreter to use.
* **Path:** `/bin/bash` is the standard location for the Bash shell in Linux.
* **Importance:** Ensures your script runs correctly regardless of which shell the user is currently using.
---

* **echo "text"** - Prints text to the terminal screen.

### System Commands
* **date** - Displays the current system date and time.
* **whoami** - Displays the username of the person currently logged in.
* **hostname** - Displays the name of the computer/network node.

### Execution Workflow
1. **Create:** `touch myscript.sh`
2. **Permit:** `chmod +x myscript.sh` (Make the file executable).
3. **Run:** `./myscript.sh` (The `./` tells Linux to look in the current folder).

---

# Module 3
---


### User Input
* **read [var]** - Pauses script to let user type; saves it to the variable.
* **read -p "Prompt" [var]** - Displays a message while waiting for input (-p for prompting).

### Variables
* **Assigning:** `NAME="Kunal"` (No spaces around `=`).
* **Accessing:** `$NAME` (Always use the `$` to get the value).

* **Syntax:** `$(( expression ))`

### Example Usage
`result=$((10 * 5))`
`echo "The result is $result"`

---
# Module 4
---

### Conditional Statement Structure
```bash
if [ condition ]; then
    # Runs if true
elif [ another_condition ]; then
    # Runs if first condition is false AND this one is true
else
    # Runs if all above are false
fi
```

### File Test Operators

* **-e** : True if the file/folder **exists**.
* **-f** : True if it is a **regular file** (not a folder).
* **-d** : True if it is a **directory** (folder).
* **-r** : True if you have **read** permission.
* **-w** : True if the file is **writable**.
* **-x** : True if the file is **executable**.
* **-s** : True if the file is **not empty** (size > 0).

---

### Comparison Operators

* **-eq** : Equal to (e.g., `[ $num -eq 10 ]`)
* **-ne** : Not equal to
* **-gt** : Greater than
* **-lt** : Less than
* **-ge** : Greater than or equal to
* **-le** : Less than or equal to

---
* **-n** : True if the string is **NOT empty** (Length is non-zero). `if [ -n "$name" ]`
* **-z** : True if the string **IS empty** (Length is zero).


-- Spaces are Mandatory
* True `if [ $a -eq $b ]`
* False `if [$a -eq $b]`

-- When comparing **text** (like names or words), use `==` or `!=`. When comparing **numbers**, use the operators listed above (like `-eq`).
* **Example:** `if [ "$name" == "Kunal" ]`

---
# Module 5
---

### Loops
* **for item in [list]; do ... done** - Best for processing a known list of files or numbers.
* **while [ condition ]; do ... done** - Best for tasks that repeat until a condition changes.
  
### For Loop Ranges
* **{1..10}** - Standard range (1 to 10).
* **{1..10..2}** - Range with a step (1, 3, 5, 7, 9).
* **{z..a}** - Reverse range (Counting backwards).
* **((i=0; i<10; i++))** - C-Style loop (Best when using variables for the limit).

---
# Module 6
---

---

```bash
  function_name() {
  # commands
  }
```
* **Calling:** Simply type the name: `function_name`

---

### Positional Parameters (Arguments)
Functions use special variables to handle data passed into them:

* **$1, $2, $3...** : Refers to the first, second, or third input passed to the function.
* **$#** : Tells you how many arguments were passed in total.
* **$@** : Represents all arguments as a single list.

---

### local` Keyword
By default, variables in Bash are **global** (accessible anywhere). Using `local` ensures the variable only exists inside that specific function.

*  It prevents a function from accidentally changing a variable used in the main part of your script.

---

* You can write `result=$((a + b))` instead of `$(( $a + $b ))`.
* Keep the `$` for positional parameters (like `$1`) to avoid confusion.
---

### Exit and Return

`return` stops a function, while `exit` stops the entire script.
* **return**: Use this to exit a **function** and send a status code back to the main script.
* **exit 0** - Success (Everything worked).
* **exit 1** - Failure (General error/catch-all).
* **exit [1-255]** - Various error codes.
* **$?** - A special variable that holds the exit status of the last command run.
* **$?**: Use this special variable after calling a function to see if it succeeded (`0`) or failed (`1+`).

---
# Module 7
---
Text processing allows you to search, edit, and extract specific information from large data files like server logs.

---

### Key Tools
* **grep**: Searches for specific patterns (e.g., "ERROR").
* **awk**: Best for extracting specific columns from a line.
* **sed**: A stream editor used for find-and-replace or deleting lines.
* **sort & uniq**: Used together to organize data and remove duplicates.

---

### Redirection & Pipes
* **`|` (Pipe)**: Pass the output of one command to the input of the next.
* **`>`**: Redirect output to a file (overwrites existing content).
* **`>>`**: Append output to the end of an existing file.

---
# Module 8
---

### Defining Arrays
* **Create:** `NAMES=("Alice" "Bob" "Charlie")`
* **Empty Array:** `MY_LIST=()`

### Accessing Data
* **Single Item:** `${NAMES[0]}` (First item is always index 0).
* **All Items:** `${NAMES[@]}`
* **Total Count:** `${#NAMES[@]}`
* **Indices:** `${!NAMES[@]}` (Lists the index numbers: 0 1 2).

### Operations
* **Add Item:** `NAMES+=("David")`
* **Delete Item:** `unset NAMES[1]`
* **Update Item:** `NAMES[0]="NewName"`

### Looping through Arrays
```bash
for i in "${ARRAY[@]}"; do
    echo "Processing $i..."
done
```

${str^^} converts the entire string to uppercase

---
# Module 9
---

### Debugging Flags
Add these to the top of your script for "Strict Mode":
* **set -x** : Prints commands and their arguments as they are executed (Trace mode).
* **set -e** : Exit immediately if a command exits with a non-zero status.
* **set -u** : Treat unset variables as an error and exit immediately.

### Logging Techniques
* **tee -a [file]** : Prints output to the screen AND appends it to a file.
* **Standard Error (2>)** : Redirect errors specifically to a log file.
  * `command 2> error.log`
* **Silencing ( > /dev/null 2>&1 )** : Hide both standard output and errors.

### Traps and Exit Codes
* **exit 0** : Success.
* **exit 1** : General error.
* **trap [function] [SIGNAL]** : Runs a specific function when the script hits an error (`ERR`) or is interrupted (`SIGINT`).

### `$?` Variable
Always check the exit status of critical commands:
```bash
cp file.txt backup/
if [ $? -ne 0 ]; then
    echo "Copy failed!"
    exit 1
fi
