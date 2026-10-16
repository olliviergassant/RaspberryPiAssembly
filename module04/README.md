<!--Break Down of HelloWorld.s File -->
# Break Down of "promptUserAge.s" File

[small blrb about project]
All of my programs are written using the Vim text editor. The configuration of my vim can be found in the [.vimrc](https://github.com/olliviergassant/RaspberryPiAssembly/blob/main/.vimrc) 
file found within the [RaspberryPiAssembly](https://github.com/olliviergassant/RaspberryPiAssembly)

### Assignment Prompt
* Write a Hello World program in ARM assembly.
* Assemble, link, and build the executable.
* Run the program from the shell.

## Writing the Program

An assembly file is divided into sections, and directives tell the assembler how to treat the code.

* `.text` – the section that holds the program's instructions
* `.data` – the section that holds initialized data stored in memory, like the helloWorld string
* `.global` – a directive (not a section) that makes a label, like `main`, visible to the linker so the program has an entry point


### Breaking Down Line by Line


## Assemble, Link, and Build
From inside the program's folder, run:

```bash
gcc projectName.s -g -o projectName
```

This one command does both steps:
* **Assemble** – turns the assembly code into machine code (an object file)
* **Link** – combines that object file with the C library so the call to `printf` works, producing the executable

The flags:
* `-g` – includes debugging information, so the program can be stepped through in gdb
* `-o projectName` – names the executable `projectName` (without it, gcc names it `a.out`)

## Running the Program
From the same folder, run the program with `./<projectName>`:

```bash
./projectName
```

`./` tells the shell to look for the program in the current folder.

Expected output:

```
WRITE HERE! 
```


