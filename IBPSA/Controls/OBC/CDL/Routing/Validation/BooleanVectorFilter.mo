within IBPSA.Controls.OBC.CDL.Routing.Validation;
model BooleanVectorFilter
  "Validation model for the BooleanVectorFilter block"
  IBPSA.Controls.OBC.CDL.Routing.BooleanVectorFilter
    booFil(nin=3, nout=2, msk={true,false,true})
    "Block that filter the input vector"
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));

  Logical.Sources.Constant booInp[3](k={true,true,false}) "Boolean inputs"
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
equation
  connect(booInp.y, booFil.u)
    annotation (Line(points={{-18,0},{18,0}}, color={255,0,255}));
  annotation (
    experiment(
      StopTime=1.0,
      Tolerance=1e-06),
    __Dymola_Commands(
      file="modelica://IBPSA/Resources/Scripts/Dymola/Controls/OBC/CDL/Routing/Validation/BooleanVectorFilter.mos" "Simulate and plot"),
    Documentation(
      info="<html>
<p>
Validation test for the block
<a href=\"modelica://IBPSA.Controls.OBC.CDL.Routing.BooleanVectorFilter\">
IBPSA.Controls.OBC.CDL.Routing.BooleanVectorFilter</a>.
</p>
</html>",
      revisions="<html>
<ul>
<li>
June 25, 2021, by Baptiste Ravache:<br/>
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
end BooleanVectorFilter;
