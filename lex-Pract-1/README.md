# 🚀 Lex Scanner Setup & Usage Guide

## 📘 What is Lex?

Lex (or Flex, its modern counterpart) is a lexical analyzer generator used in compiler design. It processes a source file containing patterns and actions, then generates a C program (`lex.yy.c`) that recognizes lexical tokens.

Typical use cases include:
- Tokenizing input for parsers
- Highlighting syntax
- Validating input formats

## ⚙️ Setup Instructions (Linux)

To get started with Lex/Flex on a Debian-based Linux system:

### 1. Install Flex (Lex equivalent)
```bash
$ sudo apt-get install flex bison build-essential
$ lex <file_name>.l
$ cc lex.yy.c
$ ./a.out
```
