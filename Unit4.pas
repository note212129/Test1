unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl;

type
  TForm4 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4 : TForm4;
  mbreak: Boolean=False;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var
  i:Integer;
  str:string;
begin
  str:='Load';
  for i:=0 to 2 do
  begin
     str:=str+'.';
     Button1.Caption:=str;
     Sleep(300);  //Delay x msec
  end;
  close;
end;
end.
