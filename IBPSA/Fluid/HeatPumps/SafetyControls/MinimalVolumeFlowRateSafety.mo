within IBPSA.Fluid.HeatPumps.SafetyControls;
block MinimalVolumeFlowRateSafety
  "Safety control for minimal volume flow rate"
  extends BaseClasses.PartialSafetyControlWithErrors;
  parameter Boolean use_minFlowCtrl=true "=false to disable minimal mass flow rate requirements"
   annotation(choices(checkBox=true));
  parameter Modelica.Units.SI.MassFlowRate m_flowEvaMin
    "Minimal mass flow rate in evaporator required to operate the device"
    annotation (Dialog(enable=use_minFlowCtrl));
  parameter Modelica.Units.SI.MassFlowRate m_flowConMin
    "Minimal mass flow rate in condenser required to operate the device"
    annotation (Dialog(enable=use_minFlowCtrl));
  Modelica.Blocks.Logical.Hysteresis hysteresisCon(
    final uLow=m_flowConMin,
    final uHigh=max(m_flowConMin*1.1, Modelica.Constants.eps),
                                                   final pre_y_start=false)
    if use_minFlowCtrl
    "Check if condenser mass flow rate is high enough"
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Blocks.Logical.Hysteresis hysteresisEva(
    final uLow=m_flowEvaMin,
    final uHigh=max(m_flowEvaMin*1.1, Modelica.Constants.eps),
                                                   final pre_y_start=false)
    if use_minFlowCtrl
    "Check if evaporator mass flow rate is high enough"
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Logical.And and1 if use_minFlowCtrl
                                   "Assure both are good"
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));

  Modelica.Blocks.Sources.BooleanConstant
                                   conBool(final k=true) if not use_minFlowCtrl
    "Disable this safety control"
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
equation
  connect(modeSet, modeOut) annotation (Line(points={{-136,-20},{-40,-20},{-40,-60},
          {100,-60},{100,-20},{130,-20}}, color={255,0,255}));
  connect(hysteresisCon.y, and1.u1) annotation (Line(points={{-39,50},{-28,50},{
          -28,30},{-22,30}}, color={255,0,255}));
  connect(hysteresisEva.y, and1.u2) annotation (Line(points={{-39,10},{-32,10},{
          -32,22},{-22,22}}, color={255,0,255}));
  connect(and1.y, booleanPassThrough.u) annotation (Line(points={{1,30},{20,30},
          {20,0},{38,0}}, color={255,0,255}));
  connect(hysteresisEva.u, sigBusHP.m_flowEvaMea) annotation (Line(points={{-62,
          10},{-88,10},{-88,-69},{-129,-69}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(hysteresisCon.u, sigBusHP.m_flowConMea) annotation (Line(points={{-62,
          50},{-98,50},{-98,-69},{-129,-69}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(ySet, swiErr.u1) annotation (Line(points={{-136,20},{-106,20},{-106,76},
          {72,76},{72,8},{78,8}}, color={0,0,127}));
  connect(conBool.y, booleanPassThrough.u)
    annotation (Line(points={{1,0},{38,0}}, color={255,0,255}));
  annotation (Documentation(info="<html>
<p>Safety control to prevent the heat pump from turning on if the volumen flow rate (or mass) is too low in either condenser or evaporator.</p>
</html>"));
end MinimalVolumeFlowRateSafety;