#include "array_utils.h"

int main()
{
    int arr[] = {4, 2, 8, 0, 5, 7, 1, 3, 9};
    const int len = sizeof(arr) / sizeof(arr[0]);

    printArray(arr, len);

    reverseArray(arr, len);
    printArray(arr, len);

    bubbleSort(arr, len);
    printArray(arr, len);

    return 0;
}
