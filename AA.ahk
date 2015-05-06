#NoEnv
#SingleInstance force
#NoTrayIcon
DetectHiddenWindows, On
Path_lnk := "d:\Text\backup\lnk"
Path_soft := "d:\soft"
#f:: ;网页搜索
InputBox,var_in,网页搜索,请输入网站代码+搜索内容：`n百度=b，淘宝=t，京东=j，绿盟=l，GitHub=g`n如想百度aa，则输入baa
If ErrorLevel
Exit
StringLeft, wangzhan, var_in, 1
StringRight, Text, var_in, StrLen(var_in)-1
If (wangzhan)="b"
Run d:\Soft\Firefox\firefox.exe https://www.baidu.com/s?wd=%Text%
Else If (wangzhan)="t"
Run d:\Soft\Firefox\firefox.exe http://s.taobao.com/search?q=%Text%
Else If (wangzhan)="g"
Run d:\Soft\Firefox\firefox.exe https://github.com/search?utf8=`%E2`%9C`%93`&q=%Text%
Else If (wangzhan)="l"
Run d:\Soft\Firefox\firefox.exe http://tag.xdowns.com/tag.asp?keyword=%Text%
Else If (wangzhan)="j"
Run d:\Soft\Firefox\firefox.exe http://search.jd.com/Search?keyword=%Text%&enc=utf-8
Return
#s:: ;TC复制路径(Ctrl-2)到“保存”对话框
SetTitleMatchMode, 2
IfWinActive Ahk_class TTOTAL_CMD
{
    If WinExist("另存为") Or WinExist("保存") Or WinExist("Ahk_exe 7zFM.exe") Or WinExist("新建") Or WinExist("复制") 
    {
	Send, ^2
	    WinActivate
    }
    Else If WinExist("上传") Or WinExist ("打开")
    {
	Send, ^3
	    WinActivate
    }
    Else 
    {
	Send, ^2
	    Send, !{Tab}
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
IfWinNotExist Ahk_class Vim
Run %path_lnk%\v.lnk
Else
IfWinActive Ahk_class Vim
WinMinimize
Else
WinActivate
Return
>!w:: ;微云备份
Gosub open_weiyun
Sleep 500
Loop
{
    Click 77,112
	Sleep, 200
	IfWinExist 打开
	Break
}
Sleep 500
Send ^v
Sleep 500
Send {Enter}
Sleep 500
Click 492,376
Return
>!b:: ;微云笔记
Gosub open_weiyun
Sleep 500
Click 66,369
Return
>!e:: ;AHK2EXE
InputBox,name,,请输入要转换的文件名（不包括扩展名）:
StringUpper, name, name  
If ErrorLevel
{ MsgBox 脚本结束
    Exit
}
Run cmd.exe
Sleep,200
SendInput, Ahk2Exe.exe /In "d:\Text\AHK\%name%.ahk" /out "d:\Text\AHK\EXE\%name%.exe" /bin "Unicode 64-bit.bin"{Enter}
SendInput, Exit{Enter}
Return
>!/:: ;查看我的Q等级
sleep, 200
Send, !d
Sleep, 500
Click 158,56
Sleep 1000
WinWait,我的Q等级
WinMove,400,200
Sleep, 1000
MsgBox 4096,提示,确定后将自动关闭窗口
WinClose
Return
>!t:: ;计时器
InputBox,Time,计时器,请输入时间（秒）：
Time := Time*1000
Sleep %Time%
MsgBox 时间到
Return
>!c:: ;获取鼠标点颜色
MouseGetPos mouseX, mouseY
PixelGetColor, Color, %mouseX%, %mouseY%, RGB
StringRight Color,Color,6
Clipboard = %Color%
ToolTip, 鼠标所在颜色值已发送到剪贴板
Sleep 2000
ToolTip,
    Return
    >!Up:: ;音量+5
    SoundSetWaveVolume, +5
SoundGetWaveVolume, OutputVar
OutputVar := Floor(OutputVar)
	ToolTip, 音量+  %OutputVar%, %A_ScreenWidth%, %A_ScreenHeight%
	SetTimer, RemoveToolTip, 1000
	Return
	>!Down:: ;音量-5
	SoundSetWaveVolume, -5
SoundGetWaveVolume, OutputVar
OutputVar := Floor(OutputVar)
	ToolTip, 音量-  %OutputVar%, %A_ScreenWidth%, %A_ScreenHeight%
	SetTimer, RemoveToolTip, 1000
	Return
	>!Left:: ;静音
	SoundSetWaveVolume, 0
	ToolTip, 静音, %A_ScreenWidth%, %A_ScreenHeight%
	SetTimer, RemoveToolTip, 1000
	Return
	>!Right:: ;音量最大
	SoundSetWaveVolume, 100
	ToolTip, 音量 100, %A_ScreenWidth%, %A_ScreenHeight%
	SetTimer, RemoveToolTip, 1000
	Return
	;单键命令
	>!x::Run XL.lnk 
	>!p::Run ping baidu.com -t
	>!n::Run ::{7007acc7-3202-11d1-aad2-00805fc1270e}
	>!;::Run d:\soft\Firefox\firefox.exe http://item.mi.com/Static/buyhezi
	>!'::Run d:\soft\Firefox\firefox.exe d:\Text\Backup\Web\Vim" "Scripts.htm
	>!,::Run d:\Soft\Firefox\firefox.exe http://1024diss.info/register.php
	>!.::Run d:\soft\Firefox\firefox.exe %Clipboard%
	>^q::Run QQ.lnk
	>^h::Run HY.lnk
	>^m::Run gvim --remote-Tab-silent %Path_soft%\Vim\_vimrc
	>^n::Run gvim --remote-Tab-silent %USERPROFILE%\_pentadactylrc
	>^r::Run RG.lnk
	>^]::Run d:\Text\教程\Windows编程\Windows程序设计(第5版,珍藏版).pdf
	>^[::Run d:\Text\教程\Windows编程\精通Windows.API-函数、接口、编程实例.pdf
	>^'::Run %path_soft%\AutoHotkey\AutoHotkey1.1.16.01全文搜索无乱码帮助.chm
	>^;::Run d:\Text\教程\AutoHotkey\AutoHotkey 学习指南[残本].chm
	>^,::Run d:\Text\软件设计师\谭浩强\C程序设计(第四版) 谭浩强 扫描版.pdf
	>^/::Run d:\Text\教程\VIM\Vim用户手册中文版74.pdf 
	>^.::Run d:\Text\教程\VIM\VIM实用技巧.pdf
	>^AppsKey::Send,:`%s`/`\v
	AppsKey & c:: ;复制当前行
	Send {End}
	Send +{Home}
	Send ^c
	Return
	RemoveToolTip:
	SetTimer, RemoveToolTip, Off
	ToolTip
	Return
	Open_weiyun:
	SetTitleMatchMode, 3
	IfWinExist 微云
	WinActivate
	Else
{
    IfWinNotExist Ahk_exe QQ.exe
    {
	MsgBox, 没开QQ，退出脚本
	    Exit
    }
    Sleep 500
	Send !d
	Sleep 500
	If (A_ScreenHeight = 1080)
	Click 24,1000
	Else If (A_ScreenHeight = 960)
	Click 24,820
	Else If (A_ScreenHeight = 768)
	Click 24,688
	Sleep 1000
	WinWaitActive 微云
	WinActivate
}
Loop
{
    PixelGetColor, Color,40,112
	If (Color = "0xFFFFFF")
	Sleep, 200
	Else
	Break
}
Return
+CapsLock::CapsLock
CapsLock::LCtrl
LCtrl::Return
;Git Bash热字串列表
:*:zga::
clipboard := "git add "
send, +{ins}
return
:*:zgb::
clipboard := "git branch "
send, +{ins}
return
:*:zgc::
clipboard := "git commit -m "
send, +{ins}
return
:*:zgco::
clipboard := "git checkout "
send, +{ins}
return
:*:zgdc::
clipboard := "git diff -cached"
send, +{ins}
return
:*:zgdh::
clipboard := "git diff head"
send, +{ins}
return
:*:zgds::
clipboard := "git diff --stat"
send, +{ins}
return
:*:zgit::
clipboard := "https://github.com/hyaray/hy.git"
send, +{ins}
return
:*:zgp::
clipboard := "git push origin master"
send, +{ins}
return
:*:zgpl::
clipboard := "git pull "
Send, +{ins}
Return
:*:zgrh::
clipboard := "git reset HEAD --"
send, +{ins}
return
:*:zgs::
clipboard := "git status -s"
send, +{ins}
return
:*:zgt::
clipboard := "git tag -a "
send, +{ins}
return
>^F1::Pause ;暂停脚本
>^F2::Run %path_soft%\Autohotkey\AU3_Spy.exe
>^F3::Edit
>^F4::Reload ;停止并重新载入本脚本
