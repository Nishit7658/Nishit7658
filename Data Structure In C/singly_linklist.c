#include <stdio.h>
#include <stdlib.h>

struct Node {
    int info;
    struct Node* next;
};

struct Node* head = NULL;

// Insert at front
void insertFront(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->info = data;
    newNode->next = head;
    head = newNode;
}

// Insert at end
void insertEnd(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->info = data;
    newNode->next = NULL;

    if (head == NULL) {
        head = newNode;
        return;
    }

    struct Node* temp = head;
    while (temp->next != NULL)
        temp = temp->next;
    temp->next = newNode;
}

// Insert in ascending order
void insertSorted(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->info = data;
    newNode->next = NULL;

    if (head == NULL || head->info >= data) {
        newNode->next = head;
        head = newNode;
        return;
    }

    struct Node* temp = head;
    while (temp->next != NULL && temp->next->info < data)
        temp = temp->next;

    newNode->next = temp->next;
    temp->next = newNode;
}

// Delete first node
void deleteFirst() {
    if (head == NULL) return;
    struct Node* temp = head;
    head = head->next;
    free(temp);
}

// Delete by value
void deleteByValue(int value) {
    if (head == NULL) return;

    if (head->info == value) {
        struct Node* temp = head;
        head = head->next;
        free(temp);
        return;
    }

    struct Node* temp = head;
    while (temp->next != NULL && temp->next->info != value)
        temp = temp->next;

    if (temp->next == NULL) return;

    struct Node* delNode = temp->next;
    temp->next = delNode->next;
    free(delNode);
}

// Delete after position
void deleteAfterPosition(int pos) {
    struct Node* temp = head;
    int i = 0;
    while (i < pos && temp != NULL) {
        temp = temp->next;
        i++;
    }

    if (temp == NULL || temp->next == NULL) return;

    struct Node* delNode = temp->next;
    temp->next = delNode->next;
    free(delNode);
}

// Display list
void display() {
    struct Node* temp = head;
    while (temp != NULL) {
        printf("%d -> ", temp->info);
        temp = temp->next;
    }
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

    insertSorted(25);
    insertSorted(5);
    insertSorted(45);
    printf("After inserting in sorted order:\n");
    display();

    deleteFirst();
    printf("After deleting first node:\n");
    display();

    deleteByValue(25);
    printf("After deleting node with value 25:\n");
    display();

    deleteAfterPosition(2);
    printf("After deleting node after position 2:\n");
    display();

    return 0;
}