#include <stdio.h>
#include <stdlib.h>

#define MAX 10

// Stack array and top pointer
int stk[MAX];
int top = -1;

// Check if stack is empty
int isEmpty() {
    return top == -1;
}

// Check if stack is full
int isFull() {
    return top == MAX - 1;
}

// Push operation
void push(int val) {
    if (isFull()) {
        printf("Overflow! Cannot push %d\n", val);
    } else {
        stk[++top] = val;
        printf("%d pushed\n", val);
    }
}

// Pop operation
int pop() {
    if (isEmpty()) {
        printf("Underflow! Cannot pop\n");
        return -1;
    } else {
        int popVal = stk[top--];
        printf("%d popped\n", popVal);
        return popVal;
    }
}

// Peep operation (view top element)
int peep() {
    if (isEmpty()) {
        printf("Stack is empty, cannot peep\n");
        return -1;
    } else {
        return stk[top];
    }
}

// Display all stack elements
void display() {
    if (isEmpty()) {
        printf("Stack is empty\n");
    } else {
        printf("Stack elements: ");
        for (int i = 0; i <= top; i++) {
            printf("%d ", stk[i]);
        }
        printf("\n");
    }
}

// Main function to demonstrate operations
int main() {
    printf("Enrolment NO:- 240410107093\nName:- Nishit Panchal\n");
    push(10);
    push(20);
    push(30);
    display();

    pop();
    display();

    printf("Top element (Peep): %d\n", peep());

    push(40);
    push(50);
    push(60);
    push(70);
    push(80);
    push(90);
    push(100); // Stack is now full

    push(110); // Will trigger overflow
    display();

    printf("Top element (Peep): %d\n", peep());

    return 0;
}