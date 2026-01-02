#include <stdio.h>
#include <ctype.h>   // for isalpha and isdigit
#include <string.h>  // for strlen

#define SIZE 100

char stack[SIZE];
int top = -1;

// Stack operations
void push(char ch) {
    stack[++top] = ch;
}

char pop() {
    return stack[top--];
}

char peek() {
    return stack[top];
}

// Precedence rules
int precedence(char op) {
    if (op == '^') return 3;
    if (op == '*' || op == '/') return 2;
    if (op == '+' || op == '-') return 1;
    return 0;
}

// Main conversion function
void infixToPostfix(char* infix, char* postfix) {
    int i, j = 0;
    char ch;

    for (i = 0; infix[i] != '\0'; i++) {
        ch = infix[i];

        if (isalnum(ch)) {
            postfix[j++] = ch;  // Operand goes directly to output
        }
        else if (ch == '(') {
            push(ch);
        }
        else if (ch == ')') {
            while (top != -1 && peek() != '(')
                postfix[j++] = pop();
            pop(); // Remove '(' from stack
        }
        else { // Operator
            while (top != -1 && precedence(peek()) >= precedence(ch))
                postfix[j++] = pop();
            push(ch);
        }
    }

    // Pop remaining operators
    while (top != -1)
        postfix[j++] = pop();

    postfix[j] = '\0'; // Null-terminate the postfix string
}

// Driver code
int main() {
    printf("Enrolment NO:- 240410107093\nName:- Nishit Panchal\n");
    char infix[SIZE], postfix[SIZE];

    printf("Enter infix expression: ");
    scanf("%s", infix);

    infixToPostfix(infix, postfix);

    printf("Postfix expression: %s\n", postfix);

    return 0;
}