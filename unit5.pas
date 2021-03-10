unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation
    uses
      unit4;
{$R *.lfm}

    { TForm3 }

    procedure TForm3.Button1Click(Sender: TObject);
    begin
      Form3.Hide;
    end;

procedure TForm3.FormCreate(Sender: TObject);
begin

end;

end.

