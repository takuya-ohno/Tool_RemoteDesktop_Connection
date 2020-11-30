@echo off
Set SERVER=IPアドレス
Set USERNAME="****"
Set PASSWORD="****"

rem 
rem 資格情報の設定
rem 
Cmdkey /generic:TERMSRV/%SERVER% /user:%USERNAME% /pass:%PASSWORD%

rem 
rem このリモートコンピュータの
rem IDを識別できません。を回避
rem レジストリ追加
rem 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client" /v AuthenticationLevelOverride /t REG_DWORD /d 0 /f

rem 
rem リモートデスクトップ接続
rem 
Start mstsc /v:%SERVER%
Timeout 3

rem 
rem このリモートコンピュータの
rem #IDを識別できません。を回避
rem レジストリ削除
rem 
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client" /v AuthenticationLevelOverride /f

rem 
rem 資格情報の削除
rem 
Cmdkey /delete:TERMSRV/%SERVER%

