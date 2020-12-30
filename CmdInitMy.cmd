@echo off
REM   set ConEmuPrompt1=$E[97m$S$E[91m⚡$S$E[94m$S$P$E[92m$S$_❯$S$E[0m
REM   set ConEmuPrompt1=$E[97m$S$E[94m$S$P$E[92m$S$_❯$S$E[0m


rem Simple "ver" prints empty line before Windows version
rem Use this construction to print just a version info
cmd /d /c ver | "%windir%\system32\find.exe" "Windows"

rem Now we form the command prompt

rem This will start prompt with `User@PC `
if /I "%ConEmuPromptNames%" == "NO" (
  set ConEmuPrompt0=$E[97m$S
) else (
  set ConEmuPrompt0=$E[m$E[32m$E]9;8;"USERNAME"$E\@$E]9;8;"COMPUTERNAME"$E\$S
)

if "%ConEmuIsAdmin%" == "ADMIN" (
  set ConEmuPrompt0=%ConEmuPrompt0%$E[91m⚡$S
)

rem Followed by colored `Path`
set ConEmuPrompt1=%ConEmuPrompt0%$E[94m$S$P$E[0m
if NOT "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
  if "%PROCESSOR_ARCHITEW6432%" == "AMD64" if "%PROCESSOR_ARCHITECTURE%" == "x86" (
    rem Use another text color if cmd was run from SysWow64
    set ConEmuPrompt1=%ConEmuPrompt0%$E[34m$S$P$E[0m
  )
)

rem Carriage return and `$` or `#`
if /I "%ConEmuPromptNL%" == "NO" (set ConEmuPrompt2=$E[92m$S$_❯) else (set ConEmuPrompt2=$E[92m$S$_❯)
rem Spare `$E[90m` was specially added because of GitShowBranch.cmd


rem Finally reset color and add notify ConEmu about prompt input start coords
set ConEmuPrompt3=$E[m$S$E]9;12$E\

rem Show 'git status' extract in prompt?
if /I "%~1" == "/git" goto git
if /I "%~1" == "-git" goto git
goto no_git
:git
shift /1
call "%~dp0GitShowBranch.cmd" /i
goto :end_git
:no_git
rem Set new prompt
PROMPT %ConEmuPrompt1%%ConEmuPrompt2%%ConEmuPrompt3%
:end_git

rem Support additional batch execution as `{cmd} "path\to\batch.cmd" <arguments>`
rem Due to parsing rules of cmd.exe last argument must NOT ends with "
if "%~1" == "" goto clean
rem We can't call here %* unfortunately
call %1 %2 %3 %4 %5 %6 %7 %8 %9

:clean
set ConEmuPrompt0=
set ConEmuPrompt1=
set ConEmuPrompt2=
set ConEmuPrompt3=

