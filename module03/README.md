<!--Break Down of HelloWorld.s File -->
# Break Down of "helloWorld.s" File

This is the classic Hello World file that prints the string "Hello World" to the terminal in ARM assembly.
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
Line 8: `SUB sp, sp, #4`
- It can be read as: "Subtract(SUB) the immediate value of 4 from the <u>S</u>tack <u>P</u>ointer and place the solution into the S<u>tack P</u>ointer"


Line 9: `STR lr, [sp]`
- Store(STR) the value in the link register into memory at the address in the stack pointer 

Lines 8 + 9 together push LR onto the stack.

Line 11: `LDR r0, =helloWorld`
- Load into register 0 the memory address of the helloWorld string, so printf knows where to find it. The = tells the assembler to use the label’s address. helloWorld is an .asciz string (a string ending in a zero byte): “Hello World - the test works!\n

Line 12: `BL printf`
- Branch and link to a function found outside of the file known as printf. BL overwrite the LR, which is why line 8 and 9 save LR first 

Line 14; `LDR lr, [sp]`
- Load into the link register the value stored at the address in the stack pointer (the return address we saved earlier). Lines 14 + 15 together pop LR off the stack.

Line 15 `ADD sp, sp, #4`
- ADD the immediate value of 4 back to the stack pointer. Returning the memory carved out in the beginning

Line 16 `MOV pc, lr`
- Move the value in the link register into the program counter, which jumps back to whoever called main.

## Assemble, Link, and Build
From inside the program's folder, run:

```bash
gcc helloWorld.s -g -o helloWorld
```

This one command does both steps:
* **Assemble** – turns the assembly code into machine code (an object file)
* **Link** – combines that object file with the C library so the call to `printf` works, producing the executable

The flags:
* `-g` – includes debugging information, so the program can be stepped through in gdb
* `-o helloWorld` – names the executable `helloWorld` (without it, gcc names it `a.out`)

## Running the Program
From the same folder, run the program with `./<program_name>`:

```bash
./helloWorld
```

`./` tells the shell to look for the program in the current folder.

Expected output:

```
Hello World - the test works!
```

<img width="1680" height="1050" alt="ARM Assembly HelloWorld Running" src="https://github.com/user-attachments/assets/103921d7-0b8c-4162-be4b-e557e878e55e" />
