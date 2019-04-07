within IBPSA.Fluid.HeatExchangers;
model WetCoilEffectivesnessNTU
  "Heat exchanger with effectiveness - NTU relation and simple model for moisture condensation"
  extends IBPSA.Fluid.HeatExchangers.DryCoilEffectivenessNTU(sensibleOnly1=false);

equation
  // todo: check using substance names
  assert(sensibleOnly1 or Medium1.nXi > 0,
    "In "+getInstanceName() + ": model that computes condensation in air, but model contains no water fraction.");
  annotation (Documentation(revisions="<html>
<ul>
<li>
April 7, 2019, by Filip Jorissen:<br/>
First implementation for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1109\">#1109</a>.
</li>
</ul>
</html>"));
end WetCoilEffectivesnessNTU;