#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* next;
};

struct Node* head = NULL;

// (a) Insert at end
void insertEnd(int value) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->next = NULL;

    if (head == NULL) {
        head = newNode;
        newNode->next = head;
        return;
    }

    struct Node* temp = head;
    while (temp->next != head)
        temp = temp->next;

    temp->next = newNode;
    newNode->next = head;
}

// (b) Insert before specified position (1-based index)
void insertBeforePosition(int pos, int value) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = value;

    if (pos <= 1 || head == NULL) {
        // Insert at beginning
        if (head == NULL) {
            head = newNode;
            newNode->next = head;
        } else {
            struct Node* temp = head;
            while (temp->next != head)
                temp = temp->next;
            newNode->next = head;
            temp->next = newNode;
            head = newNode;
        }
        return;
    }

    struct Node* temp = head;
    int i = 1;
    while (i < pos - 1 && temp->next != head) {
        temp = temp->next;
        i++;
    }

    newNode->next = temp->next;
    temp->next = newNode;
}

// (c) Delete first node
void deleteFirst() {
    if (head == NULL) return;

    if (head->next == head) {
        free(head);
        head = NULL;
        return;
    }

    struct Node* temp = head;
    struct Node* last = head;

    while (last->next != head)
        last = last->next;

    head = head->next;
    last->next = head;
    free(temp);
}

// (d) Delete node after specified position (1-based index)
void deleteAfterPosition(int pos) {
    if (head == NULL) return;

    struct Node* temp = head;
    int i = 1;

    while (i < pos && temp->next != head) {
        temp = temp->next;
        i++;
    }

    struct Node* del = temp->next;
    if (del == head) {
        deleteFirst();
        return;
    }

    temp->next = del->next;
    free(del);
}

// Display circular list
void display() {
    if (head == NULL) {
        printf("List is empty.\n");
        return;
    }

    struct Node* temp = head;
    printf("Circular List: ");
    do {
        printf("%d -> ", temp->data);
        temp = temp->next;
    } while (temp != head);
    printf("(back to head)\n");
}

// Main function with example usage
int main() {

    printf("Enrolment NO:- 240410107093\nName:- Nishit Panchal\n");
    
    insertEnd(10);
    insertEnd(20);
    insertEnd(30);
    insertEnd(40);
    printf("After inserting at end:\n");
    display();

    insertBeforePosition(2, 15);
    insertBeforePosition(1, 5);
    printf("After inserting before positions 2 and 1:\n");
    display();

    deleteFirst();
    printf("After deleting first node:\n");
    display();

    deleteAfterPosition(2);
    printf("After deleting node after position 2:\n");
    display();

    return 0;
}