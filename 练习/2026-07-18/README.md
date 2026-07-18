# 2026-07-18 启动日练习包

本练习包用于验证黑马 C++ 第56—60节和第一个 UE5 传统材质。它不是额外作业，已经包含在启动日5小时计划内。

## 使用顺序

1. 先观看对应课程并跟做。
2. 关闭课程，打开 [`pointer_practice.cpp`](./pointer_practice.cpp) 完成所有 `TODO`。
3. 编译运行并保存源代码与控制台输出。
4. 不看代码回答本文件中的自测问题。
5. 在 UE 中完成材质观察表，把结果写入当日日报。

如果当日时间不足，只完成“必做”，不要加倍补课。

## 在Visual Studio中打开与运行

直接双击[`PointerPractice.sln`](./PointerPractice.sln)打开完整项目，不要只单独打开`.cpp`文件。

打开后：

1. 等待Visual Studio加载项目。
2. 确认顶部配置为`Debug`和`x64`。
3. 按`Ctrl + F5`编译并运行。

编译输出位于`Binaries/Debug/`，中间文件位于`Intermediate/Debug/`；这两个目录不会提交到Git。

## A. 指针练习

### 必做

- [x] 让指针 `p`指向变量`a`。
- [x] 输出`a`、`&a`、`p`、`*p`。
- [x] 只通过`p`把`a`改成20，再输出`a`。
- [x] 输出`sizeof(p)`，说明它代表什么。
- [x] 创建值为`nullptr`的空指针，但绝不解引用它。
- [x] 分别写出“指向常量的指针”“常量指针”“指向常量的常量指针”。
- [x] 在注释里写明每种形式允许修改指向、修改数据，还是都不允许。

### 通过条件

- 程序无编译错误并正常退出。
- `p`与`&a`打印出的地址相同。
- 通过`*p`赋值后，`a`确实变成20。
- 能解释指针大小由运行平台决定，不等于它所指向数据的大小。
- 没有解引用空指针、未初始化指针或已经失效的指针。

### 口头自测

1. `int a = 10;`创建了什么？
2. `&a`得到的是什么？
3. `p`自己保存的是什么？
4. `*p`为什么能够访问和修改`a`？
5. `nullptr`表示什么？为什么不能写`*nullPointer`？
6. `const`写在星号左边和右边，分别限制什么？
7. 野指针与空指针有什么区别？

答不上来的问题只回看对应小节，不重新观看全部五节。

## B. 第一个 UE5 材质

只使用传统材质系统，创建`M_FirstMaterial`并应用到一个球体。

### 必做

- [ ] 在编辑器中指出 Viewport、World Outliner、Details、Content Browser。
- [ ] 调整球体的 Location、Rotation、Scale。
- [ ] 找到 Base Color、Metallic、Roughness、Normal、Emissive Color 输入。
- [ ] 保存材质节点图与球体最终效果截图。

### 参数观察

在同一灯光、相机和球体上修改参数并记录观察，不要求今天创建 Material Instance。

| 测试 | Base Color | Metallic | Roughness | 自己观察到的变化 |
|---|---|---:|---:|---|
| A | 任意非黑色 | 0 | 0 | |
| B | 与A相同 | 0 | 1 | |
| C | 与A相同 | 1 | 0 | |
| D | 与A相同 | 1 | 1 | |

需要能够用自己的话说明：

- Roughness 从0变到1时，高光范围和清晰度如何变化。
- Metallic 从0变到1时，材质的反射和底色表现如何变化。
- Base Color、Normal 与 Emissive Color 各自控制什么。

## C. 证据命名

建议把证据放入当日日报旁边，并使用：

```text
cpp_pointer_source.png
cpp_pointer_output.png
ue_editor_panels.png
ue_M_FirstMaterial_nodes.png
ue_M_FirstMaterial_sphere.png
```

代码源文件本身也必须保留；截图不能代替源代码。
