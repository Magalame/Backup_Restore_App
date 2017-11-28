@echo off
title BackUp And Restore LawL Edition
@echo ---------------------------------------------
@echo             Backup Restore app
@echo ---------------------------------------------
:LABEL_START
@echo -----Backup ou Restore-----
@echo 1- Backup
@echo 2- Restore
set /p choix=Choisis l'action a effectuer:
IF %choix%== 1 GOTO LABEL_BACKUP
IF %choix%== 2 GOTO LABEL_RESTORE
goto END
:LABEL_BACKUP
@echo -----Rom Odex ou Deodex-----
@echo 1-Odex (Rom stock)
@echo 2-Deodex (souvent les rom customs)
set /p chix=Choisis le type de ROM:
adb.exe root
adb.exe wait-for-device
adb.exe pull /data/app/ Backup\
IF %chix%==2 (
call Backup\extractiondelapk.bat
)
echo C'est fini!
Pause
goto END
:LABEL_RESTORE
adb.exe root
adb.exe wait-for-device
for %%X in (Backup\*.apk) do (
adb.exe install %%X
del %%X
)
for %%X in (Backup\*) do (
if not %%X==Backup\extractiondelapk.bat del "%%X"
)
echo C'est fini!
Pause
:LABEL_END
