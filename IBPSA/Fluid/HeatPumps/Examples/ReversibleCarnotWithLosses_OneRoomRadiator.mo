within IBPSA.Fluid.HeatPumps.Examples;
model ReversibleCarnotWithLosses_OneRoomRadiator
  "Reversible heat pump with carnot approach connected to a simple room model with radiator"
  extends BaseClasses.PartialOneRoomRadiator(sin(nPorts=1), booToReaPumEva(
        realTrue=revCarWitLosHeaPum.mEva_flow_nominal));
  parameter Real perHeaLos=0.1
    "Percentage of heat losses in the heat exchangers to the nominal heating power";
  ReversibleCarnotWithLosses revCarWitLosHeaPum(
    redeclare package MediumCon = MediumW,
    redeclare package MediumEva = MediumW,
    QUse_flow_nominal=Q_flow_nominal,
    y_nominal=1,
    use_rev=true,
    use_internalSafetyControl=true,
    TCon_nominal=TRadSup_nominal,
    dTCon_nominal=TRadSup_nominal - TRadRet_nominal,
    mCon_flow_nominal=mHeaPum_flow_nominal,
    dpCon_nominal(displayUnit="Pa") = 2000,
    CCon=5000,
    GConOut=perHeaLos*Q_flow_nominal/(TRadSup_nominal - temAmbBas.k),
    GConIns=20000,
    TEva_nominal=sou.T,
    dTEva_nominal=5,
    mEva_flow_nominal=mHeaPum_flow_nominal,
    dpEva_nominal(displayUnit="Pa") = 2000,
    CEva=5000,
    GEvaOut=perHeaLos*Q_flow_nominal/(temAmbBas.k - sou.T),
    GEvaIns=20000,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare
      IBPSA.Fluid.HeatPumps.SafetyControls.RecordsCollection.DefaultHeatPumpSafetyControl
      safCtrlPar,
    quaGra=0.4,
    refIneFre_constant=0.003,
    nthOrder=3) "Reversible heat pump with losses and carnot approach"
    annotation (Placement(transformation(extent={{20,-162},{0,-138}})));
  Modelica.Blocks.Sources.Constant temAmbBas(final k=273.15 + 18)
    "Ambient temperature in basement of building" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-190})));
equation
  connect(revCarWitLosHeaPum.port_b2, sin.ports[1]) annotation (Line(points={{20,-156},
          {38,-156},{38,-200},{60,-200}},       color={0,127,255}));
  connect(revCarWitLosHeaPum.port_a2, pumHeaPumSou.port_b) annotation (Line(
        points={{0,-156},{-30,-156},{-30,-170}}, color={0,127,255}));
  connect(revCarWitLosHeaPum.port_b1, pumHeaPum.port_a) annotation (Line(points={{0,-144},
          {-70,-144},{-70,-120}},          color={0,127,255}));
  connect(revCarWitLosHeaPum.port_a1, temRet.port_b) annotation (Line(points={{20,-144},
          {60,-144},{60,-30}},       color={0,127,255}));
  connect(temAmbBas.y, revCarWitLosHeaPum.TEvaAmb) annotation (Line(points={{10,-179},
          {10,-166},{-6,-166},{-6,-160},{-1,-160}},       color={0,0,127}));
  connect(temAmbBas.y, revCarWitLosHeaPum.TConAmb) annotation (Line(points={{10,-179},
          {10,-166},{-6,-166},{-6,-140},{-1,-140}},       color={0,0,127}));

  connect(oneRooRadHeaPumCtrl.hea, revCarWitLosHeaPum.hea) annotation (Line(
        points={{-139,-76},{-94,-76},{-94,-166},{28,-166},{28,-159},{21.6,-159}},
        color={255,0,255}));
  connect(oneRooRadHeaPumCtrl.ySet, revCarWitLosHeaPum.ySet) annotation (Line(
        points={{-139,-66},{28,-66},{28,-148},{21.6,-148}}, color={0,0,127}));
  annotation (
   __Dymola_Commands(file=
     "modelica://IBPSA/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/ReversibleCarnotWithLosses_OneRoomRadiator.mos"
        "Simulate and plot"),
  experiment(
      StartTime=0,
      StopTime=86400,
      Tolerance=1e-08,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>This example demonstrates how to use the <a href=\"IBPSA.Fluid.HeatPumps.ReversibleCarnotWithLosses\">IBPSA.Fluid.HeatPumps.ReversibleCarnotWithLosses</a> heat pump model. </p>
<p>Please check the documentation of <a href=\"IBPSA.Fluid.HeatPumps.Examples.BaseClasses.PartialOneRoomRadiator\">IBPSA.Fluid.HeatPumps.Examples.BaseClasses.PartialOneRoomRadiator</a> for further information on the example.</p>
</html>"));
end ReversibleCarnotWithLosses_OneRoomRadiator;