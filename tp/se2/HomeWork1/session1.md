-------------------------------------
 _     _                     ___                       _   _             
| |   (_)_ __  _   ___  __  / _ \ _ __   ___ _ __ __ _| |_(_)_ __   __ _ 
| |   | | '_ \| | | \ \/ / | | | | '_ \ / _ \ '__/ _` | __| | '_ \ / _` |
| |___| | | | | |_| |>  <  | |_| | |_) |  __/ | | (_| | |_| | | | | (_| |
|_____|_|_| |_|\__,_/_/\_\  \___/| .__/ \___|_|  \__,_|\__|_|_| |_|\__, |
                                 |_|                               |___/ 
 ____            _                 
/ ___| _   _ ___| |_ ___ _ __ ___  
\___ \| | | / __| __/ _ \ '_ ` _ \ 
 ___) | |_| \__ \ ||  __/ | | | | |
|____/ \__, |___/\__\___|_| |_| |_|
       |___/                       
-------------------------------------

## Linux Architecture Overview

A common definition of the operating system is that it is the program that runs at all times on the computer—usually called the **kernel**.

Along with the kernel, there are two other types of programs:
- **System programs**, which are associated with the operating system but are not necessarily part of the kernel.
- **Application programs**, which include all programs not directly related to the operation of the system.

```
| User Applications | → | Shell & System Tools | → | Kernel | → | Hardware |
```

---

## Kernel vs. Operating System

- The **kernel** is the core, lowest-level software in the operating system.
- The **kernel is like the engine of a car**, while the **operating system is the entire car**.

---

## What Is a Shell?

A **shell** is a command interpreter that asks the kernel to perform actions.

```
User → Shell → Kernel → Hardware
```

---

## Shell vs. Terminal vs. Command

- **Shell** → The command interpreter
- **Command** → An instruction given to the shell
- **Terminal** → The software interface used to access the shell

---

## Common Shell Commands

| Command | What It Does               | Example            | What Happens                          |
|---------|----------------------------|--------------------|---------------------------------------|
| `ls`    | Lists files and folders    | `ls`               | Shows files in the current directory |
|         |                            | `ls -l`            | Detailed listing                     |
| `mkdir` | Creates a directory        | `mkdir test`       | Creates a folder named `test`        |
| `echo`  | Displays text              | `echo Hello`       | Outputs: `Hello`                     |
| `cat`   | Displays file content      | `cat file.txt`     | Prints file content                  |
| `less`  | Reads file page by page    | `less file.txt`    | Scrollable view                      |
| `more`  | Basic pager                | `more file.txt`    | Page-by-page reading                 |
| `grep`  | Searches text              | `grep root /etc/passwd` | Finds the word `root`          |

---

## The `man` Command

The `man` command is Linux's offline documentation system. It is your **first and fastest source** for understanding any command.

Example:
```bash
man ps
```

---

## Pipe `|`

A **pipe** is a form of redirection that transfers the standard output of one command to another command as input.

### Examples

**1. List files and search for a specific name:**
```bash
ls | grep file.txt
```

**2. Sort a file and remove duplicates:**
```bash
sort record.txt | uniq
```

**3. Chaining multiple pipes:**
```bash
ps aux | grep root | sort | less
```

---

## Text Editors

We can access text editors from the terminal by executing dedicated shell commands. There are two main types:
- **CLI-based editors**
- **GUI-based editors**

---

## CLI-Based Text Editors

CLI (Command Line Interface) editors are lightweight and practical for fast editing. They run inside the terminal and are controlled mainly by the keyboard.

Examples: `nano`, `vim`, `emacs`

Example:
```bash
nano file.txt
```

---

## GUI-Based Editors

GUI (Graphical User Interface) editors are controlled using the keyboard, mouse, windows, and menus.

Examples: VS Code, Notepad++, Gedit

Example:
```bash
code file.txt
```

---

## GCC (GNU Compiler Collection)

GCC is mainly used to compile C and C++ programs.

Example: Compile a C file into a binary executable:
```bash
gcc hello.c -o hello
```

---

## Running a Binary File

