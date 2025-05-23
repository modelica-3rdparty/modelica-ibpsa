within IBPSA.Controls.OBC.CDL.Utilities.Validation;
model SunRiseSetPositiveStartTime
  "Test model for the block SunRiseSet with positive start time"

  IBPSA.Controls.OBC.CDL.Utilities.SunRiseSet sunRiseSetArctic(
    lat=1.2566370614359,
    lon=-1.2566370614359,
    timZon=-18000)
    "Arctic circle case"
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  IBPSA.Controls.OBC.CDL.Utilities.SunRiseSet sunRiseSetSf(
    lat=0.6457718232379,
    lon=-2.1293016874331,
    timZon=-28800)
    "San Francisco as a test example in the northen hemisphere"
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  IBPSA.Controls.OBC.CDL.Utilities.SunRiseSet sunRiseSetAntarctic(
    lat=-1.3089969389957,
    lon=0.99483767363677,
    timZon=14400)
    "Antarctic circle case"
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  IBPSA.Controls.OBC.CDL.Utilities.SunRiseSet sunRiseSetSyd(
    lat=-0.59341194567807,
    lon=2.6354471705114,
    timZon=36000)
    "Sydney as a test example in the southern hemisphere"
    annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
  annotation (
    experiment(
      StartTime=43200,
      StopTime=345600,
      Tolerance=1e-06),
    __Dymola_Commands(
      file="modelica://IBPSA/Resources/Scripts/Dymola/Controls/OBC/CDL/Utilities/Validation/SunRiseSetPositiveStartTime.mos" "Simulate and plot"),
    Documentation(
      info="<html>
<p>This example includes 4 tests for the <a href=\"modelica://IBPSA.Controls.OBC.CDL.Utilities.SunRiseSet\">
IBPSA.Controls.OBC.CDL.Utilities.SunRiseSet</a> block: 2 normal cases, an arctic and antarctic case.
The normal cases are represented by San Francisco and Sydney, where there is a sunrise and sunset every day. </p>
<p>This model starts the simulation from 12 hour instead of 0. </p>
</html>",
      revisions="<html>
<ul>
<li>
March 17, 2023, by Michael Wetter:<br/>
Removed extends statement and added graphical annotation for icon.
</li>
<li>
November 27, 2018, by Kun Zhang:<br/>
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
end SunRiseSetPositiveStartTime;
