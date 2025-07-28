# traffic-light
This Verilog code implements a traffic light controller using a finite state machine (FSM). It manages traffic lights at a two-way intersection: one direction is a highway and the other is a side road. This is a basic traffic light controller that prioritizes the highway and allows road traffic only when needed.
linkdln : www.linkedin.com/in/rahul-shah-510a05321

     


       # Behavior Summary:
 
            Start at S0 (highway green).

            If a car is detected on the road (x=1), go to S1 (yellow highway).

            After 3 clock cycles, go to S2 (red-red safety).

            After 2 clock cycles, go to S3 (road green).

            If no car on road (x=0), go to S4 (road yellow).

           After 3 clock cycles, return to S0 (highway green).
