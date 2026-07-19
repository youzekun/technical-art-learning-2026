# 2026-07-19 证据目录

## 必须证据

- [x] 完成后的[`pointer_array_practice.cpp`](../../../练习/2026-07-19/pointer_array_practice.cpp)
- [x] [Debug x64编译与运行结果](./cpp_pointer_array_build_2026-07-19.txt)
- [x] [Visual Studio代码与控制台截图](./cpp_pointer_array_visual_studio_run.png)
- [x] [`BP_TransformPractice`的Components层级和Details截图](./ue_bp_transform_components_details_unsaved.png)
- [x] [Blueprint Actor与Content Browser资产截图](./ue_bp_transform_actor_and_asset.png)
- [x] [Location操作截图](./ue_bp_transform_location.png)
- [x] [Rotation操作截图](./ue_bp_transform_rotation.png)
- [x] [统一Scale操作截图](./ue_bp_transform_scale_uniform.png)
- [x] [分轴Scale操作截图](./ue_bp_transform_scale_axes.png)
- [x] [编辑器“所有已保存”状态截图](./ue_all_saved_status.png)
- [x] [UE资产磁盘保存检查记录](./ue_transform_verification_2026-07-19.txt)
- [x] [`M_PBRReview`材质编辑器与参数截图](./ue_M_PBRReview_parameters.png)
- [x] [材质应用到Blueprint的效果截图](./ue_M_PBRReview_applied_to_blueprint.png)
- [x] [材质与Blueprint“所有已保存”状态](./ue_material_all_saved_status.png)
- [x] [材质磁盘保存与Blueprint引用检查](./ue_pbr_review_verification_2026-07-19.txt)
- [x] [三道C++口头自测](../../../练习/2026-07-19/README.md#口头自测)
- [x] [Actor、Component、Transform口头自测与截图](../../../02_当前任务_2026-07-19.md#2-ue-actorcomponent与transform15小时)

只有截图而没有源代码或UE工程，不能通过相应验收。

C++独立练习已通过两层验收：源代码使用`const int*`打印数组、使用首尾指针逆置数组，并额外完成冒泡排序；Debug x64重新构建成功，输出正确，进程退出代码为0。口头自测核心概念正确，精确表述已补充在练习README中。

UE Transform操作已通过两层验收：截图证明已创建`BP_TransformPractice`、添加Cube Static Mesh Component，并完成Location、Rotation和Scale操作；磁盘检查确认Blueprint资产和关卡External Actor文件已写入。Components与Details截图拍摄时仍显示未保存，随后补充的状态截图已经显示“所有已保存”。

Actor、Component、Transform口头自测核心概念正确，精确表述已补充到当前任务文件中。截图证据见[`ue_actor_component_transform_oral_test.png`](./ue_actor_component_transform_oral_test.png)。

`M_PBRReview`已通过两层验收：材质编辑器截图显示Base Color为非黑色、Metallic为0、Specular为0.5、Roughness为0.4；Blueprint截图显示材质已经应用到Cube Static Mesh Component，二进制资产检查也确认`BP_TransformPractice.uasset`保存了对`/Game/Blueprint_Actor/M_PBRReview`的引用。
