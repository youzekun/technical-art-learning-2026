#include <iostream>
using namespace std;
int main()
{
    int a = 10;

    // TODO 1：声明一个指向a的整型指针p。
    int* p;
    p = &a;
    // TODO 2：依次输出a、&a、p和*p。
    cout << a << endl;
    cout << &a << endl;
    cout << p << endl;
    cout << *p << endl;
    // TODO 3：只通过p把a修改为20，然后输出a。
    *p = 20;
    cout << a << endl;
    // TODO 4：输出sizeof(p)，并在下方注释中解释这个大小代表什么。

    int* nullPointer = nullptr;
    std::cout << "nullPointer = " << nullPointer << '\n';

    // TODO 5：解释为什么不能解引用nullPointer。不要真的执行非法解引用。

    int first = 1;
    int second = 2;

    // TODO 6：分别声明下面三种指针，并通过合法的赋值验证自己的判断。
    // A. 指向常量的指针
    // B. 常量指针
    // C. 指向常量的常量指针

    // TODO 7：在注释中写明A、B、C能否修改数据、能否改为指向second。

    return 0;
}
