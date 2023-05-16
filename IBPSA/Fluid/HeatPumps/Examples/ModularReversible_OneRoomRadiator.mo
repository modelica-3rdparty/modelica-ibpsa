within IBPSA.Fluid.HeatPumps.Examples;
model ModularReversible_OneRoomRadiator
  "Modular reversible heat pump connected to a simple room model with radiator"
  extends BaseClasses.PartialOneRoomRadiator(sin(nPorts=1), booToReaPumEva(
        realTrue=modRevHeaPump.mEva_flow_nominal));
  ModularReversible modRevHeaPump(
    redeclare package MediumCon = MediumW,
    redeclare package MediumEva = MediumW,
    QUse_flow_nominal=Q_flow_nominal,
    y_nominal=1,
    redeclare model RefrigerantCycleInertia =
        IBPSA.Fluid.HeatPumps.RefrigerantCycleModels.RefrigerantCycleInertias.NoInertia,
    use_internalSafetyControl=true,
    TCon_nominal=TRadSup_nominal,
    dTCon_nominal=TRadSup_nominal - TRadRet_nominal,
    mCon_flow_nominal=mHeaPum_flow_nominal,
    dpCon_nominal(displayUnit="Pa") = 2000,
    use_conCap=true,
    CCon=3000,
    GConOut=100,
    GConIns=1000,
    TEva_nominal=sou.T,
    dTEva_nominal=5,
    mEva_flow_nominal=mHeaPum_flow_nominal,
    dpEva_nominal(displayUnit="Pa") = 2000,
    use_evaCap=false,
    CEva=0,
    GEvaOut=0,
    GEvaIns=0,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare model RefrigerantCycleHeatPumpHeating =
        IBPSA.Fluid.HeatPumps.RefrigerantCycleModels.ConstantQualityGrade (
        redeclare
          IBPSA.Fluid.HeatPumps.RefrigerantCycleModels.Frosting.NoFrosting
          iceFacCal,
        useAirForCon=false,
        useAirForEva=false,
        TAppCon_nominal=0,
        TAppEva_nominal=0),
    redeclare model RefrigerantCycleHeatPumpCooling =
        IBPSA.Fluid.Chillers.RefrigerantCycleModels.EuropeanNorm2D (redeclare
          IBPSA.Fluid.HeatPumps.RefrigerantCycleModels.Frosting.NoFrosting
          iceFacCal, datTab=
            IBPSA.Fluid.Chillers.RefrigerantCycleModels.EuropeanNorm2DData.EN14511.Vitocal200AWO201()),
    redeclare
      IBPSA.Fluid.HeatPumps.SafetyControls.RecordsCollection.DefaultHeatPumpSafetyControl
      safCtrlPar(use_antFre=true, TAntFre=275.15))
    "Modular reversible heat pump"
    annotation (Placement(transformation(extent={{20,-160},{0,-136}})));

  Modelica.Blocks.Sources.Constant temAmbBas(final k=273.15 + 18)
    "Ambient temperature in basement of building" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-190})));
equation
  connect(modRevHeaPump.port_b2, sin.ports[1]) annotation (Line(points={{20,-154},
          {38,-154},{38,-200},{60,-200}}, color={0,127,255}));
  connect(modRevHeaPump.port_a2, pumHeaPumSou.port_b) annotation (Line(points={
          {0,-154},{-30,-154},{-30,-170}}, color={0,127,255}));
  connect(modRevHeaPump.port_b1, pumHeaPum.port_a) annotation (Line(points={{0,
          -142},{-70,-142},{-70,-120}}, color={0,127,255}));
  connect(modRevHeaPump.port_a1, temRet.port_b) annotation (Line(points={{20,-142},
          {60,-142},{60,-30}}, color={0,127,255}));
  connect(temAmbBas.y, modRevHeaPump.TConAmb) annotation (Line(points={{10,-179},
          {10,-162},{-1,-162},{-1,-138}}, color={0,0,127}));
  connect(modRevHeaPump.hea, oneRooRadHeaPumCtrl.hea) annotation (Line(points={
          {21.6,-157},{24,-157},{24,-152},{26,-152},{26,-92},{-132,-92},{-132,-76},
          {-139,-76}}, color={255,0,255}));
  connect(oneRooRadHeaPumCtrl.ySet, modRevHeaPump.ySet) annotation (Line(points=
         {{-139,-66},{30,-66},{30,-146},{21.6,-146}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>This example demonstrates how to use the <a href=\"IBPSA.Fluid.HeatPumps.ModularReversible\">ModularReversible</a> heat pump model directly. </p>
<p>Correct replacement of the replaceable submodels and, thus, flexible aggregation to a new model approach is demonstrated.</p>
<p>Please check the documentation of <a href=\"IBPSA.Fluid.HeatPumps.Examples.BaseClasses.PartialOneRoomRadiator\">IBPSA.Fluid.HeatPumps.Examples.BaseClasses.PartialOneRoomRadiator</a> for further information on the example.</p>
</html>"),
   __Dymola_Commands(file=
     "modelica://IBPSA/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/ModularReversible_OneRoomRadiator.mos"
        "Simulate and plot"),
  experiment(
      StartTime=0,
      StopTime=86400,
      Tolerance=1e-08,
      __Dymola_Algorithm="Dassl"));
end ModularReversible_OneRoomRadiator;