within IBPSA.Controls.OBC.CDL.Reals;
block MultiMin
  "Output the minimum element of the input vector"
  parameter Integer nin(min=0)=0
    "Number of input signals"
    annotation (Dialog(connectorSizing=true),HideResult=true);
  IBPSA.Controls.OBC.CDL.Interfaces.RealInput u[nin]
    "Input to the min function"
    annotation (Placement(transformation(extent={{-140,20},{-100,-20}})));
  IBPSA.Controls.OBC.CDL.Interfaces.RealOutput y
    "Smallest element of the input vector"
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));

equation
  y=min(u);
  annotation (
    defaultComponentName="mulMin",
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
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
            significantDigits=3)))}),
    Documentation(
      info="<html>
<p>
Outputs the minimum element of the input vector.
</p>
</html>",
      revisions="<html>
<ul>
<li>
March 2, 2020, by Michael Wetter:<br/>
Changed icon to display dynamically the output value.
</li>
<li>
September 14, 2017, by Jianjun Hu:<br/>
First implementation, based on the implementation of the
Modelica Standard Library.
</li>
</ul>
</html>"));
end MultiMin;
