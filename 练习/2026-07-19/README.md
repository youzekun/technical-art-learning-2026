# 2026-07-19 指针与数组独立练习

今天不重新观看第61—63节。双击[`PointerArrayPractice.sln`](./PointerArrayPractice.sln)，选择`Debug`和`x64`，完成源文件中的`TODO`后按`Ctrl + F5`运行。

## 必做

- [x] `printArray`使用指针读取数组元素。
- [x] `reverseArray`使用首尾指针逆置数组。
- [x] 函数内部不写死数组长度。
- [x] 程序编译成功并输出正确结果。
- [x] 保存源代码和运行截图。

## 口头自测

1. 数组传入函数后，为什么不能继续用`sizeof(arr) / sizeof(arr[0])`获得原数组长度？-因为arr变成了指针变量
2. `const int* arr`中的`const`限制了什么？-限制了数值
3. 当`arr`是`int*`时，`arr + 1`在内存地址上移动多少字节？为什么？-4个字节，是根据int的占有字节

验收结果：通过。

- 第1题核心正确；更完整地说，数组形参会被调整为指针，`sizeof(arr)`得到的是指针大小，不再是原数组总大小。
- 第2题核心正确；准确表述是不能通过`arr`修改所指向的整数，`arr`这个指针本身仍可以改变指向。
- 第3题在当前MSVC环境中正确；可移植的表述是移动`sizeof(int)`字节，当前环境的`sizeof(int)`为4。

证据：[Debug x64构建与运行记录](../../记录/evidence/2026-07-19/cpp_pointer_array_build_2026-07-19.txt)、[Visual Studio运行截图](../../记录/evidence/2026-07-19/cpp_pointer_array_visual_studio_run.png)。

## 加分项

只有必做全部通过且仍有时间时，再任选一项：

- 使用指针参数重写冒泡排序；
- 给`printArray`增加标题参数，但不要改变核心数组逻辑。

加分项未完成不影响今日验收。

已完成加分项：使用指针参数`int* arr`完成冒泡排序。函数名`bubArray`可以运行，后续建议命名为`bubbleSort`，输出标题使用`Sorted array`。
