#include <iostream>
using namespace std;
void printArray(const int* arr, int len)
{
    // TODO 1：
    // 使用指针读取并输出全部数组元素。
    // 至少一次使用 *(arr + i)，不要在这里写死数组长度。
    for (int i = 0;i < len;i++)
    {
        cout << *(arr+i) << " ";
    }
    cout << endl;
}

void reverseArray(int* arr, int len)
{
    // TODO 2：
    // 声明分别指向首元素和尾元素的两个指针。
    // 在两个指针相遇之前交换它们指向的数据。
    int * start = arr;
    int * end = arr+len-1;
    while (start < end)
    {
        int temp = *start;
        *start = *end;
        *end = temp;
        start++;
        end--;
    }
}
void bubArray(int* arr, int len)
{
    for (int i = 0;i < len - 1;i++)
    {
        for (int j = 0;j < len - i - 1;j++)
        {
            if (arr[j] > arr[j + 1])
            {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
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

    bubArray(values, len);
    cout << "Bub array:\n";
    printArray(values, len);

    return 0;
}
