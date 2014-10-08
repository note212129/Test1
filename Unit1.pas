unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IniFiles, StdCtrls, ComCtrls,Unit4, FileCtrl, ExtCtrls,
  Buttons, XPMan;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    mload: TMenuItem;
    msave: TMenuItem;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Edit2: TEdit;
    RichEdit1: TRichEdit;
    SaveDialog1: TSaveDialog;
    mExit: TMenuItem;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    Timer1: TTimer;
    DriveComboBox1: TDriveComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure mloadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure msaveClick(Sender: TObject);
    procedure mExitClick(Sender: TObject);

    procedure Timer1Timer(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);

    procedure FileListBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure FileLoad;

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  filedir:string;

implementation

{$R *.dfm}

procedure TForm1.mloadClick(Sender: TObject);
begin
    FileLoad;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   DriveComboBox1.DirList:=DirectoryListBox1;
   DirectoryListBox1.FileList:=FileListBox1;
   FileListBox1.FileEdit:=Edit2;
   FileListBox1.Mask:='*.doc';

   Edit1.Text:='';
   Edit2.Text:='';
   RichEdit1.Text:='';

   mload.Caption:='&load';    //快捷鍵設定
   msave.Caption:='s&ave';
   file1.Caption:='&file';

//   Form1.Caption:=OpenDialog1.InitialDir;   //初始路徑
end;

procedure TForm1.msaveClick(Sender: TObject);
var
  FileExe:string;
  mlenght:Integer;
begin
  SaveDialog1.Title:='Please enter File Name only~';
  SaveDialog1.Execute;
  mlenght:=Length(SaveDialog1.FileName);
  FileExe:=Copy(SaveDialog1.FileName,mlenght-3,4);
  if CompareText(FileExe,'.doc')=0 then
      RichEdit1.Lines.SaveToFile(SaveDialog1.FileName)
  else
  RichEdit1.Lines.SaveToFile(SaveDialog1.FileName+'.doc');
end;
procedure TForm1.mExitClick(Sender: TObject);
begin
   close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
{var
//  hour,min,sec,msec:Word;
  msec_str:string;   }
begin
  {  DecodeTime(Now,hour,min,sec,msec);
    msec_str:=IntToStr(msec);  }
    if RichEdit1.Lines.Text ='' then
    begin
       msave.Enabled:=False;
    end
    else
        msave.Enabled:=True;
    Form1.Caption:=DateToStr(Date)+timetostr(Now);//+'.'+msec_str;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  Edit1.Text:=FileListBox1.FileName;
  if FileListBox1.FileName<>''  then
    RichEdit1.Lines.LoadFromFile(FileListBox1.FileName);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
    RichEdit1.Font.Color:=clRed;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
    RichEdit1.Font.Color:=clGreen;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  RichEdit1.Font.Color:=clBlue;
end;

procedure TForm1.FileListBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   RichEdit1.Lines.LoadFromFile(FileListBox1.FileName);
end;

procedure TForm1.FileLoad;
begin
  if   OpenDialog1.Execute=True then
  begin
    filedir:=OpenDialog1.FileName;
    Edit1.Text:=filedir;
    Form1.Caption:=filedir;
    RichEdit1.Lines.LoadFromFile(filedir);
    Form4.Show;
  end;
end;  

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if MessageDlg('leave?',mtConfirmation,[mbYes,mbNo],1)=mryes then
      Exit
    else ;
end;
end.
