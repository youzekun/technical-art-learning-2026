#include <iostream>

void printArray(const int* arr, int len)
{
    // TODO 1：
    // 使用指针读取并输出全部数组元素。
    // 至少一次使用 *(arr + i)，不要在这里写死数组长度。
}

void reverseArray(int* arr, int len)
{
    // TODO 2：
    // 声明分别指向首元素和尾元素的两个指针。
    // 在两个指针相遇之前交换它们指向的数据。
}

int main()
{
    int values[] = {4, 2, 8, 0, 5, 7, 1, 3, 9};
    int len = sizeof(values) / sizeof(values[0]);

    std::cout << "Original array:\n";
    printArray(values, len);

    reverseArray(values, len);

    std::cout << "Reversed array:\n";
    printArray(values, len);

    return 0;
}
