<h1 align="center">🚦 Traffic Light Controller</h1>

<p align="left">
This Verilog code implements a <b>traffic light controller</b> using a
<b>Finite State Machine (FSM)</b>.  
It manages traffic lights at a <b>two-way intersection</b> where:
<ul>
  <li>One direction is a <b>highway</b> (priority road)</li>
  <li>The other direction is a <b>side road</b></li>
</ul>
The controller prioritizes highway traffic and allows road traffic only
when a vehicle is detected.
</p>

<h3 align="left">🔗 Connect with me</h3>
<p align="left">
  <a href="https://www.linkedin.com/in/rahul-shah-510a05321" target="_blank">
    💼 LinkedIn Profile
  </a>
</p>

<h3 align="left">⚙️ Behavior Summary</h3>

<p align="left">
<b>S0:</b> Highway GREEN (Initial State)<br><br>

➡️ If a car is detected on the road (<b>x = 1</b>):<br>
&nbsp;&nbsp;→ Move to <b>S1</b> (Highway YELLOW)<br><br>

⏱️ After <b>3 clock cycles</b>:<br>
&nbsp;&nbsp;→ Move to <b>S2</b> (RED–RED safety state)<br><br>

⏱️ After <b>2 clock cycles</b>:<br>
&nbsp;&nbsp;→ Move to <b>S3</b> (Road GREEN)<br><br>

➡️ If no car is detected on the road (<b>x = 0</b>):<br>
&nbsp;&nbsp;→ Move to <b>S4</b> (Road YELLOW)<br><br>

⏱️ After <b>3 clock cycles</b>:<br>
&nbsp;&nbsp;→ Return to <b>S0</b> (Highway GREEN)
</p>
