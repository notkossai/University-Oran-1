# SE2 – TP - HomeWork1 Solution

## 1. Explain and describe the relationships between: Hardware, Operating System, Kernel, Programs, Process 
A computer system is built in layers, where each layer depends on the one below it. Their relationship can be understood like this:

---

### 🔹 Hardware

Physical components: CPU, memory (RAM), disk, motherboard, etc.
Hardware cannot understand programs directly — it only understands binary instructions.

---

### 🔹 Operating System (OS)

The OS is the bridge between hardware and user programs.
Examples: Linux, Windows, macOS.

OS responsibilities:

* Manages hardware (CPU, RAM, disk, network)
* Provides a user interface (terminal, GUI)
* Manages files and permissions
* Allocates resources to programs

---

### 🔹 Kernel

The kernel is the core of the OS, a low-level component that:

* Communicates directly with hardware
* Manages memory and CPU scheduling
* Creates and kills processes
* Handles system calls (fork(), exec(), wait(), etc.)

Relationship:
OS = Kernel + system programs + utilities
The kernel is inside the OS, and everything on the system ultimately depends on it.

---

### 🔹 Programs

A program is a file stored on disk containing code (C file → compiled binary).
It is not running and is inactive until executed.

Examples:

* ls
* nano
* Your C program
* Firefox

---

### 🔹 Process

A process is a running instance of a program.
When you execute a program:

* The kernel loads it from disk into RAM
* Assigns it a PID (Process ID)
* Manages its CPU and memory

Examples:

* Running nano is a process
* Running your compiled C program is a process
* Running two Firefox windows = two processes

---

### ✔️ Relationship Summary

| Component            | Role              | Relationship                    |
| -------------------- | ----------------- | ------------------------------- |
| Hardware         | Physical machine  | Lowest level                    |
| Kernel           | Controls hardware | Talks directly to hardware      |
| Operating System | Full environment  | Uses kernel + system tools      |
| Program          | Code on disk      | Becomes a process when executed |
| Process          | Running program   | Controlled by OS & kernel       |

---

## 2. Re-practice the worksheet with emphasis on:

Below is the explanation of each required step.

---

### 2.1 Basic Shell Commands

Common commands practiced:

* `ls` – list files
* `cd` – move between directories
* `pwd`– show current folder
* `mkdir` – create directory
* `rm`, `cp`, `mv` – remove, copy, move files
* `man` – show manual pages
* `cat`, `less`, `touch`, `echo`

These commands are essential for navigating and interacting with the Linux system.

---

### 2.2 Editing a C Program Using nano

Steps practiced:

1. Create file: 
`nano program.c`
2. Edit code inside **nano**
3. Save with **CTRL + O**
4. Exit nano with **CTRL + X**

Skills learned:

* **Basic text editing**
* **Using a terminal editor**
* **Writing C code without a GUI IDE**

---

### 2.3 Compilation with gcc and executing the binary

Steps practiced:  

`gcc program.c -o program`  

`./program`    

This covers:  
* **Preprocessing**
* **Compiling**
* **Linking**
* **Generating an executable**
* **Running the compiled binary**

---

### 2.4 Process Monitoring using ps and htop

Commands used:

* `ps aux` → show running processes
* `ps -ef` → show processes in full format
* `htop` → interactive process viewer (CPU, RAM consumption)

---

### 2.5 Process Management in C

System calls practiced:

* `getpid()` → Returns the current process ID
* `getppid()` → Returns the parent process ID
* `fork()` → Creates a new process (child is a copy of the parent)
* `wait()` → Makes the parent process wait for the child to finish
* `exec()` → Replaces the current process image with a new program

Skills learned:

* **Creating processes**
* **Observing parent/child behavior**
* **Synchronizing processes**
* **Replacing processes with new programs**