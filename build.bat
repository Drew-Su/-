@echo off
cd /d "%~dp0"
set JAVA_HOME=D:\Java\JDK
set PATH=%JAVA_HOME%\bin;%PATH%
set JFX="D:\javafx-sdk-21.0.11\lib"
set MYSQL="D:\Java\JDK\lib\mysql-connector-j.jar"

echo ========================================
echo    2048 Game - Build and Run
echo ========================================
echo.

echo [1/2] Compiling...
javac --module-path %JFX% --add-modules javafx.controls,javafx.graphics -cp %MYSQL% -encoding UTF-8 -d out src/game2048/*.java
if %errorlevel% neq 0 (
    echo Compile failed!
    pause
    exit /b 1
)
echo Compile success!
echo.

echo [2/2] Starting game...
start javaw --module-path %JFX% --add-modules javafx.controls,javafx.graphics -cp out;%MYSQL% game2048.Main
