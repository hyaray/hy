#NoEnv
#SingleInstance force
#NoTrayIcon
DetectHiddenWindows, On
Path_lnk := "d:\Text\backup\lnk"
Path_soft := "d:\soft"
SysGet, zuobiao, Monitor
#f:: ;��ҳ����
InputBox,var_in,��ҳ����,��������վ����+�������ݣ�`n�ٶ�=b���Ա�=t������=j������=l��GitHub=g`n����ٶ�aa��������baa
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
#s:: ;TC����·��(Ctrl-2)�������桱�Ի���
SetTitleMatchMode, 2
IfWinActive Ahk_class TTOTAL_CMD
{
    If WinExist("���Ϊ") Or WinExist("����") Or WinExist("Ahk_exe 7zFM.exe") Or WinExist("�½�") Or WinExist("����") 
    {
	Send, ^2
	    WinActivate
    }
	Else If WinExist("�ϴ�")
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
#v:: ;��Vim
IfWinNotExist Ahk_class Vim
Run %path_lnk%\v.lnk
   Else
   IfWinActive Ahk_class Vim
		WinMinimize
	Else
		WinActivate
Return
>!w:: ;΢�Ʊ���
Gosub open_weiyun
Sleep 500
Loop
{
Click 77,112
    Sleep, 200
    IfWinExist ��
    Break
}
Sleep 500
Send ^v
Sleep 500
Send {Enter}
Sleep 500
Click 492,376
Return
>!b:: ;΢�Ʊʼ�
Gosub open_weiyun
Sleep 500
Click 66,369
Return
>!e:: ;AHK2EXE
InputBox,name,,������Ҫת�����ļ�������������չ����:
StringUpper, name, name  
If ErrorLevel
{ MsgBox �ű�����
Exit
}
Run cmd.exe
Sleep,200
SendInput, Ahk2Exe.exe /In "d:\Text\AHK\%name%.ahk" /out "d:\Text\AHK\EXE\%name%.exe" /bin "Unicode 64-bit.bin"{Enter}
SendInput, Exit{Enter}
Return
>!/:: ;�鿴�ҵ�Q�ȼ�
sleep, 200
Send, !d
Sleep, 500
Click 158,56
Sleep 1000
WinWait,�ҵ�Q�ȼ�
WinMove,400,200
Sleep, 1000
MsgBox 4096,��ʾ,ȷ�����Զ��رմ���
WinClose
Return
>!t:: ;��ʱ��
InputBox,Time,��ʱ��,������ʱ�䣨�룩��
Time := Time*1000
Sleep %Time%
MsgBox ʱ�䵽
Return
>!c:: ;��ȡ������ɫ
MouseGetPos mouseX, mouseY
PixelGetColor, Color, %mouseX%, %mouseY%, RGB
StringRight Color,Color,6
Clipboard = %Color%
ToolTip, ���������ɫֵ�ѷ��͵�������
Sleep 2000
ToolTip,
Return
>!x::Run %path_lnk%\XL.lnk 
>!p::Run ping baidu.com -t
>!n::Run ::{7007acc7-3202-11d1-aad2-00805fc1270e}
>!;::Run d:\soft\Firefox\firefox.exe http://item.mi.com/Static/buyhezi
>!'::Run d:\soft\Firefox\firefox.exe d:\Text\Backup\Web\Vim" "Scripts.htm
>!,::Run d:\Soft\Firefox\firefox.exe http://1024diss.info/register.php
>!.::Run d:\soft\Firefox\firefox.exe %Clipboard%
>!Up:: ;����+5
SoundSetWaveVolume, +5
SoundGetWaveVolume, OutputVar
OutputVar := Floor(OutputVar)
ToolTip, ����+��%OutputVar%, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
Return
>!Down:: ;����-5
SoundSetWaveVolume, -5
SoundGetWaveVolume, OutputVar
OutputVar := Floor(OutputVar)
ToolTip, ����-��%OutputVar%, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
Return
>!Left:: ;����
SoundSetWaveVolume, 0
ToolTip, ����, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
Return
>!Right:: ;�������
SoundSetWaveVolume, 100
ToolTip, ���� 100, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
Return
>^q::Run %path_lnk%\QQ.lnk
>^h::Run %path_lnk%\HY.lnk
>^m::Run gvim --remote-Tab-silent %Path_soft%\Vim\_vimrc
>^n::Run gvim --remote-Tab-silent %USERPROFILE%\_pentadactylrc
>^r::Run %path_lnk%\RG.lnk
>^]::Run d:\Text\�̳�\Windows���\Windows�������(��5��,��ذ�).pdf
>^[::Run d:\Text\�̳�\Windows���\��ͨWindows.API-�������ӿڡ����ʵ��.pdf
>^'::Run %path_soft%\AutoHotkey\AutoHotkey1.1.16.01ȫ���������������.chm
>^;::Run d:\Text\�̳�\AutoHotkey\AutoHotkey ѧϰָ��[�б�].chm
>^,::Run d:\Text\������ʦ\̷��ǿ\C�������(���İ�) ̷��ǿ ɨ���.pdf
>^/::Run d:\Text\�̳�\VIM\Vim�û��ֲ����İ�74.pdf 
>^.::Run d:\Text\�̳�\VIM\VIMʵ�ü���.pdf
>^AppsKey::Send,:`%s`/`\v
AppsKey & c:: ;���Ƶ�ǰ��
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
IfWinExist ΢��
WinActivate
Else
{
    IfWinNotExist Ahk_exe QQ.exe
    {
    	MsgBox, û��QQ���˳��ű�
	    Exit
    }
Sleep 500
Send !d
Sleep 500
Click 24,1000
Sleep 1000
WinWaitActive ΢��
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
:*:zdate:: ;����
SendInput, %A_YYYY%��%A_MM%��%A_DD%�� %A_DDDD%
Return
:*:ztime:: ;ʱ��
SendInput, %A_YYYY%��%A_MM%��%A_DD%�� %A_Hour%:%A_Min%:%A_Sec%
Return
:*:zga::
clipboard := "git add "
Send, +{ins}
Return
:*:zgs::
clipboard := "git status -s"
Send, +{ins}
Return
:*:zgp::
clipboard := "git push origin master"
Send, +{ins}
Return
:*:zgit::
clipboard := "https://github.com/hyaray/hy.git"
Send, +{ins}
Return
>^F1::Pause ;��ͣ�ű�
>^F2::Run %path_soft%\Autohotkey\AU3_Spy.exe
>^F3::Edit
>^F4::Reload ;ֹͣ���������뱾�ű�
