# 🧪 Compiler Construction – Test Cases (Lex & Yacc)
# 🛠️ Install Flex and Bison

To set up the environment for Lex and Yacc development, install the required packages:

```shell
$ sudo apt-get install flex bison build-essential vim
```

---

# 📄 Lex Workflow

Use Lex to generate a lexical analyzer:

```shell
$ vim <file_name>.l
-> esc
-> :wq
$ lex <file_name>.l         # Generate lex.yy.c from the .l file
$ cc lex.yy.c -ll           # Compile the lexer with the lex library
$ ./a.out                   # Run the compiled lexer
```

---

# 📄 Yacc Workflow

Use Yacc (via Bison) to generate a parser and integrate it with Lex:

```shell
$ vim <file_name>.l
-> esc
-> :wq
$ lex <file_name>.l         # Generate lexer code
$ yacc -d <file_name>.y     # Generate parser code and header file
$ gcc y.tab.c lex.yy.c -lfl  # Compile both lexer and parser
$ ./a.out                   # Run the combined program

This document contains all **test cases (TC)** for the Lex and Lex + Yacc practicals implemented in the **CompilerCon** project.  
Use each block as input when running the corresponding practical. Press **Ctrl + D** after entering the input in terminal.

---

# 🧮 Practical 2 – Count Keywords, Identifiers, Comments, Words, Spaces & Lines
```c
// This is a comment
int main() {
    int a = 10;
    float b = 20.5;
    a = a + 1;
    if (a > 10) {
        b = b + 1;
    }
    return 0;
}
## Practical 3 – Count Words Starting with ‘A’ or ‘a’
Apples are Amazing and Avocados are awesome.
Bananas are good too but Apricots are my favorite.

##Practical 4 – Convert Lowercase ↔ Uppercase
Hello Abbas Jabalpurwala!
LEX and yacc are Fun!


##Practical 5 – Decimal → Hexadecimal (Manual Logic)
10
255
4096
0


##Practical 6 – Detect Lines Ending with “com”
www.google.com
hello.com
openai.org
facebook.com
randomtext


Practical 7 – Postfix Expression Evaluation (Lex + Yacc)
2 3 1 * + 9 -


Practical 8 – Desk Calculator with Error Recovery (Lex + Yacc)
2+3*4
(5+3)*2
10/0
2++


##Practical 9 – Parser for FOR Loop Statement (Lex + Yacc)
for(i=0;i<10;i++){x;}
for(i=0;i<10){x;}


Practical 10 – Intermediate Code Generator (ICG) (Lex + Yacc)
(a+b)*c
a+b*c






