#include <stdio.h>
#include <ctype.h>
#include <string.h>

char stack[50][10];
int top = -1, temp = 1;

void push(char *str) {
    strcpy(stack[++top], str);
}

char* pop() {
    return stack[top--];
}

int main() {
    char exp[50], symbol, op1[10], op2[10], tempVar[10];
    printf("Enter the postfix expression: ");
    scanf("%s", exp);

    for (int i = 0; i < strlen(exp); i++) {
        symbol = exp[i];
        if (isalnum(symbol)) {
            char str[2] = {symbol, '\0'};
            push(str);
        } else {
            strcpy(op2, pop());
            strcpy(op1, pop());
            sprintf(tempVar, "t%d", temp++);
            printf("%s = %s %c %s\n", tempVar, op1, symbol, op2);
            push(tempVar);
        }
    }
    printf("Final Result: %s\n", pop());
    return 0;
}
