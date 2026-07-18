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
- [ ] UE版本与最小C++项目路径。
- [ ] UE C++项目编译成功截图。
- [ ] Unreal Editor实际打开项目的截图。
- [ ] Viewport、World Outliner、Details、Content Browser截图。
- [ ] `M_FirstMaterial`节点图。
- [ ] 材质应用到球体的效果图。

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

`D:\MY UE5 program\FHOU\FHOU.uproject`已确认是UE 5.8蓝图项目，包含429个内容文件并已生成Windows打包产物，因此First Hour跟做通过。该工程没有`Source`目录和C++模块，最小UE C++项目验收继续保持未完成。
