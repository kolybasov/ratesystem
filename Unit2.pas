unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Year: TEdit;
    Speciality: TComboBox;
    Label2: TLabel;
    Group: TEdit;
    Label3: TLabel;
    Term: TComboBox;
    Label4: TLabel;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure GroupKeyPress(Sender: TObject; var Key: Char);
    procedure YearKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2; 
  gpNum, tm, yr:integer;
  spec:string[1];
  progRun:boolean;


implementation

uses Unit1, Unit3;
{$R *.dfm}


procedure TForm2.Button1Click(Sender: TObject);
begin
  if (Length(Group.Text)=0) or (Length(Year.Text)=0) then
  begin
    MessageBox(0,pChar('Заповніть усі поля'),pChar('Попередження'),MB_OK+MB_ICONWARNING);
    exit;
  end;

  gpNum:=StrToInt(Group.Text);

  case Speciality.ItemIndex of
  0: spec:='k';
  1: spec:='b';
  2: spec:='m';
  end;

  if Term.ItemIndex = 0 then
    tm:=gpNum div 10 * 2 -1
  else
    tm:=gpNum div 10 * 2;

  yr:=StrToInt(Year.Text);
  progRun:=true;
  Form1.Visible:=true;
  Form2.Close;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Visible := true;
  if progRun = false then
    Application.Terminate;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  col,row:integer;
begin
  Form1.StringGrid1.ColCount:=3;
  Form1.StringGrid1.RowCount:=2;
  Form2.Hide;
  Form1.N4.Click;
  Form2.Show;
  progRun:=true;
  Form2.Close;
end;

procedure TForm2.GroupKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in['1'..'4',#8]) then key:=#0;
   if ((Length(Group.Text)+1) = 3) and (not (key = #8)) then key:=#0;
end;

procedure TForm2.YearKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in['1'..'9',#8]) then key:=#0;
   if ((Length(Year.Text)+1) = 5) and (not (key = #8)) then key:=#0;
end;

end.
