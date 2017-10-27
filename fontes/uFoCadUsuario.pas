unit uFoCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufoLoginPadrao, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfoCadUsuario = class(TfoLoginPadrao)
    ed1: TEdit;
    lb1: TLabel;
    lb2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  foCadUsuario: TfoCadUsuario;

implementation

{$R *.dfm}

end.
