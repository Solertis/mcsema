@echo off

call env.bat

del /q demo_test6.obj demo_test6_mine.obj demo_test6.cfg demo_test6.bc demo_test6_opt.bc demo_driver6.exe
cl /nologo /c demo_test6.c

if exist "%IDA_PATH%\idaq.exe" (
    echo Using IDA to recover CFG
    %PYTHON% %BIN_DESCEND_PATH%\bin_descend_wrapper.py -march=x86-64 -d -func-map="%STD_DEFS%" -entry-symbol=doWork -i=demo_test6.obj
) else (
    echo Bin_descend is no longer supported
    exit 1
)

%CFG_TO_BC_PATH%\cfg_to_bc.exe -mtriple=x86_64-pc-windows-msvc -i demo_test6.cfg -entrypoint=doWork -o demo_test6.bc
clang-cl /Zi -O3 -m64 -o demo_driver6.exe demo_driver6.c ..\..\..\drivers\PE_64_windows.asm demo_test6.bc
demo_driver6.exe
