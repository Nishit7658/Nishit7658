#include <stdio.h>

void passByValue(int valueInFunction) {
    printf("Inside passByValue: valueInFunction = %d\n", valueInFunction);
        valueInFunction = valueInFunction + 10;
            printf("Inside passByValue after change: valueInFunction = %d\n", valueInFunction);
            }

            void passByReference(int *pointerToValue) {
                printf("Inside passByReference: *pointerToValue = %d\n", *pointerToValue);
                    *pointerToValue = *pointerToValue + 10; 
                        printf("Inside passByReference after change: *pointerToValue = %d\n", *pointerToValue);
                        }

                        int main() {
                            int valueForPassByValue = 5;
                                int valueForPassByReference = 5;

                                    printf("=== Pass by Value Example ===\n");
                                        printf("Before function call: valueForPassByValue = %d\n", valueForPassByValue);
                                            passByValue(valueForPassByValue);
                                                printf("After function call: valueForPassByValue = %d\n\n", valueForPassByValue);

                                                    printf("=== Pass by Reference Example ===\n");
                                                        printf("Before function call: valueForPassByReference = %d\n", valueForPassByReference);
                                                            passByReference(&valueForPassByReference);
                                                                printf("After function call: valueForPassByReference = %d\n", valueForPassByReference);

                                                                    return 0;
                                                                    }
                                                                    