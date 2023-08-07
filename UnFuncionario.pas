unit UnFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Datasnap.Provider, Vcl.StdCtrls, Vcl.ExtCtrls,ShellAPI,
  Vcl.Buttons;

type
  TFormFuncionarios = class(TForm)
    funcionario: TClientDataSet;
    funcionarioid: TIntegerField;
    funcionarionome: TStringField;
    funcionariotelefone: TStringField;
    funcionariolinkedin: TStringField;
    funcionariogithub: TStringField;
    funcionariocep: TStringField;
    funcionarioempresa: TIntegerField;
    DsFuncionario: TDataSource;
    DspFuncionario: TDataSetProvider;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panelsearch: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid2: TDBGrid;
    EditSearch: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditNome: TEdit;
    Edittelefone: TEdit;
    Editcep: TEdit;
    Editlikedin: TEdit;
    Editgithub: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Labelid: TLabel;
    BitBtn1: TBitBtn;
    procedure EditSearchKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button6Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure LimparEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbrirSite(Pcaminho:Pchar);
  end;

var
  FormFuncionarios: TFormFuncionarios;

implementation

{$R *.dfm}

uses UnEmpresa;

procedure TFormFuncionarios.AbrirSite(Pcaminho: Pchar);
begin
  ShellExecute(Handle,
               'open',
               Pcaminho,
               nil,
               nil,
               SW_SHOWMAXIMIZED);
end;

procedure TFormFuncionarios.BitBtn1Click(Sender: TObject);
begin
  if Labelid.Caption = '0' then
    raise Exception.Create('Grave os dados do funconario antes!');


  // abrir o forme da empresa
  Application.CreateForm(TFormEmpresa,FormEmpresa);  
  FormEmpresa.ShowModal;
  FreeAndNil(FormEmpresa);
end;

procedure TFormFuncionarios.Button1Click(Sender: TObject);
begin
  EditSearch.SetFocus;
end;

procedure TFormFuncionarios.Button2Click(Sender: TObject);
begin
  LimparEdit;
  EditNome.SetFocus;
end;

procedure TFormFuncionarios.Button3Click(Sender: TObject);
begin
  If Application.MessageBox('Confirma a EXCLUSÃO do registro?', 'EXCLUIR Funcionario?'
                              ,MB_YESNO + MB_ICONQUESTION) <> IDNO then
  Begin
    funcionario.Filtered := False;
    funcionario.Filter   := 'id ='+Labelid.Caption;
    funcionario.Filtered := True;
    funcionario.Delete;
    ShowMessage('Funcionario excluido com sucesso!');
  End;
end;

procedure TFormFuncionarios.Button4Click(Sender: TObject);
var wsite:PChar;
begin
  AbrirSite(Pchar(Editlikedin.Text));
end;

procedure TFormFuncionarios.Button5Click(Sender: TObject);
begin
  AbrirSite(Pchar(Editgithub.Text));
end;

procedure TFormFuncionarios.Button6Click(Sender: TObject);
begin
  if Labelid.Caption = '0' then
  begin
    If Application.MessageBox('Confirma a INSERÇÃO do registro?', 'INSERIR Funcionario?'
                              ,MB_YESNO + MB_ICONQUESTION) <> IDNO then
    begin
      funcionario.Filtered := False;
      funcionario.Insert;
      funcionario.FieldByName('id').AsInteger      := funcionario.RecordCount + 1;
      funcionario.FieldByName('nome').AsString     := EditNome.Text;
      funcionario.FieldByName('telefone').AsString := Edittelefone.Text;
      funcionario.FieldByName('cep').AsString      := Editcep.Text;
      funcionario.FieldByName('linkedin').AsString := Editlikedin.Text;
      funcionario.FieldByName('github').AsString   := Editgithub.Text;
      funcionario.Post;
      Labelid.Caption := funcionario.FieldByName('id').AsString;
    end;
  end
  else
  begin
    If Application.MessageBox('Confirma a ALTERAÇÃO do registro?', 'ALTERAR Funcionario?'
                              ,MB_YESNO + MB_ICONQUESTION) <> IDNO then
    begin
      funcionario.Filtered := False;
      funcionario.Filter   := 'id ='+Labelid.Caption;
      funcionario.Filtered := True;
      funcionario.Edit;
      funcionario.FieldByName('nome').AsString     := EditNome.Text;
      funcionario.FieldByName('telefone').AsString := Edittelefone.Text;
      funcionario.FieldByName('cep').AsString      := Editcep.Text;
      funcionario.FieldByName('linkedin').AsString := Editlikedin.Text;
      funcionario.FieldByName('github').AsString   := Editgithub.Text;
      funcionario.Post;
    end;
  end;

end;

procedure TFormFuncionarios.Button7Click(Sender: TObject);
begin
  LimparEdit;
  EditNome.SetFocus;
end;

procedure TFormFuncionarios.DBGrid2DblClick(Sender: TObject);
begin
  EditNome.Text     := funcionario.FieldByName('nome').AsString;
  Edittelefone.Text := funcionario.FieldByName('telefone').AsString;
  Editcep.Text      := funcionario.FieldByName('cep').AsString;
  Editlikedin.Text  := funcionario.FieldByName('linkedin').AsString;
  Editgithub.Text   := funcionario.FieldByName('github').AsString;
  Labelid.Caption   := funcionario.FieldByName('id').AsString;
end;

procedure TFormFuncionarios.EditSearchKeyPress(Sender: TObject; var Key: Char);
begin
 funcionario.Filtered := False;
 funcionario.Filter   := 'nome like '''+EditSearch.Text+'%''';
 funcionario.Filtered := True;

end;

procedure TFormFuncionarios.FormCreate(Sender: TObject);
begin

  funcionario.FileName := ExtractFilePath(Application.ExeName)+'funcionario'
end;

procedure TFormFuncionarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
  end
end;

procedure TFormFuncionarios.FormShow(Sender: TObject);
begin
  funcionario.Open;
end;

procedure TFormFuncionarios.LimparEdit;
begin
  EditNome.Text     := EmptyStr;
  Edittelefone.Text := EmptyStr;
  Editcep.Text      := EmptyStr;
  Editlikedin.Text  := EmptyStr;
  Editgithub.Text   := EmptyStr;
  Labelid.Caption   := '0'
end;

end.

