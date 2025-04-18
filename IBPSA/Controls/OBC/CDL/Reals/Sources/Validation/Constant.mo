within IBPSA.Controls.OBC.CDL.Reals.Sources.Validation;
model Constant
  "Validate the Constant block"
  IBPSA.Controls.OBC.CDL.Reals.Sources.Constant con(
    k=2.5)
    "Block output real constant value"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  annotation (
    experiment(
      StopTime=1.0,
      Tolerance=1e-06),
    __Dymola_Commands(
      file="modelica://IBPSA/Resources/Scripts/Dymola/Controls/OBC/CDL/Reals/Sources/Validation/Constant.mos" "Simulate and plot"),
    Documentation(
      info="<html>
<p>
Validation test for the block
<a href=\"modelica://IBPSA.Controls.OBC.CDL.Reals.Sources.Constant\">
IBPSA.Controls.OBC.CDL.Reals.Sources.Constant</a>.
</p>

</html>",
      revisions="<html>
<ul>
<li>
July 17, 2017, by Jianjun Hu:<br/>
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
end Constant;
