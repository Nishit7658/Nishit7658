#include <stdio.h>
#define SIZE 5

int queue[SIZE];
int front = 0, rear = -1;

// Enqueue
void enqueue(int value) {
    if (rear == SIZE - 1) {
        printf("Queue is full\n");
    } else {
        rear++;
        queue[rear] = value;
        printf("%d inserted\n", value);
    }
}

// Dequeue
void dequeue() {
    if (front > rear) {
        printf("Queue is empty\n");
    } else {
        printf("%d deleted\n", queue[front]);
        front++;
    }
}

// Display
void display() {
    if (front > rear) {
        printf("Queue is empty\n");
    } else {
        printf("Queue: ");
        for (int i = front; i <= rear; i++) {
            printf("%d ", queue[i]);
        }
        printf("\n");
    }
}

int main() {
    printf("Enrolment NO:- 240410107093\nName:- Nishit Panchal\n");
    enqueue(10);
    enqueue(20);
    enqueue(30);
    display();
    dequeue();
    display();
    return 0;
}
