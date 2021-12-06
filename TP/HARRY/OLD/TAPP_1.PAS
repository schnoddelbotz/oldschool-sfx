Program SenSeil;
Uses App;
TYPE PSensApp=^SensApp;
      SensApp=OBJECT(TApplication)
      END;
VAR SApp:SensApp;
BEGIN
 SApp.Init;
 SApp.Run;
 SApp.Done;
END.