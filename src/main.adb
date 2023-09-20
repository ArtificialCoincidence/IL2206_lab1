with Semaphores;
use Semaphores;

procedure main is
   semaphore : Semaphores.CountingSemaphore(3, 0);
begin
   for I in 1..3 loop
      semaphore.Signal;
   end loop;
   semaphore.Wait;
   semaphore.Signal;
end main;
