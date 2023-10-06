-- Package: Semaphores
--
-- ==> Complete the code at the indicated places

-- include text_io to allow print
with Text_IO;
use Text_IO;

package body Semaphores is
   protected body CountingSemaphore is
      entry Wait -- To be completed
         when Count > 0 is
      begin
	 Count := Count - 1;
	 Put_Line("Wait");
      end Wait;

      entry Signal -- To be completed
	 when Count < MaxCount is
      begin
	 Count := Count + 1;
	 Put_Line("Signal");
      end Signal;

   end CountingSemaphore;
end Semaphores;

