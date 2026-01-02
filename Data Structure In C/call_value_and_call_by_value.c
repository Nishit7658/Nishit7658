#include <stdio.h>

// Call by value
void exchangeValue(int p, int q) {
    int temp = p;
    p = q;
    q = temp;
    printf("\nInside exchangeValue (Call by Value):\n");
    printf("p = %d, q = %d\n", p, q);
}

// Call by reference
void exchangeReference(int *p, int *q) {
    int temp = *p;
    *p = *q;
    *q = temp;
    printf("\nInside exchangeReference (Call by Reference):\n");
    printf("*p = %d, *q = %d\n", *p, *q);
}

int main() {
    printf("Enrolment NO:- 240410107093\nName:- Nishit Panchal\n");
    int first = 10;
    int second = 20;

    printf("Before exchange:\n");
    printf("first = %d, second = %d\n", first, second);

    // Call by value
    exchangeValue(first, second);

    printf("\nAfter exchangeValue:\n");
    printf("first = %d, second = %d\n", first, second); // No change

    // Call by reference
    exchangeReference(&first, &second);

    printf("\nAfter exchangeReference:\n");
    printf("first = %d, second = %d\n", first, second); // Values swapped

    return 0;
}