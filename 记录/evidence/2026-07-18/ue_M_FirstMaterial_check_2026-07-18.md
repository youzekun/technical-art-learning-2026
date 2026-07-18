# `M_FirstMaterial`保存与验收记录

核验日期：2026-07-18

## 工程与资产

- UE工程：`D:\MY UE5 program\FHOU\FHOU.uproject`
- 材质资产：`D:\MY UE5 program\FHOU\Content\FHOU\M_FirstMaterial.uasset`
- 材质文件大小：9611字节
- 材质最后写入时间：2026-07-18 19:29:13
- 球体关卡Actor外部文件最后写入时间：2026-07-18 19:32:25

FHOU编辑器日志显示：

- 创建并重命名材质为`M_FirstMaterial`；
- 材质已执行保存与编译；
- 资产验证完成，报告0个问题；
- 球体对应的关卡Actor文件已保存。

## 截图证据

- [球体移动](./ue_sphere_move.png)
- [球体旋转30度](./ue_sphere_rotate_30deg.png)
- [球体缩放](./ue_sphere_scale.png)
- [`M_FirstMaterial`材质编辑器](./ue_M_FirstMaterial_editor.png)
- [材质应用到球体](./ue_M_FirstMaterial_sphere.png)

## 验收结论

已通过：

- 在关卡中创建球体；
- 分别使用移动、旋转和缩放工具；
- 创建并保存传统材质`M_FirstMaterial`；
- 找到Base Color、Metallic、Roughness、Normal和Emissive Color输入；
- 把材质应用到球体并保存关卡改动。

仍待完成：

- 在同一灯光、相机和球体条件下完成Metallic/Roughness四组参数对比；
- 用自己的话记录高光、反射和底色的变化。

本次产出是“第一个传统材质练习”，不等同于第一阶段的“参数化PBR母材质和三个材质实例”硬门槛。
