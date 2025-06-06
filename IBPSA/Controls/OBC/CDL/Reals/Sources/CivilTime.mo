within IBPSA.Controls.OBC.CDL.Reals.Sources;
block CivilTime "Civil time"
  IBPSA.Controls.OBC.CDL.Interfaces.RealOutput y(final unit="s")
    "Civil time"
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));

equation
  y=time;
  annotation (
    defaultComponentName="civTim",
    Icon(
      coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}),
      graphics={
        Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          textColor={0,0,255}),
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-80,80},{80,-80}},
          lineColor={160,160,164},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,80},{0,60}},
          color={160,160,164}),
        Line(
          points={{80,0},{60,0}},
          color={160,160,164}),
        Line(
          points={{0,-80},{0,-60}},
          color={160,160,164}),
        Line(
          points={{-80,0},{-60,0}},
          color={160,160,164}),
        Line(
          points={{37,70},{26,50}},
          color={160,160,164}),
        Line(
          points={{70,38},{49,26}},
          color={160,160,164}),
        Line(
          points={{71,-37},{52,-27}},
          color={160,160,164}),
        Line(
          points={{39,-70},{29,-51}},
          color={160,160,164}),
        Line(
          points={{-39,-70},{-29,-52}},
          color={160,160,164}),
        Line(
          points={{-71,-37},{-50,-26}},
          color={160,160,164}),
        Line(
          points={{-71,37},{-54,28}},
          color={160,160,164}),
        Line(
          points={{-38,70},{-28,51}},
          color={160,160,164}),
        Line(
          points={{0,0},{-50,50}},
          thickness=0.5),
        Line(
          points={{0,0},{40,0}},
          thickness=0.5),
        Text(
          extent={{226,60},{106,10}},
          textColor={0,0,0},
          textString=DynamicSelect("",String(y,
            leftJustified=false,
            significantDigits=3)))}),
    Documentation(
      info="<html>
<p>Block that outputs the civil time.
</p>
<h4>Implementation</h4>
<p>
This block outputs the time of the model.
In the case of a building automation system, the
building automation system synchronizes time, and hence
need to assign a value for the output of this block.
Daylight saving time shall not be taken into account,
e.g, the block always outputs civil time rather than
daylight savings time.
</p>
<p>
If a simulation starts
at <i>t=-1</i>, then this block outputs first <i>t=-1</i>,
and its output is advanced at the same rate as the simulation time.
</p>

<p>
Note that the block has not been included in the ASHRAE Standard 231p.
However, in the future versions of the ASHRAE 231 Standard, the block should be added.
</p>
</html>",
      revisions="<html>
<ul>
<li>
December 12, 2023, by Jianjun Hu:<br/>
Renamed the block from <code>ModelTime</code> to <code>CivilTime</code>.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/3596\">Buildings, issue 3596</a>.
</li>
<li>
March 2, 2020, by Michael Wetter:<br/>
Changed icon to display dynamically the output value.
</li>
<li>
March 14, 2017, by Michael Wetter:<br/>
Revised implemenation.
</li>
<li>
February 23, 2017, by Milica Grahovac:<br/>
First CDL implementation.
</li>
<li>
January 16, 2015, by Michael Wetter:<br/>
Moved block from
<code>IBPSA.Utilities.SimulationTime</code>
to
<code>IBPSA.Utilities.Time.ModelTime</code>.
</li>
<li>
May 18, 2010, by Wangda Zuo:<br/>
First implementation.
</li>
</ul>
</html>"));
end CivilTime;
