#include <stdio.h>
#include <stdlib.h>

// Node structure
struct Node {
    int data;
    struct Node* left;
    struct Node* right;
};

// Create new node
struct Node* createNode(int value) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->left = newNode->right = NULL;
    return newNode;
}

// Insert into BST
struct Node* insert(struct Node* root, int value) {
    if (root == NULL)
        return createNode(value);

    if (value < root->data)
        root->left = insert(root->left, value);
    else if (value > root->data)
        root->right = insert(root->right, value);

    return root;
}

// Search in BST
struct Node* search(struct Node* root, int key) {
    for (; root != NULL;) {
        if (key == root->data)
            return root;
        else if (key < root->data)
            root = root->left;
        else
            root = root->right;
    }
    return NULL;
}

// Inorder traversal
void inorder(struct Node* root) {
    if (root != NULL) {
        inorder(root->left);
        printf("%d ", root->data);
        inorder(root->right);
    }
}

// Main function with example usage
int main() {

    printf("Enrolment NO:- 240410107093\nName:- Nishit Panchal\n");
    
    struct Node* root = NULL;

    // Insert nodes
    root = insert(root, 50);
    insert(root, 30);
    insert(root, 70);
    insert(root, 20);
    insert(root, 40);
    insert(root, 60);
    insert(root, 80);

    printf("Inorder Traversal of BST:\n");
    inorder(root);
    printf("\n");

    // Search for a value
    int key = 60;
    struct Node* found = search(root, key);
    if (found != NULL)
        printf("Element %d found in BST.\n", key);
    else
        printf("Element %d not found in BST.\n", key);

    return 0;
}