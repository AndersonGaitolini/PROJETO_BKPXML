program SRVSnapMaxXML;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uFoServerSnapPrincipal in '..\fontes\SeverSnap\uFoServerSnapPrincipal.pas' {foServerSnapPrincipal},
  uDataModuleSRVMetodos in '..\fontes\SeverSnap\uDataModuleSRVMetodos.pas' {dmSRVMetodos: TDSServerModule},
  uDataModuleWSRVMetodos in '..\fontes\SeverSnap\uDataModuleWSRVMetodos.pas' {dmWSRVMetodos: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfoServerSnapPrincipal, foServerSnapPrincipal);
  Application.Run;
end.
