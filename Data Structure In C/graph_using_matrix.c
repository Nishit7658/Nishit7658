#include <stdio.h>
#include <stdlib.h>

#define MAX 10

// Adjacency Matrix
int adjMatrix[MAX][MAX];

// Adjacency List
struct Node {
    int vertex;
    struct Node* next;
};

struct Node* adjList[MAX];

int main() {

    printf("Enrolment NO:- 240410107093\nName:- Nishit Panchal\n");
    
    int vertices = 4;
    int edges = 3;
    int u, v;

    // Initialize matrix and list
    for (int i = 0; i < vertices; i++) {
        for (int j = 0; j < vertices; j++)
            adjMatrix[i][j] = 0;
        adjList[i] = NULL;
    }

    // Example edges
    int edgeData[3][2] = {{0, 1}, {0, 2}, {1, 3}};

    for (int i = 0; i < edges; i++) {
        u = edgeData[i][0];
        v = edgeData[i][1];

        // Matrix
        adjMatrix[u][v] = 1;
        adjMatrix[v][u] = 1;

        // List
        struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
        newNode->vertex = v;
        newNode->next = adjList[u];
        adjList[u] = newNode;

        newNode = (struct Node*)malloc(sizeof(struct Node));
        newNode->vertex = u;
        newNode->next = adjList[v];
        adjList[v] = newNode;
    }

    // Display Matrix
    printf("Adjacency Matrix:\n");
    for (int i = 0; i < vertices; i++) {
        for (int j = 0; j < vertices; j++)
            printf("%d ", adjMatrix[i][j]);
        printf("\n");
    }

    // Display List
    printf("\nAdjacency List:\n");
    for (int i = 0; i < vertices; i++) {
        printf("Vertex %d: ", i);
        struct Node* temp = adjList[i];
        for (; temp != NULL; temp = temp->next)
            printf("-> %d ", temp->vertex);
        printf("\n");
    }

    return 0;
}