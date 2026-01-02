// evaluate postfix using stack

#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

#define MAX 100

int stack[MAX];
int top = -1;

int push(int c);
int pop(void);
int performoperation(int op1, int op2, char opr);
int evaluatepostfix(char postfix[]);

int main(void)
{
    char postfix[MAX];
    printf("Postfix Expression: ");
    scanf("%s", postfix);

    int result = evaluatepostfix(postfix);
    printf("\nEvaluated postfix expression is = %d\n", result);
    
    return 0;
}

int push(int c)
{
    if (top < MAX - 1){
        stack[++top] = c;
        return 0;
    }
    else{
        printf("Stack overflow\n");
        return 1;
    }
}

int pop(void)
{
    if (top >= 0){
        return stack[top--];
    }
    else{
        printf("Stack underflow\n");
        return 0;
    }
}

int performoperation(int op1, int op2, char opr)
{
    switch (opr){
    case '+':
        return op1 + op2;
    case '-':
        return op1 - op2;
    case '*':
        return op1 * op2;
    case '/':
        return op1 / op2; // assume no division by zero
    case '^':
        return (int)pow(op1, op2);
    default:
        printf("Invalid operator: %c\n", opr);
        return 0;
    }
}

int evaluatepostfix(char postfix[])
{
    int i;
    char temp;

    for (i = 0; postfix[i] != '\0'; i++){
        temp = postfix[i];

        // If digit then push to stack
        if (isdigit(temp)){
            push(temp - '0');
        }
        else{
            int op2 = pop();
            int op1 = pop();
            int value = performoperation(op1, op2, temp);
            push(value);
        }
    }
    return pop();
} 