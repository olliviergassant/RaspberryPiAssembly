# ARM Assembly on the Raspberry Pi
### Learning how computers actually work, one instruction at a time

Most of my programming has been in high-level languages, where a single line can hide hundreds of machine instructions. This repo is where I took that abstraction away. For my Computer Organization course, I write ARM assembly directly on a Raspberry Pi, and I use this repo to document not only *what* each program does but *how I reasoned through it*: the bugs, the dead ends, and the moments where something about the hardware finally clicked.

---

## Why This Repo Exists

I wanted a record of my growth, not just a folder of finished assignments. Each project includes my approach, the problems I ran into, and what I'd do differently now. Reading top to bottom, you should be able to watch my understanding move from "how do I print a number?" toward thinking like the processor does.

## What I'm Building Toward

- **Thinking at the hardware level:** registers, memory addressing, the stack, and how high-level constructs (loops, conditionals, functions) actually compile down
- **Debugging without safety nets:** no exceptions, no stack traces, just registers, memory, and `gdb`
- **Writing efficient code on purpose:** understanding why one instruction sequence is faster or smaller than another

---

## Projects

| # | Project | Core Concepts | What It Taught Me |
|---|---------|---------------|-------------------|
| 1 | [helloWorld](./module03) | e.g. registers, `mov`, system calls | Memory management and printf function |
| 2 | [prompyUserAge](./module04) | e.g. registers, scanf, printf | User input, and data storage |
| 3 | [quotedStringPrompt](./module04) | e.g. registers, scanf, printf | User input, and string formatiing |
| 4 | [readFloatingPointValue](./module04) | e.g. memory, floating values | Dealing with floating point values in Assembly |
| 5 | [stringWithTabCharacters](./module04) | e.g. memory, scanf, formatting | Formatting user input string with quotations |


---

## Engineering Log

Each entry follows the same structure: the problem, how I approached it, what broke, and what I learned.

### Project 1: [Name]
**The problem:** What the program needed to do, in a sentence or two.

**My approach:** How I planned it before writing code (pseudocode, a C version first, sketching register usage on paper, etc.).

**What went wrong:** The most interesting bug or misunderstanding, and how I tracked it down.

**What clicked:** The concept I understand now that I didn't before.

> *Looking back:* What I'd change with what I know now.


## Reflections on Growth
<!-- This is a comment    
*Fill this in as the semester goes. A few prompts:*

- What did assembly teach me about the languages I already knew?
- What was the hardest mental shift, and how did I get past it?
- How has my debugging process changed since the first assignment?
-->
---

## Environment & Tools

- **Hardware:** Raspberry Pi
- **Architecture:** ARM [32-bit / AArch64]
- **Assembler / Linker:** GNU `as` and `ld` (or `gcc`)
- **Debugger:** `gdb`
- **Editor:** VIM

## Running a Program

```bash
gcc HelloWorld.s -c -o HelloWorld 
./HelloWorld
```

---

## About Me

I'm Ollivier, a Masters computer science student at Johns Hopkins. I'm drawn to understanding what happens beneath the abstractions I use every day.
