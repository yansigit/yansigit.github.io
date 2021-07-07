@echo off
setlocal enableDelayedExpansion

pushd C:\Users\Gem\IntelliJIDEAProjects\hugo-blogsystem\content\blog

for %%f in (*) do (
   set "filename=%%~f"

   for %%A in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
      set "filename=!filename:%%A=%%A!"
   )
    ren "%%f" "!filename!" >nul 2>&1
)
endlocal