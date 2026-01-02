#include <stdio.h>
#define MAX 5

int stack[MAX], top = -1;

void push(int x){
    if(top == MAX-1)
        printf("Stack Overflow\n");
    else
        stack[++top] = x;
}

void pop(){
    if(top == -1)
        printf("Stack Underflow\n");
    else
        printf("Popped = %d\n", stack[top--]);
}

void display(){
    for(int i = top; i >= 0; i--)
        printf("%d ", stack[i]);
}

int main(){
    push(10);
    push(20);
    pop();
    display();
    return 0;
}
