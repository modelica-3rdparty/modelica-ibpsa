within IBPSA.Controls.OBC;
package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;

  class Conventions "Naming conventions in OBC package"
    extends Modelica.Icons.Information;

  annotation (preferredView="info",
  defaultComponentName="useGui",
  Documentation(info="<html>
<p>
The <code>IBPSA.Controls.OBC</code> package follows the naming conventions of
the <code>IBPSA</code> Library,
see <a href=\"modelica://IBPSA.UsersGuide.Conventions\">IBPSA.UsersGuide.Conventions</a>.
The table below shows some examples of commonly used names.
Note that the names are generally composed as follows:
</p>
<ul>
<li>
<p>If needed to understand the context, a prefix <code>u</code> for input or <code>y</code> for output may be used.</p>
</li>
<li>
<p>Next, the quantity is used, such as <code>TOut</code> or <code>TZonHea</code>.</p>
</li>
<li>
<p>Finally, as a postfix a qualifier may be added, such as <code>Set</code> for set point, <code>Min</code> for minimum,
or <code>Coo</code> for cooling.
</p>
</li>
</ul>
<p>
Generally, we strive for short names, and therefore often prefix or postfix are omitted if
the type of the variable is clear from the context.
For example, a room temperature thermostat may simply use <code>T</code> as an input
as it is clear that this will be the room temperature.
</p>
<table summary=\"summary\" border=\"1\">
<tr><td colspan=\"2\"><b>Instance names</b></td></tr>
<tr><th>Name</th><th>Comments</th></tr>
<tr><td><code>TOut</code> (<code>hOut</code>)</td>
    <td>Outdoor air temperature (enthalpy)</td></tr>
<tr><td><code>TZonHeaSet</code> (<code>TZonCooSet</code>)</td>
    <td>Zone heating (cooling) set point temperature</td></tr>
<tr><td><code>VDis_flow</code></td>
    <td>Measured discharge airflow rate</td></tr>
<tr><td><code>dpBui</code></td>
    <td>Building static pressure difference, relative to ambient</td></tr>
<tr><td><code>uOpeMod</code></td>
    <td>Zone group operating mode</td></tr>
<tr><td><code>uResReq</code></td>
    <td>Number of reset requests</td></tr>
<tr><td><code>uSupFan</code></td>
    <td>Current supply fan enabling status, <code>true</code>: fan is enabled</td></tr>
<tr><td><code>uSupFanSpe</code></td>
    <td>Current supply fan speed</td></tr>
<tr><td><code>uDam</code></td>
    <td>Measured damper position</td></tr>
<tr><td><code>uHea</code> (<code>uCoo</code>)</td>
    <td>Heating (cooling) loop signal</td></tr>
<tr><td><code>yPosMin</code> (<code>yPosMax</code>)</td>
    <td>Minimum (maximum) position</td></tr>
<tr><td><code>yHeaCoi</code> (<code>yCooCoi</code>)</td>
    <td>Heating (cooling) coil control signal</td></tr>
<tr><td><code>uChiIsoVal</code></td>
    <td>Chiller condenser water isolation valve status</td></tr>
<tr><td><code>dpChiWat_remote</code></td>
    <td>Chilled water differntial statis pressure from remote sensor</td></tr>
<tr><td><code>TChiWatRet</code></td>
    <td>Chilled water return temperature</td></tr>
<tr><td><code>VChiWat_flow</code></td>
    <td>Measured chilled water volume flow rate</td></tr>
<tr><td><code>uHeaPreCon</code></td>
    <td>Chiller head pressure control loop signal from chiller controller</td></tr>
<tr><td><code>yChiPumSpe</code></td>
    <td>Chilled water pump speed setpoint</td></tr>
<tr><td><code>yChi</code></td>
    <td>Chiller status setpoint</td></tr>
<tr><td><code>yMinValPos</code></td>
    <td>Minimum valve position setpoint</td></tr>
<tr><td colspan=\"2\"><b>Parameter names</b></td></tr>
<tr><th>Name</th> <th>Comments</th></tr>
<tr><td><code>use_TMix</code></td>
    <td>Set to <code>true</code> if mixed air temperature measurement is used</td></tr>
<tr><td><code>have_occSen</code> (<code>have_winSen</code>)</td>
    <td>Set to <code>true</code> if the zone has occupancy (window) sensor</td></tr>
<tr><td><code>AFlo</code></td>
    <td>Area of the zone</td></tr>
<tr><td><code>VDisHeaSetMax_flow</code> (<code>VDisCooSetMax_flow</code>)</td>
    <td>Zone maximum heating (cooling) airflow set point</td></tr>
<tr><td><code>VOutPerAre_flow</code> (<code>VOutPerPer_flow</code>)</td>
    <td>Outdoor airflow rate per unit area (person)</td></tr>
<tr><td><code>V_flow_nominal</code></td>
    <td>Nominal volume flow rate</td></tr>
<tr><td><code>VOutMin_flow</code></td>
    <td>Calculated minimum outdoor airflow rate at design stage</td></tr>
<tr><td><code>pMinSet</code> (<code>pMaxSet</code>)</td>
    <td>Minimum (maximum) pressure set point for fan speed control</td></tr>
<tr><td><code>TSupSetMin</code> (<code>TSupSetMax</code>)</td>
    <td>Lowest (Highest) cooling supply air temperature</td></tr>
<tr><td><code>TOccHeaSet</code> (<code>TUnoHeaSet</code>)</td>
    <td>Zone occupied (unoccupied) heating set point</td></tr>
<tr><td><code>TZonCooMax</code> (<code>TZonCooMin</code>)</td>
    <td>Maximum (minimum) zone cooling set point when cooling is on</td></tr>
<tr><td><code>retDamPhyPosMax</code> (<code>outDamPhyPosMax</code>)</td>
    <td>Physically fixed maximum position of the return (outdoor) air damper</td></tr>
<tr><td><code>samplePeriod</code></td>
    <td>Sample period</td></tr>
<tr><td><code>zonDisEffHea</code> (<code>zonDisEffCoo</code>)</td>
    <td>Zone air distribution effectiveness during heating (cooling)</td></tr>
<tr><td><code>kCoo</code></td>
    <td>Gain for cooling control loop signal</td></tr>
<tr><td><code>TiCoo</code></td>
    <td>Time constant of integrator block for cooling control loop signal</td></tr>
<tr><td><code>TdCoo</code></td>
    <td>Time constant of derivative block for cooling control loop signal</td></tr>
<tr><td><code>nChi</code></td>
    <td>Total number of chillers</td></tr>
<tr><td><code>have_parChi</code></td>
    <td>True: the plant has parallel chillers</td></tr>
<tr><td><code>have_heaChiWatPum</code></td>
    <td>True: the plant has headed chilled water pumps</td></tr>
<tr><td><code>have_fixSpeConWatPum</code></td>
    <td>True: the plant has fixed speed condenser water pumps</td></tr>
<tr><td><code>need_reduceChillerDemand</code></td>
    <td>True: the plant needs to limit chiller demand when chiller staging</td></tr>
<tr><td><code>minChiLif</code></td>
    <td>Minimum allowable lift at minimum load for chiller</td></tr>
<tr><td><code>TChiWatSupMin</code></td>
    <td>Minimum chilled water supply temperature</td></tr>
<tr><td><code>dpChiWatPumMin</code></td>
    <td>Minimum chilled water pump differential static pressure</td></tr>
<tr><td><code>lift_min</code></td>
    <td>Chiller minimum lift</td></tr>
</table>
<br/>
</html>"),
    Icon(graphics={
        Ellipse(
          lineColor={75,138,73},
          fillColor={75,138,73},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}),
        Polygon(origin={-4.167,-15},
          fillColor={255,255,255},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,-50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
          smooth=Smooth.Bezier),
        Ellipse(origin={7.5,56.5},
          fillColor={255,255,255},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{-12.5,-12.5},{12.5,12.5}})}));
  end Conventions;
  annotation (preferredView="info",
  defaultComponentName="useGui",
  Documentation(info="<html>
<img alt=\"OBC logo\" src=\"modelica://IBPSA/Resources/Images/Controls/OBC/OBC_stacked_150dpi_small.png\" style=\"float:right;\"/>
<p>
The package <a href=\"modelica://IBPSA.Controls.OBC\">IBPSA.Controls.OBC</a>
contains the Control Description Language (CDL) and models for building control that
are implemented using CDL.
The Control Description Language is a language that is being standardized through
ASHRAE Standard 231P.
It has been developed to digitalize the design, implementation and commissioning
of building control sequences in format that is independent of any particular
control product line (Wetter et al., 2018).
For a description of the process for digitalizing control delivery,
see Wetter et al. (2022).
</p>
<!-- @include_Buildings
<p>
The Control Description Language and the library of control sequences
have been developed in the OpenBuildingControl project, see
<a href=\"https://obc.lbl.gov\">obc.lbl.gov</a>.
</p>
<p>
This package contains control sequences for
</p>
<ul>
<li>
HVAC airside system control
<a href=\"modelica://IBPSA.Controls.OBC.ASHRAE.G36\">
IBPSA.Controls.OBC.ASHRAE.G36</a>,
</li>
<li>
radiant heating and cooling systems
<a href=\"modelica://IBPSA.Controls.OBC.RadiantSystems\">IBPSA.Controls.OBC.RadiantSystems</a>,
</li>
<li>
outdoor lighting control <a href=\"modelica://IBPSA.Controls.OBC.OutdoorLights\">IBPSA.Controls.OBC.OutdoorLights</a>, and
</li>
<li>
shading device control <a href=\"modelica://IBPSA.Controls.OBC.Shade\">IBPSA.Controls.OBC.Shade</a>.
</li>
</ul>
<p>
The control sequences are composed of the elementary blocks from the package
<a href=\"modelica://IBPSA.Controls.OBC.CDL\">IBPSA.Controls.OBC.CDL</a>.
</p>
-->
<p>
The package also contains models for unit conversions,
<a href=\"modelica://IBPSA.Controls.OBC.UnitConversions\">IBPSA.Controls.OBC.UnitConversions</a>,
and utilities models, such as
<a href=\"modelica://IBPSA.Controls.OBC.Utilities.OptimalStart\">IBPSA.Controls.OBC.Utilities.OptimalStart</a>,
which output the optimal start time for an HVAC system.
</p>
<p>
The Control Description Language (CDL) can be found in
<a href=\"modelica://IBPSA.Controls.OBC.CDL\">IBPSA.Controls.OBC.CDL</a>
and its specification is at <a href=\"https://obc.lbl.gov\">obc.lbl.gov</a>.
Note that the implementation in
<a href=\"modelica://IBPSA.Controls.OBC.CDL\">IBPSA.Controls.OBC.CDL</a>
replicates some classes from the Modelica Standard Library.
This was done to have a self-contained implementation of CDL that can be
standardized through ASHRAE and that has minimum dependencies
on other software to ease support by building automation systems.
The replication of the implementation of the blocks also avoids
that CDL inadvertently changes
if the Modelica Standard Library is updated,
which is undesirable as changes to CDL will need to go through the
ASHRAE standardization process.
</p>
<h4>References</h4>
<ul>
<li>
Michael Wetter, Milica Grahovac and Jianjun Hu.<br/>
Control Description Language.<br/>
<i>1st American Modelica Conference</i>, Cambridge, MA, USA, August 2018.<br/>
<a href=\"https://doi.org/10.3384/ecp1815417\">https://doi.org/10.3384/ecp1815417</a>.
</li>
<li>
Michael Wetter, Paul Ehrlich, Antoine Gautier, Milica Grahovac, Philip Haves, Jianjun Hu, Anand Prakash, Dave Robin and Kun Zhang.<br/>
OpenBuildingControl: Digitizing the control delivery from building energy modeling to specification, implementation and formal verification.<br/>
<i>Energy</i>, Volume 238, Part A, January 2022.<br/>
<a href=\"https://doi.org/10.1016/j.energy.2021.121501\">https://doi.org/10.1016/j.energy.2021.121501</a>.
</li>
</ul>
</html>"),
  Icon(graphics={
        Ellipse(
          lineColor={75,138,73},
          fillColor={75,138,73},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}),
        Polygon(origin={-4.167,-15},
          fillColor={255,255,255},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,-50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
          smooth=Smooth.Bezier),
        Ellipse(origin={7.5,56.5},
          fillColor={255,255,255},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{-12.5,-12.5},{12.5,12.5}})}));
end UsersGuide;
