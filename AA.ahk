#NoEnv
#SingleInstance force
#NoTrayIcon
DetectHiddenWindows, on
Path_lnk := "d:\text\backup\lnk"
Path_soft := "d:\soft"
SysGet, zuobiao, Monitor
#f:: ;网页搜索
inputBox,var_in,网页搜索,请输入网站代码+搜索内容：`n百度=b，淘宝=t，京东=j，绿盟=l，GitHub=g`n如想百度aa，则输入baa
If ErrorLevel
exit
StringLeft, wangzhan, var_in, 1
StringRight, text, var_in, StrLen(var_in)-1
If (wangzhan)="b"
run d:\Soft\Firefox\firefox.exe https://www.baidu.com/s?wd=%text%
else If (wangzhan)="t"
run d:\Soft\Firefox\firefox.exe http://s.taobao.com/search?q=%text%
else If (wangzhan)="g"
run d:\Soft\Firefox\firefox.exe https://github.com/search?utf8=`%E2`%9C`%93`&q=%text%
else If (wangzhan)="l"
run d:\Soft\Firefox\firefox.exe http://tag.xdowns.com/tag.asp?keyword=%text%
else If (wangzhan)="j"
run d:\Soft\Firefox\firefox.exe http://search.jd.com/Search?keyword=%text%&enc=utf-8
return
#s:: ;TC复制路径(ctrl-2)到“保存”对话框
SetTitleMatchMode, 2
IfWinActive ahk_class TTOTAL_CMD
{
    If WinExist("另存为") Or WinExist("保存") Or WinExist("Ahk_exe 7zFM.exe") Or WinExist("新建") Or WinExist("复制") 
    {
	Send, ^2
	    WinActivate
    }
	Else If WinExist("上传")
    {
	Send, ^3
	    WinActivate
    }
    	Else 
    {
	Send, ^2
	    Send, !{tab}
    }
	Sleep,100
	Send,^v
	Sleep,100
	Send, {Enter}
	Sleep,100
	Send, {Enter}
}
Return
#v:: ;打开Vim
IfWinNOTExist ahk_class Vim
Run %path_lnk%\v.lnk
   else
   IfWinActive ahk_class Vim
		WinMinimize
	else
		WinActivate
return
>!w:: ;微云备份
gosub open_weiyun
sleep 500
loop
{
Click 77,112
    sleep, 200
    IfWinExist 打开
    break
}
sleep 500
send ^v
sleep 500
send {enter}
sleep 500
Click 492,376
return
>!b:: ;微云笔记
gosub open_weiyun
Sleep 500
Click 66,369
return
>!e:: ;AHK2EXE
inputbox,name,,请输入要转换的文件名（不包括扩展名）:
StringUpper, name, name  
if ErrorLevel
{ msgbox 脚本结束
exit
}
run cmd.exe
sleep,200
sendinput, Ahk2Exe.exe /in "d:\text\AHK\%name%.ahk" /out "d:\text\AHK\EXE\%name%.exe" /bin "Unicode 64-bit.bin"{enter}
sendinput, exit{enter}
return
>!/:: ;查看我的Q等级
Send, !d
sleep, 500
click 158,56
sleep 1000
winwait,我的Q等级
winmove,400,200
sleep, 1000
msgbox 4096,提示,确定后将自动关闭窗口
winclose
return
>!t:: ;计时器
inputBox,time,计时器,请输入时间（秒）：
time := time*1000
sleep %time%
msgBox 时间到
return
>!c:: ;获取鼠标点颜色
mouseGetPos mouseX, mouseY
pixelGetColor, color, %mouseX%, %mouseY%, RGB
stringRight color,color,6
clipboard = %color%
ToolTip, 鼠标所在颜色值已发送到剪贴板
sleep 2000
ToolTip,
return
>!x::run %path_lnk%\XL.lnk 
>!p::run ping baidu.com -t
>!n::run ::{7007acc7-3202-11d1-aad2-00805fc1270e}
>!;::run d:\soft\Firefox\firefox.exe http://item.mi.com/static/buyhezi
>!'::run d:\soft\Firefox\firefox.exe d:\text\Backup\Web\Vim" "Scripts.htm
>!,::Run d:\Soft\Firefox\firefox.exe http://1024diss.info/register.php
>!.::run d:\soft\Firefox\firefox.exe %Clipboard%
>!up:: ;音量+5
SoundSetWaveVolume, +5
SoundGetWaveVolume, OutputVar
OutputVar := floor(OutputVar)
ToolTip, 音量+　%OutputVar%, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
return
>!down:: ;音量-5
SoundSetWaveVolume, -5
SoundGetWaveVolume, OutputVar
OutputVar := floor(OutputVar)
ToolTip, 音量-　%OutputVar%, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
return
>!left:: ;静音
SoundSetWaveVolume, 0
tooltip, 静音, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
return
>!right:: ;音量最大
SoundSetWaveVolume, 100
tooltip, 音量 100, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
return
>^q::run %path_lnk%\QQ.lnk
>^h::run %path_lnk%\HY.lnk
>^m::run gvim --remote-tab-silent %Path_soft%\Vim\_vimrc
>^n::run gvim --remote-tab-silent %USERPROFILE%\_pentadactylrc
>^r::Run %path_lnk%\RG.lnk
>^]::run d:\text\教程\Windows编程\Windows程序设计(第5版,珍藏版).pdf
>^[::run d:\text\教程\Windows编程\精通Windows.API-函数、接口、编程实例.pdf
>^'::run %path_soft%\AutoHotkey\AutoHotkey1.1.16.01全文搜索无乱码帮助.chm
>^;::run d:\text\教程\AutoHotkey\AutoHotkey 学习指南[残本].chm
>^,::run d:\text\软件设计师\谭浩强\C程序设计(第四版) 谭浩强 扫描版.pdf
>^/::run d:\text\教程\VIM\Vim用户手册中文版74.pdf 
>^.::run d:\text\教程\VIM\VIM实用技巧.pdf
;run d:\文本\软件设计师\谭浩强\C程序设计(第四版) 谭浩强 扫描版.pdf
>^AppsKey::send,:`%s`/`\v
AppsKey & c:: ;复制当前行
send {end}
send +{home}
send ^c
return
RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return
Open_weiyun:
SetTitleMatchMode, 3
IFWinExist 微云
WinActivate
else
{
    IfWinNotExist ahk_exe QQ.exe
    {
    	msgbox, 没开QQ，退出脚本
	    exit
    }
sleep 500
send !d
sleep 500
Click 24,1000
sleep 1000
WinWaitActive 微云
WinActivate
}
loop
{
    PixelGetColor, color,40,112
	if (color = "0xFFFFFF")
	  sleep, 200
	else
	  break
}
Return
+CapsLock::CapsLock
CapsLock::LCtrl
Lctrl::Return
>^F1::pause ;暂停脚本
>^F2::run %path_soft%\Autohotkey\AU3_Spy.exe
>^F3::edit
>^F4::reload ;停止并重新载入本脚本
:*:zdate:: ;日期
SendInput, %A_YYYY%年%A_MM%月%A_DD%日 %A_DDDD%
Return
:*:ztime:: ;时间
SendInput, %A_YYYY%年%A_MM%月%A_DD%日 %A_Hour%:%A_Min%:%A_Sec%
send,shenme
Return
