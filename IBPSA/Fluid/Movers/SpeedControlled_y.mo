within IBPSA.Fluid.Movers;
model SpeedControlled_y
  "Fan or pump with ideally controlled normalized speed y as input signal"
  extends IBPSA.Fluid.Movers.BaseClasses.PartialFlowMachine(
    final preVar=IBPSA.Fluid.Movers.BaseClasses.Types.PrescribedVariable.Speed,
    final nominalValuesDefineDefaultPressureCurve=false,
    final computePowerUsingSimilarityLaws=true,
    final stageInputs(each final unit="1") = per.speeds,
    final constInput(final unit="1") = per.constantSpeed,
    motSpe(
      final y_start=y_start,
      u(final unit="1"),
      y(final unit="1")),
    eff(per(
        final pressure=per.pressure,
        final etaHydMet=per.etaHydMet,
        final etaMotMet=per.etaMotMet),
        r_N(start=y_start)));

  parameter Real y_start(min=0, max=1, unit="1")=0 "Initial value of speed"
    annotation(Dialog(tab="Dynamics", group="Motor speed", enable=use_riseTime));

  Modelica.Blocks.Interfaces.RealInput y(
    unit="1")
 if inputType == IBPSA.Fluid.Types.InputType.Continuous
    "Constant normalized rotational speed"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,120})));

protected
  Modelica.Blocks.Math.Gain gain(final k=-1) "Pressure gain"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-10,-20})));
initial equation
  assert(per.havePressureCurve,
   "SpeedControlled_y requires to set the pressure vs. flow rate curve in record 'per'.");

equation
  connect(inputSwitch.u, y) annotation (Line(points={{-22,50},{-26,50},{-26,80},
          {0,80},{0,120}}, color={0,0,127}));
  connect(eff.dp, gain.u)
    annotation (Line(points={{-11,-50},{-6,-50},{-6,-42},{-10,-42},{-10,-32}},
                                                           color={0,0,127}));
  connect(gain.y, preSou.dp_in)
    annotation (Line(points={{-10,-9},{-10,14},{56,14},{56,8}},
                                                     color={0,0,127}));

  if use_riseTime then
    connect(motSpe.y, eff.y_in) annotation (Line(points={{41,70},{44,70},{44,26},
            {-26,26},{-26,-46}},      color={0,0,127}));
  else
    connect(inputSwitch.y, eff.y_in) annotation (Line(points={{1,50},{44,50},{44,
            26}},                  color={0,0,127}));
  end if;

    annotation (defaultComponentName="mov",
    Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{100,
            100}}),
         graphics={
        Text(
          extent={{-40,126},{-160,76}},
          textColor={0,0,127},
          visible=inputType == IBPSA.Fluid.Types.InputType.Continuous or inputType == IBPSA.Fluid.Types.InputType.Stages,
          textString=DynamicSelect("y", if inputType == IBPSA.Fluid.Types.InputType.Continuous then String(y, format=".2f") else String(stage)))}),
    Documentation(info="<html>
<p>
This model describes a fan or pump with prescribed normalized speed.
The input connector provides the normalized rotational speed (between 0 and 1).
The head is computed based on the performance curve that take as an argument
the actual volume flow rate divided by the maximum flow rate and the relative
speed of the fan.
</p>
<p>
See the
<a href=\"modelica://IBPSA.Fluid.Movers.UsersGuide\">
User's Guide</a> for more information.
</p>
</html>",
      revisions="<html>
<ul>
<li>
August 26, 2024, by Michael Wetter:<br/>
Implemented linear dynamics for change in motor speed.<br/>
This is for <a href=\"https://github.com/lbl-srg/modelica-buildings/issues/3965\">Buildings, #3965</a> and
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1926\">IBPSA, #1926</a>.
</li>
<li>
March 29, 2023, by Hongxiang Fu:<br/>
Removed the modification that normalised the speed input
because it is no longer needed. This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1704\">IBPSA, #1704</a>.
</li>
<li>
March 1, 2023, by Hongxiang Fu:<br/>
Removed the modification of <code>m_flow_nominal</code>.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1705\">#1705</a>.
</li>
<li>
March 8, 2022, by Hongxiang Fu:<br/>
Refactored the model by replacing <code>not use_powerCharacteristic</code>
with the enumeration
<a href=\"modelica://IBPSA.Fluid.Movers.BaseClasses.Types.HydraulicEfficiencyMethod\">
IBPSA.Fluid.Movers.BaseClasses.Types.HydraulicEfficiencyMethod</a>.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/2668\">#2668</a>.
March 7, 2022, by Michael Wetter:<br/>
Set <code>final massDynamics=energyDynamics</code>.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1542\">#1542</a>.
</li>
<li>
June 17, 2021, by Michael Wetter:<br/>
Changed implementation of the filter.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1498\">#1498</a>.
</li>
<li>
February 21, 2020, by Michael Wetter:<br/>
Changed icon to display its operating stage.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1294\">#1294</a>.
</li>
<li>
March 24, 2017, by Michael Wetter:<br/>
Renamed <code>filteredSpeed</code> to <code>use_inputFilter</code>.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/665\">#665</a>.
</li>
<li>
December 2, 2016, by Michael Wetter:<br/>
Removed <code>min</code> attribute as otherwise numerical noise can cause
the assertion on the limit to fail.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/606\">#606</a>.
</li>
<li>
March 2, 2016, by Filip Jorissen:<br/>
Refactored model such that it directly extends <code>PartialFlowMachine</code>.
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/417\">#417</a>.
</li>
<li>
February 17, 2016, by Michael Wetter:<br/>
Updated parameter names for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/396\">#396</a>.
</li>
<li>
April 2, 2015, by Filip Jorissen:<br/>
Added code for supporting stage input and constant input.
</li>
<li>
January 6, 2015, by Michael Wetter:<br/>
Revised model for OpenModelica.
</li>
<li>
November 22, 2014, by Michael Wetter:<br/>
Revised implementation that uses the new performance data as a record.
</li>
<li>
February 14, 2012, by Michael Wetter:<br/>
Added filter for start-up and shut-down transient.
</li>
<li>
May 25, 2011, by Michael Wetter:<br/>
Revised implementation of energy balance to avoid having to use conditionally removed models.
</li>
<li>
July 27, 2010, by Michael Wetter:<br/>
Redesigned model to fix bug in medium balance.
</li>
<li>March 24, 2010, by Michael Wetter:<br/>
Revised implementation to allow zero flow rate.
</li>
<li>
October 1, 2009, by Michael Wetter:<br/>
Model added to the IBPSA library. Changed control signal from rpm to normalized value between 0 and 1</li>
<li>
October 31, 2005 by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br/>
Model added to the Fluid library
</li>
</ul>
</html>"));
end SpeedControlled_y;
