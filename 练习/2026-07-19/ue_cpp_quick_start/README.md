# UE C++ Programming Quick Start

- 学习日期：2026-07-19
- 学习用时：1小时
- 官方教程：[Programming Quick Start](https://dev.epicgames.com/documentation/unreal-engine/unreal-engine-cpp-quick-start)
- 实际工程：`D:\MY UE5 program\FirstCplus\FirstCplus.uproject`

## 本次完成

- 创建第一个C++ Actor类`AFloatingActor`。
- 创建并显示`UStaticMeshComponent`。
- 在`Tick`中实现上下浮动和持续旋转。
- 使用`UPROPERTY`把`FloatSpeed`和`RotationSpeed`暴露到UE Details面板。
- 编译代码、把`FloatingActor`放入关卡并完成效果实现。

## 针对当前工程的适配

当前工程没有Starter Content，因此教程中的：

```cpp
/Game/StarterContent/Shapes/Shape_Cube.Shape_Cube
```

改为引擎自带模型：

```cpp
/Engine/BasicShapes/Cube.Cube
```

这不会改变教程要学习的C++ Actor、组件、Tick或参数暴露知识。

## 源码快照

- [`FloatingActor.h`](./FloatingActor.h)
- [`FloatingActor.cpp`](./FloatingActor.cpp)

## 当前掌握状态

本次为跟随官方教程完成，已经理解创建、编辑、编译和放置第一个C++ Actor的完整流程。后续需要关闭教程从空白复做一次，才能判定为完全独立掌握。
