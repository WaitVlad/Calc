unit Calculator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Menus;

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
    Label1: TLabel;
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
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonPlusClick(Sender: TObject);
    procedure ButtonResultClick(Sender: TObject);
    procedure ButtonMinusClick(Sender: TObject);
    procedure ButtonMultClick(Sender: TObject);
    procedure ButtonDivisClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InsertNum(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Restart;
  end;

type
  TOperation = (Plus, Minus, Mult, Divis, Non);

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Unit2;

var
  Res1: string;
  Res2: string;
  Oper: TOperation;
  ResFlag: Boolean;
  ResOperFlag: Boolean;
  MinusOper: Boolean;

procedure TForm1.Restart;
begin
  Label1.Caption := ' ';
  Oper := Non;
  Res1 := ' ';
  Res2 := ' ';
  ResOperFlag := True;
  ResFlag := False;
  MinusOper := False;
end;

procedure TForm1.InsertNum(Sender: TObject);
begin
  if ResFlag = False then
  begin
    Label1.Caption := Label1.Caption + ((Sender as TButton).Caption);
    if Oper = Non then
    begin
      Res1 := Res1 + ((Sender as TButton).Caption);
    end
    else
    begin
      Res2 := Res2 + ((Sender as TButton).Caption);
    end;
  end;
  ResOperFlag := False;
end;

procedure TForm1.ButtonPlusClick(Sender: TObject);
begin
  if (ResOperFlag = False) and (Oper = Non) then
  begin
    Oper := Plus;
    Label1.Caption := label1.Caption + ' + ';
    ResOperFlag := True;
    MinusOper := True;
  end;
end;

procedure TForm1.ButtonMinusClick(Sender: TObject);
begin
  if (Res1 = ' ') then
  begin
    Label1.Caption := label1.Caption + '-';
    Res1[1] := '-';
    ResOperFlag := False;
    MinusOper := False;
  end
  else
  begin
    if Oper = Non then
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
        ResOperFlag := False;
      end;
    end;
  end;
end;

procedure TForm1.ButtonMultClick(Sender: TObject);
begin
  if (ResOperFlag = False) and (Oper = Non) then
  begin
    Oper := Mult;
    Label1.Caption := label1.Caption + ' * ';
    ResOperFlag := True;
    MinusOper := True;
  end;
end;

procedure TForm1.ButtonDivisClick(Sender: TObject);
begin
  if (ResOperFlag = False) and (Oper = Non) then
  begin
    Oper := Divis;
    Label1.Caption := label1.Caption + ' / ';
    ResOperFlag := True;
    MinusOper := True;
  end;
end;

procedure TForm1.ButtonCancelClick(Sender: TObject);
begin
  Restart;
end;

procedure TForm1.ButtonResultClick(Sender: TObject);
begin
  ResFlag := True;
  ResOperFlag := True;
  MinusOper := False;
  case Oper of
    Plus:
      label1.Caption := '��������� = ' + IntToStr(StrToInt(Res1) + StrToInt(Res2));
    Minus:
      label1.Caption := '��������� = ' + IntToStr(StrToInt(Res1) - StrToInt(Res2));
    Mult:
      label1.Caption := '��������� = ' + IntToStr(StrToInt(Res1) * StrToInt(Res2));
    Divis:
      if (Res2 = ' 0') or (Res2 = ' -0') then
      begin
        ShowMessage('No');
      end
      else
      begin
        label1.Caption := '��������� = ' + FloatToStr(StrToInt(Res1) / StrToInt(Res2));
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

end.

