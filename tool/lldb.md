# lldb

[文档](https://lldb.llvm.org/)

Mac 上的 C C++ Objective-C 的调试器

编译 `gcc -g test.c -o test`

`lldb test`

```
b: Adding breakpoints
run: Running the file in debug mode
br: Deleting breakpoints
p: Showing variables
frame variable: Show all arguments and local variables
expr x = 4: Modifying variables
f: Display current line
bt: backtrace
next or n: Steps to the next line.
step or s: Steps into current’s line function.
continue or c: Continue until the next breakpoint.
finish: Finishes executing the current function and then pauses.
```