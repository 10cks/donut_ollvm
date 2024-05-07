# donut-ollvm

使用OLLVM编译donut的shellcode

[原始说明](old-README.md)

donut免杀分析: 
1. <https://xz.aliyun.com/t/13920> 
1. <https://guage.cool/donutbypassav.html>

## 编译过程

### 依赖

1. windows
1. 安装Visual Studio 2022
1. `clang-cl.exe`
    * 使用<https://github.com/wwh1004/ollvm-16/releases>
    * 已经在本仓库中了

### 步骤

1. 打开 `x86 Native Tools Command Prompt for VS 2022`
1. 进入仓库目录
1. 执行 `build.bat`