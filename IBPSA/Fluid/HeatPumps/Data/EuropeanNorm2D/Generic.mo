within IBPSA.Fluid.HeatPumps.Data.EuropeanNorm2D;
record Generic "Basic data for refrigerant machine according to EN 14511"
    extends Modelica.Icons.Record;
  parameter Real tabPEle[:,:]
    "Electrical power table, T in degC, Q_flow in W";
  parameter Modelica.Units.SI.MassFlowRate mCon_flow_nominal
    "Nominal mass flow rate in condenser";
  parameter Modelica.Units.SI.MassFlowRate mEva_flow_nominal
    "Nominal mass flow rate in evaporator";
  parameter String devIde "Name of the device";
  parameter Boolean use_evaOut
    "=true to use evaporator outlet temperature, false for inlet";
  parameter Boolean use_conOut
    "=true to use condenser outlet temperature, false for inlet";

  annotation (Documentation(info="<html>
<h4>Overview</h4>
<p>
  Base data definition used in the heat pump model. 
  It defines the table for <code>table_PEle</code> which gives the electric power 
  consumption of the heat pump or chiller. 
  Information on heat flow rates are in the corresponding records for 
  heat pumps and chillers, as it is the condenser and evaporator heat flow rate,
  respectivly.
</p>
<p>
  Both tables define the power values depending on the evaporator temperature 
  (defined in first row, in degC) and the condenser temperature 
  (defined in first column, in degC) in W.
</p>
<p>
  Depending on the type of the device, either inlet or outlet conditions are used.
  This feature could be required for air-air devices. Here, the room temperature
  (inlet) and outdoor air temperature (inlet) are used. For air-water devices,
  the supply temperature (outlet) and the outdoor air temperature (inlet) are
  used instead.
  When adding new data, be sure to check if the datasheet means inlet or outlet 
  conditions. Also, be sure to check if the data is for wet- or dry-bulb 
  temperatures. The measured temperatures of the modular approach are taken
  directly from the fluid ports and are, thus, always dry bulb.
</p>
<p>
  The nominal mass flow rate in the condenser and evaporator 
  are also defined as parameters. These will be used in the model to assert that
  the mass flow rates in the simulation do not deviate to much from the ones
  where the normative data is for. 
</p>
<p>
  The <code>devIde</code> ensures that if data for heating and cooling are required, 
  matching records will be used. This parameter is mainly to avoid modelling 
  errors.
</p>
</html>",
        revisions="<html><ul>
  <li>
    <i>October 2, 2022</i> by Fabian Wuellhorst:<br/>
    Adjusted based on IPBSA guidelines <a href=
    \"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">#1576</a>)
  </li>
  <li>
    <i>May 7, 2020</i> by Philipp Mehrfeld:<br/>
    Add description of how to calculate m_flows
  </li>
  <li>
    <i>December 10, 2013</i> by Ole Odendahl:<br/>
    Formatted documentation appropriately
  </li>
</ul>
</html>
"),Icon);
end Generic;