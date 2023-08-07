unit UnEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPickers;

type
  TFormEmpresa = class(TForm)
    Panel1: TPanel;
    btncancelar: TBitBtn;
    btnsalvar: TBitBtn;
    btndelete: TBitBtn;
    DataSource1: TDataSource;
    historicoempresas: TClientDataSet;
    historicoempresasid: TIntegerField;
    historicoempresasdescricao: TStringField;
    historicoempresasfuncao: TStringField;
    historicoempresasdatainicio: TDateField;
    historicoempresasdatafinal: TDateField;
    DBGrid1: TDBGrid;
    historicoempresasidfuncionario: TIntegerField;
    Editdescricao: TEdit;
    DtInicio: TDatePicker;
    DtFinal: TDatePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Labelid: TLabel;
    btnadd: TBitBtn;
    Editfuncao: TEdit;
    Label5: TLabel;
    btnalterar: TButton;
    procedure btnsalvarClick(Sender: TObject);
    procedure btnaddClick(Sender: TObject);
    procedure btndeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
  private
    procedure BuscaEmpresaHistorico;
    { Private declarations }
  public
    { Public declarations }
    procedure  LimparLabel;
    procedure habilitabotao;
  end;

var
  FormEmpresa: TFormEmpresa;

implementation

{$R *.dfm}

uses UnFuncionario;

procedure TFormEmpresa.btnalterarClick(Sender: TObject);
begin
  If Application.MessageBox('Confirma a ALTERAÇÃO do registro?', 'ALTERAR Empresa?'
                              ,MB_YESNO + MB_ICONQUESTION) <> IDNO then
  begin
    historicoempresas.Filtered := False;
    historicoempresas.Filter   := 'id ='+Labelid.Caption;
    historicoempresas.Filtered := True;
    historicoempresas.Edit;
    historicoempresas.FieldByName('descricao').AsString     := Editdescricao.Text;
    historicoempresas.FieldByName('funcao').AsString        := Editfuncao.Text;
    historicoempresas.FieldByName('datainicio').AsDateTime  := DtInicio.Date;
    historicoempresas.FieldByName('datafinal').AsDateTime   := DtFinal.Date;
    historicoempresas.Post;
    Labelid.Caption := historicoempresas.FieldByName('id').AsString;
  end;
  BuscaEmpresaHistorico;

  habilitabotao;
end;

procedure TFormEmpresa.btncancelarClick(Sender: TObject);
begin
  LimparLabel;
  habilitabotao;
end;

procedure TFormEmpresa.btnsalvarClick(Sender: TObject);
begin
  if Labelid.Caption = '0' then
  begin
    If Application.MessageBox('Confirma a INSERÇÃO do registro?', 'INSERIR Funcionario?'
                              ,MB_YESNO + MB_ICONQUESTION) <> IDNO then
    begin
      historicoempresas.Filtered := False;
      historicoempresas.Insert;
      historicoempresas.FieldByName('id').AsInteger           := historicoempresas.RecordCount + 1;
      historicoempresas.FieldByName('descricao').AsString     := Editdescricao.Text;
      historicoempresas.FieldByName('funcao').AsString        := Editfuncao.Text;
      historicoempresas.FieldByName('datainicio').AsDateTime  := DtInicio.Date;
      historicoempresas.FieldByName('datafinal').AsDateTime   := DtFinal.Date;
      historicoempresas.FieldByName('idfuncionario').AsString := FormFuncionarios.Labelid.Caption;
      historicoempresas.Post;
      Labelid.Caption := historicoempresas.FieldByName('id').AsString;
      BuscaEmpresaHistorico;
      habilitabotao;
    end;
  end;
end;

procedure TFormEmpresa.btndeleteClick(Sender: TObject);
begin
  if Labelid.Caption = '0' then
    Abort;
  If Application.MessageBox('Confirma a EXCLUSÃO do registro?', 'EXCLUIR Empresa?'
                              ,MB_YESNO + MB_ICONQUESTION) <> IDNO then
  Begin
    historicoempresas.Filtered := False;
    historicoempresas.Filter   := 'id ='+Labelid.Caption;
    historicoempresas.Filtered := True;
    historicoempresas.Delete;
    ShowMessage('Registro da Empresa excluido com sucesso!');
    BuscaEmpresaHistorico;
  End;
end;

procedure TFormEmpresa.btnaddClick(Sender: TObject);
begin
  LimparLabel;
  habilitabotao;
end;

procedure TFormEmpresa.DBGrid1DblClick(Sender: TObject);
begin
  Labelid.Caption       := historicoempresas.FieldByName('id').AsString;
  Editdescricao.Text    := historicoempresas.FieldByName('descricao').AsString;
  Editfuncao.Text       := historicoempresas.FieldByName('funcao').AsString  ;
  DtInicio.Date         := historicoempresas.FieldByName('datainicio').AsDateTime;
  DtFinal.Date          := historicoempresas.FieldByName('datafinal').AsDateTime;
  btnalterar.Enabled  := Labelid.Caption <> '0';
end;

procedure TFormEmpresa.FormCreate(Sender: TObject);
begin
    historicoempresas.FileName := ExtractFilePath(Application.ExeName)+'historicoempresas'

end;

procedure TFormEmpresa.FormShow(Sender: TObject);
begin
  historicoempresas.Open;
  BuscaEmpresaHistorico;
  LimparLabel;
end;

procedure TFormEmpresa.habilitabotao;
begin
  btncancelar.Enabled := not  btncancelar.Enabled;
  btnsalvar.Enabled   := not  btnsalvar.Enabled;
  btndelete.Enabled   := not  btndelete.Enabled;
  btnadd.Enabled      := not  btnadd.Enabled;
  btnalterar.Enabled  := Labelid.Caption <> '0';
end;

procedure TFormEmpresa.LimparLabel;
begin
  Labelid.Caption := '0';
  Editdescricao.Clear;
  Editfuncao.Clear;
  DtInicio.Date := Now;
  DtFinal.Date := Now;
end;

procedure TFormEmpresa.BuscaEmpresaHistorico;
begin
  historicoempresas.Filtered := False;
  historicoempresas.Filter := 'idfuncionario =' + FormFuncionarios.Labelid.Caption;
  historicoempresas.Filtered := True;
end;

end.