To execute a binary file, type its name in the shell:
```bash
./hello
```

**Note:** `./` tells the shell to look for the program in the current directory.

---

## Process

A **process** is a program in execution.

> Everything in Linux is a process—from your text editor to the system daemons.

---

## Process Monitoring Using the Shell

### `ps` — Process Status

Displays active processes in the system.

**Example 1: List all system processes**
```bash
ps -e
```

**Example 2: Display full process information**
```bash
ps -ef
```

**Example 3: Sort processes by CPU and memory usage**
```bash
ps aux --sort=-pcpu,-pmem | less
```

---

### `pstree`

Displays processes in a tree structure, starting from the system’s first process (`init` or `systemd`).

---

### `top`

Provides a real-time dynamic view of running processes, including CPU and memory usage.

---

### `htop`

An enhanced interactive version of `top` with colors, scrolling, and easier process management.

---

## Process Management in C

In the C programming language, processes are manipulated using system calls provided by the operating system.

---

## Process API in Linux

The **Process API** is a set of system calls that allow user programs to communicate with the kernel to manage processes.

> Every time you open an application, run a script, or execute a command, you interact with the Process API.

---

## Standard POSIX System Calls

Header files and functions:
```c
#include <sys/types.h>
#include <unistd.h>

pid_t getpid(void);
pid_t getppid(void);
```

---

## Example: Display PID and PPID

```c
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main() {
    pid_t my_pid = getpid();
    pid_t my_parent_pid = getppid();

    printf("PID: %d\n", my_pid);
    printf("Parent PID: %d\n", my_parent_pid);

    sleep(100);
    return 0;
}
```

---

## `fork()`

When a process calls `fork()`, the operating system creates a new **child process**, which is an exact copy of the parent process.

- `fork()` returns **0** to the child process.
- It returns the **child PID** to the parent process.

```c
pid_t pid = fork();
if (pid == 0) {
    printf("Hello from child!\n");
} else {
    printf("Hello from parent!\n");
}
```

---

## `exec()`

The `exec()` family of functions replaces the current process image with a new program.

- The PID **does not change**.
- **No new process is created**.

Function prototypes:
```c
int execl(const char *path, const char *arg0, ...);
int execv(const char *path, char *const argv[]);
```

### Example (execl)
```c
#include <stdio.h>
#include <unistd.h>

int main() {
    execl("/bin/ls", "ls", "-l", NULL);
    printf("Execution failed.\n");
    return 0;
}
```

### Example (execv)
```c
#include <stdio.h>
#include <unistd.h>

int main() {
    char *argv[] = {"ls", "-l", NULL};
    execv("/bin/ls", argv);
    printf("Execution failed.\n");
    return 0;
}
```

---

## `wait()`

After creating a child process, the parent can wait for it to finish using `wait()`.

### Example
```c
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();

    if (pid == 0) {
        printf("Child: PID = %d\n", getpid());
        sleep(2);
        return 0;
    } else if (pid > 0) {
        printf("Parent: waiting for child...\n");
        wait(NULL);
        printf("Parent: child finished.\n");
    } else {
        perror("fork");
    }

    return 0;
}
```
# References

1. Loukil, L. *Recueil de travaux pratiques de SE2*. Université Oran 1.
2. Silberschatz, A., Galvin, P. B., & Gagne, G. (2018). *Operating System Concepts* (10th ed.). Wiley.
3. Bhatt, P. C. P. *An Introduction to Operating Systems*, 2nd ed. PHI.
4. Tanenbaum, A. S. *Modern Operating Systems*, 3rd ed. PHI.
5. Kannangara, K. (2025). *Mastering the Process API in Linux*. HackingLovers.
6. IEEE & The Open Group. *POSIX.1-2017 Specifications*.
7. Linux man pages: `fork(2)`, `execve(2)`, `execl(3)`, `execv(3)`, `getpid(2)`, `getppid(2)`.
8. Stevens, W. R., & Rago, S. A. (2013). *Advanced Programming in the UNIX Environment*. Addison-Wesley.
9. Kerrisk, M. (2010). *The Linux Programming Interface*. No Starch Press.

