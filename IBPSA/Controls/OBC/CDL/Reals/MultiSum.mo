within IBPSA.Controls.OBC.CDL.Reals;
block MultiSum
  "Sum of Reals, y = k[1]*u[1] + k[2]*u[2] + ... + k[n]*u[n]"
  parameter Integer nin(min=0)=0
    "Number of input signals"
    annotation (Dialog(connectorSizing=true),HideResult=true);
  parameter Real k[nin]=fill(1, nin)
    "Input gains";
  IBPSA.Controls.OBC.CDL.Interfaces.RealInput u[nin]
    "Input to multiplied by gain and then added"
    annotation (Placement(transformation(extent={{-140,20},{-100,-20}})));
  IBPSA.Controls.OBC.CDL.Interfaces.RealOutput y
    "Sum of inputs times gains"
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));

equation
  if size(u, 1) > 0 then
    y=k*u;
  else
    y=0;
  end if;
  annotation (
    defaultComponentName="mulSum",
    Icon(
      graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-200,-110},{200,-140}},
          textColor={0,0,0},
          fillColor={255,213,170},
          fillPattern=FillPattern.Solid,
          textString="%k"),
        Text(
          extent={{-82,90},{82,-46}},
          textColor={0,0,0},
          fillColor={255,213,170},
          fillPattern=FillPattern.Solid,
          textString="+"),
        Text(
          extent={{-144,150},{156,110}},
          textString="%name",
          textColor={0,0,255}),
        Text(
          extent={{226,60},{106,10}},
          textColor={0,0,0},
          textString=DynamicSelect("",String(y,
            leftJustified=false,
            significantDigits=3)))}),
    Documentation(
      info="<html>
<p>
Block that outputs
</p>
<p align=\"center\" style=\"font-style:italic;\">
y = &sum;<sub>i=1</sub><sup>n</sup> k<sub>i</sub> &nbsp; u<sub>i</sub>,
</p>
<p>
where <i>k</i> is a parameter with <i>n</i> elements and <i>u</i> is
an input of the same length.
The dimension of <i>u</i> can be enlarged by
drawing an additional connection line. The connection is automatically connected
to this new free index.
</p>

<p>
If no connection to the input connector <i>u</i> is present,
the output is <i>y=0</i>.
</p>
<p>
See
<a href=\"modelica://IBPSA.Controls.OBC.CDL.Reals.Validation.MultiSum\">
IBPSA.Controls.OBC.CDL.Reals.Validation.MultiSum</a>
for an example.
</p>
</html>",
      revisions="<html>
<ul>
<li>
March 2, 2020, by Michael Wetter:<br/>
Changed icon to display dynamically the output value.
</li>
<li>
June 28, 2017, by Jianjun Hu:<br/>
First implementation, based on the implementation of the Modelica Standard
Library. This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/825\">Buildings, issue 825</a>.
</li>
</ul>
</html>"));
end MultiSum;
