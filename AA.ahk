#NoEnv
#SingleInstance force
#NoTrayIcon
DetectHiddenWindows, on
Path_lnk := "d:\text\backup\lnk"
Path_soft := "d:\soft"
SysGet, zuobiao, Monitor
#f:: ;��ҳ����
inputBox,var_in,��ҳ����,��������վ����+�������ݣ�`n�ٶ�=b���Ա�=t������=j������=l��GitHub=g`n����ٶ�aa��������baa
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
#s:: ;TC����·��(ctrl-2)�������桱�Ի���
SetTitleMatchMode, 2
IfWinActive ahk_class TTOTAL_CMD
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
#v:: ;��Vim
IfWinNOTExist ahk_class Vim
Run %path_lnk%\v.lnk
   else
   IfWinActive ahk_class Vim
		WinMinimize
	else
		WinActivate
return
>!w:: ;΢�Ʊ���
gosub open_weiyun
sleep 500
loop
{
Click 77,112
    sleep, 200
    IfWinExist ��
    break
}
sleep 500
send ^v
sleep 500
send {enter}
sleep 500
Click 492,376
return
>!b:: ;΢�Ʊʼ�
gosub open_weiyun
Sleep 500
Click 66,369
return
>!e:: ;AHK2EXE
inputbox,name,,������Ҫת�����ļ�������������չ����:
StringUpper, name, name  
if ErrorLevel
{ msgbox �ű�����
exit
}
run cmd.exe
sleep,200
sendinput, Ahk2Exe.exe /in "d:\text\AHK\%name%.ahk" /out "d:\text\AHK\EXE\%name%.exe" /bin "Unicode 64-bit.bin"{enter}
sendinput, exit{enter}
return
>!/:: ;�鿴�ҵ�Q�ȼ�
Send, !d
sleep, 500
click 158,56
sleep 1000
winwait,�ҵ�Q�ȼ�
winmove,400,200
sleep, 1000
msgbox 4096,��ʾ,ȷ�����Զ��رմ���
winclose
return
>!t:: ;��ʱ��
inputBox,time,��ʱ��,������ʱ�䣨�룩��
time := time*1000
sleep %time%
msgBox ʱ�䵽
return
>!c:: ;��ȡ������ɫ
mouseGetPos mouseX, mouseY
pixelGetColor, color, %mouseX%, %mouseY%, RGB
stringRight color,color,6
clipboard = %color%
ToolTip, ���������ɫֵ�ѷ��͵�������
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
>!up:: ;����+5
SoundSetWaveVolume, +5
SoundGetWaveVolume, OutputVar
OutputVar := floor(OutputVar)
ToolTip, ����+��%OutputVar%, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
return
>!down:: ;����-5
SoundSetWaveVolume, -5
SoundGetWaveVolume, OutputVar
OutputVar := floor(OutputVar)
ToolTip, ����-��%OutputVar%, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
return
>!left:: ;����
SoundSetWaveVolume, 0
tooltip, ����, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
return
>!right:: ;�������
SoundSetWaveVolume, 100
tooltip, ���� 100, %zuobiaoRight%, %zuobiaoBottom%
SetTimer, RemoveToolTip, 1000
return
>^q::run %path_lnk%\QQ.lnk
>^h::run %path_lnk%\HY.lnk
>^m::run gvim --remote-tab-silent %Path_soft%\Vim\_vimrc
>^n::run gvim --remote-tab-silent %USERPROFILE%\_pentadactylrc
>^r::Run %path_lnk%\RG.lnk
>^]::run d:\text\�̳�\Windows���\Windows�������(��5��,��ذ�).pdf
>^[::run d:\text\�̳�\Windows���\��ͨWindows.API-�������ӿڡ����ʵ��.pdf
>^'::run %path_soft%\AutoHotkey\AutoHotkey1.1.16.01ȫ���������������.chm
>^;::run d:\text\�̳�\AutoHotkey\AutoHotkey ѧϰָ��[�б�].chm
>^,::run d:\text\������ʦ\̷��ǿ\C�������(���İ�) ̷��ǿ ɨ���.pdf
>^/::run d:\text\�̳�\VIM\Vim�û��ֲ����İ�74.pdf 
>^.::run d:\text\�̳�\VIM\VIMʵ�ü���.pdf
;run d:\�ı�\������ʦ\̷��ǿ\C�������(���İ�) ̷��ǿ ɨ���.pdf
>^AppsKey::send,:`%s`/`\v
AppsKey & c:: ;���Ƶ�ǰ��
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
IFWinExist ΢��
WinActivate
else
{
    IfWinNotExist ahk_exe QQ.exe
    {
    	msgbox, û��QQ���˳��ű�
	    exit
    }
sleep 500
send !d
sleep 500
Click 24,1000
sleep 1000
WinWaitActive ΢��
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
>^F1::pause ;��ͣ�ű�
>^F2::run %path_soft%\Autohotkey\AU3_Spy.exe
>^F3::edit
>^F4::reload ;ֹͣ���������뱾�ű�
:*:zdate:: ;����
SendInput, %A_YYYY%��%A_MM%��%A_DD%�� %A_DDDD%
Return
:*:ztime:: ;ʱ��
SendInput, %A_YYYY%��%A_MM%��%A_DD%�� %A_Hour%:%A_Min%:%A_Sec%
send,shenme
Return
