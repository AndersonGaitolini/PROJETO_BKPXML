unit uFoConsUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFoConsultaPadrao, Data.DB, Vcl.ToolWin,
  Vcl.ComCtrls, JvExComCtrls, JvToolBar, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList;

type
  TfoConsUsuario = class(TfoConsultaPadrao)
    ilCadastro: TImageList;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
    procedure pShowTabela;
  public
    { Public declarations }
  end;

var
  foConsUsuario: TfoConsUsuario;

implementation

uses
  uDMnfebkp, Usuarios, uFoCadUsuario, uMetodosUteis;

{$R *.dfm}

procedure TfoConsUsuario.btnInserirClick(Sender: TObject);
begin
  inherited;
  foCadUsuario := TfoCadUsuario.Create(Application);
  try
    wOpe := opInserir;
    foCadUsuario.ShowModal;

  finally
    FreeAndNil(foCadUsuario);
  end;
end;

procedure TfoConsUsuario.FormShow(Sender: TObject);
begin
  inherited;
 //pAbre
end;

procedure TfoConsUsuario.pShowTabela;
var wDataSetAux : TDataSet;
    wSQL : string;
begin
  wDataSetAux := TDataSet.Create(Application);
  try
  with daoUsuarios, DM_NFEDFE do
  begin

    wSQL := '';
    wSQL := wSQL + '';
    wSQL := wSQL + 'Select * from Usuarios order by id asc';
    wDataSetAux := Dao.ConsultaSql(wSQL);
    provConfiguracoes.DataSet := wDataSetAux;
    cdsConfiguracoes.Close;
    cdsConfiguracoes.Open;
  end;
  finally
    FreeAndNil(wDataSetAux);
  end;
end;

end.
