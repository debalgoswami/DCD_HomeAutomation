module fire(flag,clock, reset, fire, fire_state,firealarm);
  input clock, reset,flag, fire; 
  output [2:0] fire_state;
  output firealarm; 
  wire firealarm;
  reg [2:0] fire_state;
  assign firealarm = (fire_state == 1) ?(flag?0:1): 0;
  always @(posedge clock)
  fire_state <= fire ? 1 : 0;
endmodule

module door(flag,clock, reset,door,door_state,dooralarm);
  input flag,clock, reset, door; 
   output [2:0] door_state;
   output dooralarm;
   wire dooralarm;
   reg [2:0] door_state;
   assign dooralarm = (door_state == 1) ? (flag?0:1) : 0; 
   always @(posedge clock) 
   door_state <= door ? 1 : 0;
 endmodule
 
 module window(flag,clock, reset, window, window_state, windowalarm);
   input clock, reset,flag,window;
   output [2:0] window_state;
   output windowalarm; 
   wire windowalarm; 
   reg [2:0] window_state;
   assign windowalarm = (window_state == 1) ? (flag?0:1): 0;
   always @(posedge clock)
   window_state <= window ? 1 : 0;
 endmodule

module security(flag,clock, reset, door,window,fire,window_state, windowalarm, door_state, dooralarm,fire_state, firealarm);
  input  clock, reset,flag,door,fire, window;
  output [2:0] window_state,door_state,fire_state;
  output  dooralarm,firealarm,windowalarm; 
  wire windowalarm,dooralarm,firealarm; 
  
  fire f0(.flag(flag),.clock(clock),.reset(reset),.fire(fire),.fire_state(fire_state),.firealarm(firealarm));
  door f1(.flag(flag),.clock(clock),.reset(reset),.door(door),.door_state(door_state),.dooralarm(dooralarm));
  window f2(.flag(flag),.clock(clock),.reset(reset),.window(window),.window_state(window_state),.windowalarm(windowalarm));
endmodule