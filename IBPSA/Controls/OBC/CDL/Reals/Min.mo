within IBPSA.Controls.OBC.CDL.Reals;
block Min
  "Pass through the smallest signal"
  IBPSA.Controls.OBC.CDL.Interfaces.RealInput u1
    "Input to the min function"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  IBPSA.Controls.OBC.CDL.Interfaces.RealInput u2
    "Input to the min function"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  IBPSA.Controls.OBC.CDL.Interfaces.RealOutput y
    "Minimum of the inputs"
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));

equation
  y=min(u1, u2);
  annotation (
    defaultComponentName="min",
    Documentation(
      info="<html>
<p>
Block that outputs <code>y = min(u1, u2)</code>,
where
<code>u1</code> and <code>u2</code> are inputs.
</p>
</html>",
      revisions="<html>
<ul>
<li>
March 2, 2020, by Michael Wetter:<br/>
Changed icon to display dynamically the output value.
</li>
<li>
January 3, 2017, by Michael Wetter:<br/>
First implementation, based on the implementation of the
Modelica Standard Library.
</li>
</ul>
</html>"),
    Icon(
      coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}),
      graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          textColor={0,0,255}),
        Text(
          extent={{-90,36},{90,-36}},
          textColor={160,160,164},
          textString="min()"),
        Text(
          extent={{226,60},{106,10}},
          textColor={0,0,0},
          textString=DynamicSelect("",String(y,
            leftJustified=false,
            significantDigits=3)))}));
end Min;
