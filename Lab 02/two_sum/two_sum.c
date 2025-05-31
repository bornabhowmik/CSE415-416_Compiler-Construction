#include <stdio.h>

int main() {
    int a, b;
    printf("Enter two numbers to sum: ");
    scanf("%d %d", &a, &b);

    int sum = a + b;
    printf("Sum = %d\n", sum);

    return 0;
}
