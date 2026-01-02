#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* prev;
    struct Node* next;
};

struct Node* head = NULL;

// (a) Insert at front
void insertFront(int value) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->prev = NULL;
    newNode->next = head;

    if (head != NULL)
        head->prev = newNode;

    head = newNode;
}

// (b) Insert at end
void insertEnd(int value) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->next = NULL;

    if (head == NULL) {
        newNode->prev = NULL;
        head = newNode;
        return;
    }

    struct Node* temp = head;
    for (; temp->next != NULL; temp = temp->next);

    temp->next = newNode;
    newNode->prev = temp;
}

// (c) Delete last node
void deleteLast() {
    if (head == NULL) return;

    if (head->next == NULL) {
        free(head);
        head = NULL;
        return;
    }

    struct Node* temp = head;
    for (; temp->next != NULL; temp = temp->next);

    temp->prev->next = NULL;
    free(temp);
}

// (d) Delete node before specified position (1-based index)
void deleteBeforePosition(int pos) {
    if (head == NULL || pos <= 1) return;

    struct Node* temp = head;
    for (int i = 1; i < pos - 1 && temp != NULL; i++)
        temp = temp->next;

    if (temp == NULL || temp->prev == NULL) return;

    struct Node* delNode = temp->prev;

    if (delNode->prev != NULL)
        delNode->prev->next = temp;
    else
        head = temp;

    temp->prev = delNode->prev;
    free(delNode);
}

// Display list
void display() {
    struct Node* temp = head;
    printf("Doubly Linked List: ");
    for (; temp != NULL; temp = temp->next)
        printf("%d <-> ", temp->data);
    printf("NULL\n");
}

// Main function with example usage
int main() {

    printf("Enrolment NO:- 240410107093\nName:- Nishit Panchal\n");
    
    insertFront(30);
    insertFront(20);
    insertFront(10);
    printf("After inserting at front:\n");
    display();

    insertEnd(40);
    insertEnd(50);
    printf("After inserting at end:\n");
    display();

    deleteLast();
    printf("After deleting last node:\n");
    display();

    deleteBeforePosition(3);
    printf("After deleting node before position 3:\n");
    display();

    return 0;
}