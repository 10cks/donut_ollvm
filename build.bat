rem open "x86 Native Tools Command Prompt for VS 2022" first

rem exe2h.exe 
cl -nologo loader\exe2h\exe2h.c loader\exe2h\mmap-windows.c

rem 32bit shellcode 
.\clang-cl.exe --target=i686-w64-windows-msvc -mllvm -fla -DBYPASS_AMSI_B -DBYPASS_WLDP_A -DBYPASS_ETW_B -Zp8 -c -nologo -Gy -Os -O1 -Ob1 -GR- -EHa -Oi -GS- -Gs2147483647 -I include loader\loader.c hash.c encrypt.c loader\depack.c
link -nologo -order:@loader\order.txt -entry:DonutLoader -fixed -subsystem:console -nodefaultlib loader.obj hash.obj encrypt.obj depack.obj
.\exe2h.exe .\loader.exe

rem 64bit shellcode 
.\clang-cl.exe --target=x86_64-w64-windows-msvc -mllvm -fla -DBYPASS_AMSI_B -DBYPASS_WLDP_A -DBYPASS_ETW_B -Zp8 -c -nologo -Gy -Os -O1 -Ob1 -GR- -EHa -Oi -GS- -Gs2147483647 -I include loader\loader.c hash.c encrypt.c loader\depack.c
link -nologo -order:@loader\order.txt -entry:DonutLoader -fixed -subsystem:console -nodefaultlib loader.obj hash.obj encrypt.obj depack.obj
.\exe2h.exe .\loader.exe

rem donut.exe 
rc include/donut.rc
.\clang-cl.exe --target=i686-w64-windows-msvc -Zp8 -nologo -DDONUT_EXE -I include donut.c hash.c encrypt.c format.c loader\clib.c lib\aplib32.lib include/donut.res
