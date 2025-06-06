within IBPSA.Fluid.HeatPumps.ModularReversible;
model Modular
  "Grey-box model for reversible and non-reversible heat pumps"
  extends
    IBPSA.Fluid.HeatPumps.ModularReversible.BaseClasses.PartialReversibleRefrigerantMachine(
    final use_COP=true,
    final use_EER=use_rev,
    con(preDro(m_flow(nominal=QHea_flow_nominal/1000/10))),
    eva(preDro(m_flow(nominal=QHea_flow_nominal/1000/10))),
    final PEle_nominal=refCyc.refCycHeaPumHea.PEle_nominal,
    mCon_flow_nominal=QHea_flow_nominal/(dTCon_nominal*cpCon),
    mEva_flow_nominal=(QHea_flow_nominal - PEle_nominal)/(dTEva_nominal*cpEva),
    use_rev=false,
    redeclare final IBPSA.Fluid.HeatPumps.ModularReversible.BaseClasses.RefrigerantCycle refCyc(
      redeclare model RefrigerantCycleHeatPumpHeating =
          RefrigerantCycleHeatPumpHeating,
      redeclare model RefrigerantCycleHeatPumpCooling =
          RefrigerantCycleHeatPumpCooling,
      final allowDifferentDeviceIdentifiers=allowDifferentDeviceIdentifiers));
  parameter Modelica.Units.SI.HeatFlowRate QHea_flow_nominal(min=Modelica.Constants.eps)
    "Nominal heating capacity"
    annotation (Dialog(group="Nominal condition"));
  parameter Modelica.Units.SI.HeatFlowRate QCoo_flow_nominal(max=0)=0
    "Nominal cooling capacity"
      annotation(Dialog(group="Nominal condition - Cooling", enable=use_rev));

  replaceable model RefrigerantCycleHeatPumpHeating =
    IBPSA.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.BaseClasses.PartialHeatPumpCycle
      (PEle_nominal=0)
       constrainedby
    IBPSA.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.BaseClasses.PartialHeatPumpCycle(
       final useInHeaPum=true,
       final QHea_flow_nominal=QHea_flow_nominal,
       final TCon_nominal=TConHea_nominal,
       final TEva_nominal=TEvaHea_nominal,
       final cpCon=cpCon,
       final cpEva=cpEva)
  "Refrigerant cycle module for the heating mode"
    annotation (choicesAllMatching=true);

  replaceable model RefrigerantCycleHeatPumpCooling =
      IBPSA.Fluid.Chillers.ModularReversible.RefrigerantCycle.BaseClasses.NoCooling
      constrainedby
    IBPSA.Fluid.Chillers.ModularReversible.RefrigerantCycle.BaseClasses.PartialChillerCycle(
       final useInChi=false,
       final cpCon=cpCon,
       final cpEva=cpEva,
       final TCon_nominal=TEvaCoo_nominal,
       final TEva_nominal=TConCoo_nominal,
       QCoo_flow_nominal=QCoo_flow_nominal)
  "Refrigerant cycle module for the cooling mode"
    annotation (Dialog(enable=use_rev),choicesAllMatching=true);
  parameter Modelica.Units.SI.Temperature TConHea_nominal
    "Nominal temperature of the heated fluid during heating mode"
    annotation (Dialog(group="Nominal condition"));
  parameter Modelica.Units.SI.Temperature TEvaHea_nominal
    "Nominal temperature of the cooled fluid during heating mode"
    annotation (Dialog(group="Nominal condition"));
  parameter Modelica.Units.SI.Temperature TConCoo_nominal
    "Nominal temperature of the cooled fluid during cooling mode"
    annotation(Dialog(enable=use_rev, group="Nominal condition - Cooling"));
  parameter Modelica.Units.SI.Temperature TEvaCoo_nominal
    "Nominal temperature of the heated fluid during cooling mode"
    annotation(Dialog(enable=use_rev, group="Nominal condition - Cooling"));

  Modelica.Blocks.Sources.BooleanConstant conHea(final k=true)
    if not use_busConOnl and not use_rev
    "Locks the device in heating mode if designated to be not reversible" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-130})));
  Modelica.Blocks.Interfaces.BooleanInput hea if not use_busConOnl and use_rev
    "=true for heating, =false for cooling"
    annotation (Placement(transformation(extent={{-164,-82},{-140,-58}}),
        iconTransformation(extent={{-120,-30},{-102,-12}})));
  Modelica.Blocks.Logical.Hysteresis hys(
    final uLow=0.001,
    final uHigh=ySet_small,
    final pre_y_start=false)
    "Outputs whether the device is on based on the relative speed"
    annotation (Placement(
      transformation(extent={{10,10},{-10,-10}}, rotation=180, origin={-110,-90})));

