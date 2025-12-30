#include <stdio.h>
#include <ctype.h>   // for isdigit
#include <stdlib.h>  // for atoi

#define SIZE 100

int stack[SIZE];
int top = -1;

// Stack operations
void push(int value) {
    stack[++top] = value;
}

int pop() {
    return stack[top--];
}

// Main evaluation function
int evaluatePostfix(char* expr) {
    int i, op1, op2, result;

    for (i = 0; expr[i] != '\0'; i++) {
        char ch = expr[i];

        if (isdigit(ch)) {
            push(ch - '0');  // Convert char digit to int
        }
        else {
            op2 = pop();
            op1 = pop();

            switch (ch) {
                case '+': result = op1 + op2; break;
                case '-': result = op1 - op2; break;
                case '*': result = op1 * op2; break;
                case '/': result = op1 / op2; break;
                default:
                    printf("Invalid operator: %c\n", ch);
                    return -1;
            }

            push(result);
        }
    }

    return pop();  // Final result
}

// Driver code
int main() {
    printf("Enrolment NO:- 240410107093\nName:- Nishit Panchal\n");
    char postfix[SIZE];

    printf("Enter postfix expression (e.g., 23*5+): ");
    scanf("%s", postfix);

    int result = evaluatePostfix(postfix);
    printf("Result: %d\n", result);

    return 0;
}