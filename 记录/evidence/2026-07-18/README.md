# 2026-07-18 证据目录

启动日结束后，把原始证据放在这里。

## 必须证据

- [x] [UE与Visual Studio环境检查记录](./环境检查_2026-07-17.md)。
- [x] 完成后的[`pointer_practice.cpp`](../../../练习/2026-07-18/pointer_practice.cpp)。
- [x] [指针练习最终编译和运行结果](./cpp_pointer_build_2026-07-18.txt)。
- [x] [Visual Studio代码与成功运行截图](./cpp_pointer_visual_studio_run.png)。
- [x] [7题口头自测答案](../../../练习/2026-07-18/README.md#口头自测)。
- [x] [黑马C++课程进度到第63节截图](./cpp_course_progress_63.png)。
- [x] [UE5 First Hour课程完成截图](./ue_first_hour_course_complete.png)。
- [x] [FHOU工程结构与打包产物核验记录](./ue_first_hour_project_check_2026-07-18.md)。
- [x] [FirstCplus故障修复与启动核验记录](./ue_cpp_FirstCplus_repair_2026-07-18.md)。
- [x] [UE C++环境与工程复检结果](./ue_cpp_environment_check_2026-07-18.txt)。
- [x] UE版本与C++项目路径。
- [x] [UE C++项目编译成功输出](./ue_cpp_FirstCplus_build_2026-07-18.txt)。
- [x] [Unreal Editor实际打开FirstCplus项目的截图](./ue_cpp_FirstCplus_editor_open.png)。
- [x] [Viewport、World Outliner、Details和Content Drawer截图](./ue_cpp_FirstCplus_editor_open.png)。
- [x] [`M_FirstMaterial`材质编辑器截图](./ue_M_FirstMaterial_editor.png)。
- [x] [材质应用到球体的效果图](./ue_M_FirstMaterial_sphere.png)。
- [x] 球体Transform操作截图：[移动](./ue_sphere_move.png)、[旋转30度](./ue_sphere_rotate_30deg.png)、[缩放](./ue_sphere_scale.png)。
- [x] [`M_FirstMaterial`工程文件、日志与截图验收记录](./ue_M_FirstMaterial_check_2026-07-18.md)。

## 建议文件名

```text
pointer_practice.cpp
cpp_pointer_output.png
ue_version.png
ue_cpp_project_build.png
ue_cpp_project_open.png
ue_editor_panels.png
ue_M_FirstMaterial_nodes.png
ue_M_FirstMaterial_sphere.png
```

只有截图而没有源代码或UE工程，不能通过相应验收。

指针练习已通过Debug x64最终重建与运行验收。内存地址会随每次运行变化，不把固定地址作为验收条件。

`D:\MY UE5 program\FHOU\FHOU.uproject`已确认是UE 5.8蓝图项目，包含429个内容文件并已生成Windows打包产物，因此First Hour跟做通过。该工程本身没有`Source`目录和C++模块，不能单独作为C++环境证据。

`D:\MY UE5 program\FirstCplus\FirstCplus.uproject`已成功构建、启动并保存编辑器截图。原故障来自与UE 5.8不兼容的项目级`VisualStudioTools`插件；插件已禁用，原配置已在工程旁备份。UE C++开发环境验收通过。

`D:\MY UE5 program\FHOU\Content\FHOU\M_FirstMaterial.uasset`已保存并编译，资产验证报告0个问题；球体Transform操作、材质编辑器和最终应用效果均有截图。四组Metallic/Roughness参数观察仍待完成。
