#include <iostream>
using namespace std;
int main()
{
    int a = 10;

    // 1. 声明一个指向a的整型指针p。
    int* p;
    p = &a;
    // 2. 依次输出a、&a、p和*p。
    cout << a << endl;
    cout << &a << endl;
    cout << p << endl;
    cout << *p << endl;
    // 3. 只通过p把a修改为20，然后输出a。
    *p = 20;
    cout << a << endl;
    // 4. 输出sizeof(p)。
    cout << sizeof(p) << endl;
    // sizeof(p)表示指针本身占用的字节数，当前x64程序中为8字节。
    int* nullPointer = nullptr;
    cout << "nullPointer = " << nullPointer << '\n';

    // 5. 空指针不指向有效对象，解引用会产生未定义行为，通常导致访问冲突。
    int first = 1;
    int second = 2;

    // 6. 分别声明下面三种指针，并通过合法的赋值验证。
    // A. 指向常量的指针
    // B. 常量指针
    // C. 指向常量的常量指针
    // A. 指向常量的指针
    const int* point1 = &first;
    point1 = &second;
    // *point1 = 30;  // 不允许通过point1修改数据

    // B. 常量指针
    int* const point2 = &first;
    *point2 = 30;
    // point2 = &second;  // 不允许改变point2的指向

    // C. 指向常量的常量指针
    const int* const point3 = &first;
    cout << *point3 << endl;
    // *point3 = 30;       // 不允许修改数据
    // point3 = &second;   // 不允许改变指向

    // 7. A不能通过point1修改数据，可以改为指向second。
    //    B可以通过point2修改数据，不可以改为指向second。
    //    C不可以修改数据，也不可以改为指向second。
    return 0;
}
