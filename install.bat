@echo off
if /i "%1" equ "--reverse" (
    cd autoload\leaderf\fuzzyMatch_C
    rd /s /q build
    cd ..\python
    del *.pyd
    echo ======================================
    echo  C extension uninstalled sucessfully!
    echo ======================================
    goto end
)
echo Begin to compile C extension of Python2 ...
cd autoload\leaderf\fuzzyMatch_C

echo=
echo Begin to compile C extension of Python3 ...
python setup.py build --build-lib ..\python
if %errorlevel% equ 0 (
    echo=
    echo ===============================================
    echo  C extension of Python3 installed sucessfully!
    echo ===============================================
)

:end
