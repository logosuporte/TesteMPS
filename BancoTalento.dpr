program BancoTalento;

uses
  Vcl.Forms,
  UnFuncionario in 'UnFuncionario.pas' {FormFuncionarios},
  UnEmpresa in 'UnEmpresa.pas' {FormEmpresa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormFuncionarios, FormFuncionarios);
  Application.Run;
end.
