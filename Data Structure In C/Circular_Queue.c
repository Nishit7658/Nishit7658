#include <stdio.h>
#define SIZE 5

int queue[SIZE];
int front = 0, rear = -1;

// Enqueue (Insert element in queue)
void enqueue(int value) {
    if (rear == SIZE - 1) {
        printf("Queue is full\n");
    } else {
        rear++;
        queue[rear] = value;
        printf("%d inserted\n", value);
    }
}

// Dequeue (Remove element from queue)
void dequeue() {
    if (front > rear) {
        printf("Queue is empty\n");
    } else {
        printf("%d deleted\n", queue[front]);
        front++;
    }
}

// Display (Show queue elements)
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

    // Direct testing (no menu)
    enqueue(10);
    enqueue(20);
    enqueue(30);
    display();
    dequeue();
    display();
    enqueue(40);
    enqueue(50);
    enqueue(60); // This will show "Queue is full"
    display();

    return 0;
}
