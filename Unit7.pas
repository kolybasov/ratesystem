unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  gpList,tmList:integer;
  specList:string[1];
  btnPressed:boolean;

implementation

uses Unit6, Unit1, Unit2;

{$R *.dfm}
procedure TForm7.Button1Click(Sender: TObject);
begin   
  if Length(Edit1.Text)=0 then
  begin
    MessageBox(0,pChar('Заповніть усі поля'),pChar('Попередження'),MB_OK+MB_ICONWARNING);
    exit;
  end;
  btnPressed:=true;
  Form7.Close;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin  
  gpList:=StrToInt(Edit1.Text);
  case ComboBox1.ItemIndex of
  0: specList:='k';     
  1: specList:='b';
  2: specList:='m';
  end;
  if RadioGroup1.ItemIndex = 0 then
    tmList:=gpList div 10 * 2 -1
  else
    tmList:=gpList div 10 * 2;
  savePath:=ExtractFilePath(Application.ExeName)+'subjects/'+specList+'/'+IntToStr(gpList)+'/'+IntToStr(tmList)+'.txt';
  tm:=tmList;
  gpNum:=gpList;
  spec:=specList;
end;

procedure TForm7.Edit1KeyPress(Sender: TObject; var Key: Char);
begin  
   if not (key in['1'..'4',#8]) then key:=#0;
   if ((Length(edit1.text)+1) = 3) and (not (key = #8)) then key:=#0;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  btnPressed:=false;
end;

procedure TForm7.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CAnClose:=btnPressed;
end;

end.
