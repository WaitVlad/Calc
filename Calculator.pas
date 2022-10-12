unit Calculator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ButtonResult: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button0: TButton;
    ButtonMinus: TButton;
    ButtonMult: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Label1: TLabel;
    Panel1: TPanel;
    TimeLine: TMenuItem;
    N11: TMenuItem;
    Timer1: TTimer;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOperatorClick(Sender: TObject);
    procedure ButtonResultClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InsertNum(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Restart;
    procedure Operation(OperatorChar: string);
    procedure ResultCheck;
  end;

type
  TOperation = (Plus, Minus, Mult, Divis, None);

var
  Form1: TForm1;
  TimeValue : TLabel;

implementation

{$R *.dfm}

uses
  Unit2;

var
  Res1: string;
  Res2: string;
  Oper: TOperation;
  ResFlag: Boolean;
  StopOperFlag: Boolean;
  MinusOper: Boolean;
  ResultCheckFlag: Boolean;


procedure TForm1.Restart;
begin
  Label1.Caption := ' ';
  Oper := None;
  Res1 := ' ';
  Res2 := ' ';
  StopOperFlag := True;
  ResFlag := False;
  MinusOper := False;
  ResultCheckFlag := False;
end;

procedure TForm1.ResultCheck;
begin
  if ResultCheckFlag then
    Restart;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
var
RealTime : TDateTime;
begin
  RealTime := Time;
  TimeLine.Caption := (FormatDateTime('h:n:s:z', RealTime));
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  ResultCheck;
  StopOperFlag := False;
  if (ResFlag = False) and ((Key in ['0'..'9']) or (Key in [','])) then
  begin
    Label1.Caption := Label1.Caption + Key;
    if Oper = None then
    begin
      Res1 := Res1 + Key;
    end
    else
    begin
      Res2 := Res2 + Key;
    end;
  end;
  if (StopOperFlag = False) and (CharInSet(Key, ['+', '-', '*', '/'])) then
    Operation(Key);
end;

procedure TForm1.InsertNum(Sender: TObject);
begin
  ResultCheck;
  ResultCheckFlag := False;
  if ResFlag = False then
  begin
    Label1.Caption := Label1.Caption + ((Sender as TButton).Caption);
    if Oper = None then
    begin
      Res1 := Res1 + ((Sender as TButton).Caption);
    end
    else
    begin
      Res2 := Res2 + ((Sender as TButton).Caption);
    end;
  end;
  StopOperFlag := False;
end;

procedure TForm1.Operation(OperatorChar: string);
begin
  if OperatorChar = '+' then
  begin
    if (StopOperFlag = False) and (Oper = None) then
    begin
      ResultCheck;
      Oper := Plus;
      Label1.Caption := label1.Caption + ' + ';
      StopOperFlag := True;
      MinusOper := True;
    end;
  end;
  if OperatorChar = '-' then
  begin
    ResultCheck;
    if (Res1 = ' ') then
    begin
      Label1.Caption := label1.Caption + '-';
      Res1[1] := '-';
      StopOperFlag := False;
      MinusOper := False;
      ResultCheckFlag := False
    end
    else
    begin
      if Oper = None then
      begin
        Oper := Minus;
        Label1.Caption := label1.Caption + ' - ';
        MinusOper := True;
      end
      else
      begin
        if (MinusOper = True) and (Res2 = ' ') then
        begin
          Label1.Caption := label1.Caption + '-';
          Res2[1] := '-';
          MinusOper := False;
          StopOperFlag := False;
        end;
      end;
    end;
  end;
  if OperatorChar = '*' then
  begin
    if (StopOperFlag = False) and (Oper = None) then
    begin
      Oper := Mult;
      Label1.Caption := label1.Caption + ' * ';
      StopOperFlag := True;
      MinusOper := True;
    end;
  end;
  if OperatorChar = '/' then
  begin
    if (StopOperFlag = False) and (Oper = None) then
    begin
      Oper := Divis;
      Label1.Caption := label1.Caption + ' / ';
      StopOperFlag := True;
      MinusOper := True;
    end;
  end;
end;

procedure TForm1.ButtonCancelClick(Sender: TObject);
begin
  Restart;
end;

procedure TForm1.ButtonOperatorClick(Sender: TObject);
begin
  Operation((Sender as TButton).Caption);
end;

procedure TForm1.ButtonResultClick(Sender: TObject);
begin
  ResFlag := True;
  StopOperFlag := True;
  MinusOper := False;
  ResultCheckFlag := True;
  case Oper of
    Plus:
      label1.Caption := 'Result = ' + IntToStr(StrToInt(Res1) + StrToInt(Res2));
    Minus:
      label1.Caption := 'Result = ' + IntToStr(StrToInt(Res1) - StrToInt(Res2));
    Mult:
      label1.Caption := 'Result = ' + IntToStr(StrToInt(Res1) * StrToInt(Res2));
    Divis:
      try
        label1.Caption := 'Result = ' + FloatToStr(StrToInt(Res1) / StrToInt(Res2));
      except
        on EMathError: EZeroDivide do
          MessageBox(Handle, 'Please don''t divide by zero', 'Zero Error', 0);
      end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Restart;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Application.Destroy;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  Operation('+');
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  Operation('-');
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Operation('*');
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  Operation('/');
end;

end.

