#include <stdio.h>

// Recursive function to solve Tower of Hanoi
void towerOfHanoi(int n, char source, char auxiliary, char destination) {
    if (n == 1) {
        printf("Move disk 1 from %c to %c\n", source, destination);
        return;
    }

    // Move n-1 disks from source to auxiliary
    towerOfHanoi(n - 1, source, destination, auxiliary);

    // Move the nth disk from source to destination
    printf("Move disk %d from %c to %c\n", n, source, destination);

    // Move n-1 disks from auxiliary to destination
    towerOfHanoi(n - 1, auxiliary, source, destination);
}

// Driver code
int main() {
    printf("Enrolment NO:- 240410107093\nName:- Nishit Panchal\n");
    int n;

    printf("Enter number of disks: ");
    scanf("%d", &n);

    printf("\nSteps to solve Tower of Hanoi:\n");
    towerOfHanoi(n, 'A', 'B', 'C');

    return 0;
}