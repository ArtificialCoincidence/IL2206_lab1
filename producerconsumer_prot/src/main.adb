with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Real_Time;
use Ada.Real_Time;

with Buffer;
use Buffer;

with Ada.Numerics.Discrete_Random;

procedure main is

   N : constant Integer := 10; -- Number of produced and consumed tokens per task
	X : constant Integer := 3; -- Number of producers and consumers

   -- Random Delays
   subtype Delay_Interval is Integer range 50..250;
   package Random_Delay is new Ada.Numerics.Discrete_Random (Delay_Interval);
   use Random_Delay;
   G : Generator;

   -- ==> Complete code: Use Buffer
   circular_buffer : Buffer.CircularBuffer;

   task type Producer;

   task type Consumer;

   task body Producer is
      Next : Time;
   begin
      Next := Clock;
      for I in 1..N loop

	 -- ==> Complete code: Write to Buffer
	 circular_buffer.Put(I);
	 Put_Line("Put" & I'Image);

         -- Next 'Release' in 50..250ms
         Next := Next + Milliseconds(Random(G));
         delay until Next;
      end loop;
   end;

   task body Consumer is
      Next : Time;
      X : Integer;
   begin
      Next := Clock;
      for I in 1..N loop
	 -- Read from X

         -- ==> Complete code: Read from Buffer
	 circular_buffer.Get(X);
	 Put_Line("Get" & I'Image);

         Next := Next + Milliseconds(Random(G));
         delay until Next;
      end loop;
   end;

	P: array (Integer range 1..X) of Producer;
	C: array (Integer range 1..X) of Consumer;

begin -- main task
   null;
end main;


