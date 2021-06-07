# nasm exercises

This repository contains miscellaneous Assembly programs I wrote for learning
Assembly that can be assembled using [NASM].

> All programs found in this repository are specific to Linux (maybe they can
> also work in MacOS, but I can't test it) and the x86_64 architecture.

## Directories structure

- `src/` - The Assembly programs source files.
- `bin/` - Where the assembled and linked programs will reside.

## Building

### Requirements

1. As you can see above, you need a Unix system (e.g. Linux) to run these ASM
    programs.

2. Since the programs needs [NASM] you will need to install it. You can find
    installation instructions in the homepage.

3. GCC Compiler tools (for `ld`).

---

Once you have all the requirements, you can proceed to assemble the programs.

```bash
# Example, for building and running hello world program

# -f    Output file format, elf64: Linux x86_64
# -g    Generate debugging information
# -F    Debugging format (output format dependent)
nasm -f elf64 -g -F DWARF ./src/hello.asm

# -e    Set start address
# -o    Set output file name
ld -e main -o ./bin/hello ./src/hello.o

./bin/hello
```

> **NOTE:** this example will change in the future.

## Resources

The resources and tutorials I'm using to learn Assembly.

- [NASM Documentation](https://www.nasm.us/xdoc/2.15.05/html/nasmdoc0.html)
- [TutorialsPoint](https://www.tutorialspoint.com/assembly_programming/index.htm)
- [ASM Tutor](https://asmtutor.com/)

### X64

- [HJLebbink/asm-dude/wiki](https://github.com/HJLebbink/asm-dude/wiki)
- [cs.tufts.edu/comp/40/docs/x64_cheatsheet](https://www.cs.tufts.edu/comp/40/docs/x64_cheatsheet.pdf)
- [NASM x86_64 Tutorial](https://cs.lmu.edu/~ray/notes/nasmtutorial/)

---

## License

All the programs found in this repository are licensed under [MIT](./LICENSE)
license.

[NASM]: https://nasm.us
