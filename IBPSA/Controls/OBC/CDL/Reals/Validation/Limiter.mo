within IBPSA.Controls.OBC.CDL.Reals.Validation;
model Limiter
  "Validation model for the Limiter block"
  IBPSA.Controls.OBC.CDL.Reals.Limiter limiter1(
    uMax=2.5,
    uMin=1.2)
    "Block that limit the range of a signal"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  IBPSA.Controls.OBC.CDL.Reals.Sources.Ramp ramp1(
    duration=1,
    offset=0,
    height=4)
    "Block that generates ramp signal"
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));

equation
  connect(ramp1.y,limiter1.u)
    annotation (Line(points={{-39,0},{-12,0}},color={0,0,127}));
  annotation (
    experiment(
      StopTime=1.0,
      Tolerance=1e-06),
    __Dymola_Commands(
      file="modelica://IBPSA/Resources/Scripts/Dymola/Controls/OBC/CDL/Reals/Validation/Limiter.mos" "Simulate and plot"),
    Documentation(
      info="<html>
<p>
Validation test for the block
<a href=\"modelica://IBPSA.Controls.OBC.CDL.Reals.Limiter\">
IBPSA.Controls.OBC.CDL.Reals.Limiter</a>.
</p>
<p>
The input <code>u</code> varies from <i>0.0</i> to <i>+2</i>.
</p>
</html>",
      revisions="<html>
<ul>
<li>
March 20, 2017, by Jianjun Hu:<br/>
First implementation.
</li>
</ul>
</html>"),
    Icon(
      graphics={
        Ellipse(
          lineColor={75,138,73},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}),
        Polygon(
          lineColor={0,0,255},
          fillColor={75,138,73},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{-36,60},{64,0},{-36,-60},{-36,60}})}));
end Limiter;