initial equation
  assert(TEvaHea_nominal < TConHea_nominal,
    "In " + getInstanceName() +": Wrong parameterization. Require TEvaHea_nominal < TConHea_nominal.
    Received TEvaHea_nominal = " + String(TEvaHea_nominal) + "
             TConHea_nominal = " + String(TConHea_nominal) + ".");
  // If the heat pump is also used for cooling, then QCoo_flow_nominal << 0.
  // Hence the first test is false and we require the correct entry of the temperatures.
  // If it is not used for cooling, then QCoo_flow_nominal = 0, and the temperature entry
  // won't be checked for correctness.
  assert(QCoo_flow_nominal > -1E-6 or TConCoo_nominal < TEvaCoo_nominal,
    "In " + getInstanceName() +": Wrong parameterization. Require TConCoo_nominal < TEvaCoo_nominal.
    Received TConCoo_nominal = " + String(TConCoo_nominal) + "
             TEvaCoo_nominal = " + String(TEvaCoo_nominal) + ".");
equation
  connect(conHea.y, sigBus.hea)
    annotation (Line(points={{-99,-130},{-76,-130},{-76,-40},{-140,-40},{-140,-41},
          {-141,-41}},          color={255,0,255}));
  connect(hea, sigBus.hea)
    annotation (Line(points={{-152,-70},{-128,-70},{-128,-40},{-134,-40},{-134,-41},
          {-141,-41}}, color={255,0,255}));
  connect(eff.QUse_flow, refCycIneCon.y) annotation (Line(points={{98,37},{48,37},
          {48,66},{8.88178e-16,66},{8.88178e-16,61}}, color={0,0,127}));
  connect(eff.hea, sigBus.hea) annotation (Line(points={{98,30},{48,30},{48,0},{
          26,0},{26,-30},{-20,-30},{-20,-41},{-141,-41}}, color={255,0,255}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(hys.y, sigBus.onOffMea) annotation (Line(points={{-99,-90},{-88,-90},
          {-88,-70},{-128,-70},{-128,-40},{-134,-40},{-134,-41},{-141,-41}},
                                           color={255,0,255}));
  connect(hys.u, sigBus.yMea) annotation (Line(points={{-122,-90},{-132,-90},{
          -132,-40},{-136,-40},{-136,-41},{-141,-41}},
                       color={0,0,127}));
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
          Text(
          extent={{-100,-12},{-72,-30}},
          textColor={255,85,255},
          visible=not use_busConOnl and use_rev,
          textString="hea")}),
    Diagram(coordinateSystem(extent={{-140,-160},{140,160}})),
    Documentation(revisions="<html>
  <ul>
  <li>
  May 23, 2025, by Michael Wetter:<br/>
  Added assertion against wrong parameterization.<br/>
  This is for
  <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/2013\">IBPSA #2013</a>.
  </li>
  <li>
    February 25, 2025, by Antoine Gautier:<br/>
    Added hysteresis that was removed from base class.<br/>
    This is for
    <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1977\">IBPSA #1977</a>.
  </li>
  <li>
    May 2, 2024, by Michael Wetter:<br/>
    Refactored check for device identifiers.<br/>
    This is for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">IBPSA, #1576</a>.
  </li>
  <li>
    <i>October 2, 2022</i> by Fabian Wuellhorst:<br/>
    Adjusted based on the discussion in this issue <a href=
    \"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">#1576</a>)
  </li>
  <li>
    <i>May 22, 2019</i> by Julian Matthes:<br/>
    Rebuild due to the introducion of the thermal machine partial model
    (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/715\">AixLib #715</a>)
  </li>
  <li>
    <i>November 26, 2018,</i> by Fabian Wuellhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">AixLib #577</a>)
  </li>
</ul>
</html>", info="<html>
<p>
  Model of a reversible, modular heat pump.
  This models allows combining any of the available modules
  for refrigerant heating or cooling cycles, inertias,
  heat losses, and safety controls.
  All features are optional.
</p>
<p>
  Adding to the partial model (
  <a href=\"modelica://IBPSA.Fluid.HeatPumps.ModularReversible.BaseClasses.PartialReversibleRefrigerantMachine\">
  IBPSA.Fluid.HeatPumps.ModularReversible.BaseClasses.PartialReversibleRefrigerantMachine</a>),
  this model has the <code>hea</code> signal to choose
  the operation mode of the heat pump.
</p>
<p>
  For more information on the approach, see
  <a href=\"modelica://IBPSA.Fluid.HeatPumps.ModularReversible.UsersGuide\">
  IBPSA.Fluid.HeatPumps.ModularReversible.UsersGuide</a>.
</p>
</html>"));
end Modular;
