cls
@ECHO OFF
for /d %%X in (*) do (
move %%X\base.apk "%%X.apk"
rmdir /S /Q %%X
)
Pause