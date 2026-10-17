<!-- Breakdown of the promptUserAge.s file -->

# scanf and printf Projects

Projects in this folder focus on the `scanf` and `printf` functions from the C library.

All of my programs are written using the Vim text editor. My Vim configuration can be found in the [.vimrc](https://github.com/olliviergassant/RaspberryPiAssembly/blob/main/.vimrc) file in the [RaspberryPiAssembly](https://github.com/olliviergassant/RaspberryPiAssembly) repository.

## Table of Projects

- [Breakdown of the `promptUserAge.s` File](#breakdown-of-the-promptuserages-file)
- [Breakdown of the `quotedStringPrompt.s` File](#break-down-of-the-quotedstringprompts-file)

---

# Breakdown of the `promptUserAge.s` File

## Assignment Prompt

Write a program that prompts for the user's age and prints it.

## Writing the Program

An assembly file is divided into sections, and directives tell the assembler how to treat the code.

- `.text` – the section that holds the program's instructions
- `.data` – the section that holds initialized data stored in memory, like the `prompt1` and `output1` strings
- `.global` – a directive (not a section) that makes a label, like `main`, visible to the linker so the program has an entry point

In my code, I separate the different concepts, or functions, of the program into separate blocks.

## Breaking Down Line by Line

### Concept 1: Printing the Prompt to the Screen

**Line 18:** `LDR r0, =prompt1`
Loads the memory address of the `prompt1` string into register 0 so that `printf` knows where to find it. The `=` tells the assembler to use the label's address. `prompt1` is an `.asciz` string: `"Please enter your age -> "`.

**Line 19:** `BL printf`
Branches and links to `printf`, a function defined outside of this file in the C library. `BL` stores the return address in the link register (`LR`), overwriting whatever was there before.

### Concept 2: Scanning the User Input

**Line 22:** `LDR r0, =format1`
Loads the memory address of the `format1` string into register 0 so that `scanf` knows where to find it. `format1` is an `.asciz` string: `"%s"`, which tells `scanf` what type of data to read from the user.

**Line 23:** `LDR r1, =age1`
Loads the memory address of `age1` into register 1 so that `scanf` knows where to store the input. `age1` is created with the `.space` directive, which reserves a specified number of uninitialized bytes in memory.

**Line 24:** `BL scanf`
Branches and links to `scanf`, a function defined outside of this file in the C library. `BL` stores the return address in `LR`, overwriting whatever was there before.

### Concept 3: Printing the Output to the Terminal

**Line 27:** `LDR r0, =output1`
Loads the memory address of the `output1` string into register 0 so that `printf` knows where to find it. The `output1` string contains the `%s` format specifier, which tells `printf` where to place the user's input.

**Line 28:** `LDR r1, =age1`
Loads the memory address of the user's input (previously stored in `age1`) into register 1.

**Line 29:** `BL printf`
Branches and links to `printf`, a function defined outside of this file in the C library. `BL` stores the return address in `LR`, overwriting whatever was there before.

## Assemble, Link, and Build

From inside the program's folder, run:

```bash
gcc promptUserAge.s -g -o promptUserAge
```

This one command does both steps:

- **Assemble** – turns the assembly code into machine code (an object file)
- **Link** – combines that object file with the C library so the calls to `printf` and `scanf` work, producing the executable

The flags:

- `-g` – includes debugging information, so the program can be stepped through in gdb
- `-o promptUserAge` – names the executable `promptUserAge` (without it, gcc names it `a.out`)

## Running the Program

From the same folder, run the program with `./<programName>`:

```bash
./promptUserAge
```

`./` tells the shell to look for the program in the current folder.

Expected output:

```
Please enter your age -> 25
<!-- TODO: paste the actual output line here -->
```


# Breakdown of the `quotedStringPrompt.s` File

## Assignment Prompt



## Writing the Program

An assembly file is divided into sections, and directives tell the assembler how to treat the code.

- `.text` – the section that holds the program's instructions
- `.data` – the section that holds initialized data stored in memory, like the `prompt1` and `output1` strings
- `.global` – a directive (not a section) that makes a label, like `main`, visible to the linker so the program has an entry point

In my code, I separate the different concepts, or functions, of the program into separate blocks.

## Breaking Down Line by Line

### Concept 1: Printing the Prompt to the Screen

**Line 18:** `LDR r0, =prompt1`
Loads the memory address of the `prompt1` string into register 0 so that `printf` knows where to find it. The `=` tells the assembler to use the label's address. `prompt1` is an `.asciz` string: `"Please enter your age -> "`.

**Line 19:** `BL printf`
Branches and links to `printf`, a function defined outside of this file in the C library. `BL` stores the return address in the link register (`LR`), overwriting whatever was there before.

### Concept 2: Scanning the User Input

**Line 22:** `LDR r0, =format1`
Loads the memory address of the `format1` string into register 0 so that `scanf` knows where to find it. `format1` is an `.asciz` string: `"%s"`, which tells `scanf` what type of data to read from the user.

**Line 23:** `LDR r1, =age1`
Loads the memory address of `age1` into register 1 so that `scanf` knows where to store the input. `age1` is created with the `.space` directive, which reserves a specified number of uninitialized bytes in memory.

**Line 24:** `BL scanf`
Branches and links to `scanf`, a function defined outside of this file in the C library. `BL` stores the return address in `LR`, overwriting whatever was there before.

### Concept 3: Printing the Output to the Terminal

**Line 27:** `LDR r0, =output1`
Loads the memory address of the `output1` string into register 0 so that `printf` knows where to find it. The `output1` string contains the `%s` format specifier, which tells `printf` where to place the user's input.

**Line 28:** `LDR r1, =age1`
Loads the memory address of the user's input (previously stored in `age1`) into register 1.

**Line 29:** `BL printf`
Branches and links to `printf`, a function defined outside of this file in the C library. `BL` stores the return address in `LR`, overwriting whatever was there before.

## Assemble, Link, and Build

From inside the program's folder, run:

```bash
gcc quotedStringPrompt.s -g -o quotedStringPrompt
```

This one command does both steps:

- **Assemble** – turns the assembly code into machine code (an object file)
- **Link** – combines that object file with the C library so the calls to `printf` and `scanf` work, producing the executable

The flags:

- `-g` – includes debugging information, so the program can be stepped through in gdb
- `-o quotedStringPrompt` – names the executable `quotedStringPrompt` (without it, gcc names it `a.out`)

## Running the Program

From the same folder, run the program with `./<programName>`:

```bash
./quotedStringPrompt
```

`./` tells the shell to look for the program in the current folder.

Expected output:

```

```

