#include "array_utils.h"

#include <iostream>

void printArray(const int* arr, int len)
{
    std::cout << "Array is:\n";

    for (int i = 0; i < len; ++i)
    {
        std::cout << arr[i] << ' ';
    }

    std::cout << '\n';
}
void reverseArray(int* arr, int len)
{
    int start = 0;
    int end = len - 1;

    while (start < end)
    {
        const int temp = arr[start];
        arr[start] = arr[end];
        arr[end] = temp;
        ++start;
        --end;
    }
}

void bubbleSort(int* arr, int len)
{
    for (int i = 0; i < len - 1; ++i)
    {
        for (int j = 0; j < len - i - 1; ++j)
        {
            if (arr[j] > arr[j + 1])
            {
                const int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}
