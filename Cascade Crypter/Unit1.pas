unit Unit1;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Button7: TButton;
    Button6: TButton;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    ComboBox2: TComboBox;
    Label4: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    SaveDialog1: TSaveDialog;
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure disable;
    procedure enable;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  CSign, CCharacters : String;
  Cc: Char;
  Cn: Integer;
  abort : boolean;

implementation

{$R *.dfm}
procedure TForm1.disable;
begin
  Button1.Enabled := false;
  Button2.Enabled := false;
  Button3.Enabled := false;
  Button6.Enabled := false;
  Button7.Enabled := false;
  ComboBox1.Enabled := false;
  ComboBox2.Enabled := false;
  SpinEdit1.Enabled := false;
  Label1.Enabled := false;
  Label2.Enabled := false;
  Label4.Enabled := false;
end;

procedure TForm1.enable;
begin
  Button1.Enabled := true;
  Button2.Enabled := true;
  Button3.Enabled := true;
  Button6.Enabled := true;
  Button7.Enabled := true;
  ComboBox2.Enabled := true;
  ComboBox2.OnChange(self);
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Memo1.Lines.SaveToFile(SaveDialog1.FileName + '.txt');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  abort := true;
  enable;
  Screen.Cursor := crDefault;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  Ci, Cj, Num : Integer;
  Buffer : Int64;
begin
    if Memo1.Text = '' then
    begin
      Beep;
      ShowMessage('No Data to decrypt !');
      Exit;
    end;

    disable;
    abort := false;
    Buffer := SpinEdit1.Value;
    Num := Memo1.Lines.count;
    if Copy(Memo1.Lines[0],1,7) = 'codiert' then
    begin
      for Cj := 0 to Memo1.Lines.count do
        begin
          CSign := Memo1.Lines[Cj];
          if length(CSign) > 0 then
          begin
            CCharacters := '';
            for Ci := 1 to  length(CSign) do
            begin
              Cc := CSign[Ci];

              // decrypt mode setting
            case ComboBox2.ItemIndex of
              0 : Cn := ord(Cc) - 1;
              1 : Cn := ord(Cc) - StrToInt(ComboBox1.Text);
              2 : Cn := ord(Cc) - StrToInt(ComboBox1.Text) * Buffer;
            end;

              CCharacters := CCharacters + chr(Cn);
            end;

            Memo1.Lines[Cj] := CCharacters;
            StatusBar1.Panels[1].Text := IntToStr(Cj);
            if abort = true then Exit;
            StatusBar1.Panels[3].Text := 'decrypting please wait..';
            Application.ProcessMessages;
          end;
        end;
      Cj := length(Memo1.Lines[0]);
      Memo1.Lines[0] := copy(Memo1.Lines[0],8,Cj);
    end;
    StatusBar1.Panels[3].Text := 'finish.';
    enable;
    if (Memo1.Lines.count <> Num) then
    ShowMessage('Dont save!' + #13#10 +
                'The number of lines is no longer correct.' + #13#10 +
                'At least one line was too long.');

end;

procedure TForm1.Button7Click(Sender: TObject);
var
  Ci, Cj, Num : Integer;
  Buffer : Int64;
begin
    if Memo1.Text = '' then
    begin
      Beep;
      ShowMessage('No Data to encrypt !');
      Exit;
    end;

    Screen.Cursor := crHourGlass;

    disable;
    abort := false;
    Buffer := SpinEdit1.Value;
    Num := Memo1.Lines.count;
    for Cj := 0 to Memo1.Lines.count do
    begin
      CSign := Memo1.Lines[Cj];
      if length(CSign) > 0 then
      begin
        CCharacters := '';
        for Ci := 1 to  length(CSign) do
        begin
          Cc := CSign[Ci];

          // crypt mode setting
          case ComboBox2.ItemIndex of
            0 : Cn := ord(Cc) + 1;
            1 : Cn := ord(Cc) + StrToInt(ComboBox1.Text);
            2 : Cn := ord(Cc) + StrToInt(ComboBox1.Text) * Buffer;
          end;

          CCharacters := CCharacters + chr(Cn);
        end;
        Memo1.Lines[Cj] := CCharacters;
        StatusBar1.Panels[1].Text := IntToStr(Cj);
        if abort = true then Exit;
        StatusBar1.Panels[3].Text := 'encrypting please wait..';
        Application.ProcessMessages;
      end;
    end;
    Memo1.Lines[0] := 'codiert' + Memo1.Lines[0];
    StatusBar1.Panels[3].Text := 'finish.';
    enable;
    Screen.Cursor := crDefault;
    if (Memo1.Lines.count <> Num) then
    ShowMessage('Dont save!' + #13#10 +
                'The number of lines is no longer correct.' + #13#10 +
                'At least one line was too long.');
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  case ComboBox2.ItemIndex of
            0 : begin
                  Label1.Enabled := false;
                  Label2.Enabled := false;
                  ComboBox1.Enabled := false;
                  SpinEdit1.Enabled := false;
                end;



            1 : begin
                  Label1.Enabled := true;
                  Label2.Enabled := false;
                  ComboBox1.Enabled := true;
                  SpinEdit1.Enabled := false;
                end;

            2 : begin
                  Label1.Enabled := true;
                  Label2.Enabled := true;
                  ComboBox1.Enabled := true;
                  SpinEdit1.Enabled := true;
                end;
          end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.DoubleBuffered := true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ComboBox2.OnChange(sender);
  Panel1.SetFocus;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count);
end;

end.
