# the why of the project 
tiny ml refers to the implementation of the machine learing models for smallers devices generallly those which operate on embedded systsems and componenets. devices whihc have limited battery , compute, and memory.

# why cant we use the cpus for this process
the cpus are designed for general purposes and would require extensive calculations for each mac operation as they operate onthe pricnciple of load data, multiply, store , load , add and repeat, over the multitudes of calculations involved to runthe neural networks this becomes very resources heavy for small embedded cpus . 
onthe other hand the gpus which are fast as they can perform repeated paralled calcualtions much faster and easier but are limited by the constraints of their size , price , and power required and hence arent fit for edge devices.

To overcome this we turn to Application specific integrated circuits also called as ASIC chips , and the hardware for such devices catering to the problem above is called as an accelerator. these accelrators are the dedicated hardware for performing the matrix multiplications efficiently.

The architecture we are using for the hardware is very notable as Systolic arrays .
consider it as a hardware that doesnt wait for the input unlike the general cpu but rather perform the calcualtions continuously and thus causing the reduction in memory traffic and improving efficiency.

the systolic array is composed of blocks referred to as processing elemnts.
the processing elements receive input , they also receive a weight , multily them , add to a running sum and forwards the data to the next element.
 
# the architecture . 

the main architecture blocks are :
# the innput feature memory
it hold the input activations or feature maps 
# the input buffer
holds the input and helps in improving the efficiency
# the weight buffer
holds the weight for the multiplications
# fsm controller
it coordinates how the input and weights are fed and also the movement of the data
# configurable pe array 
the actual processsing element cluster where the multiplication and running additon takes place
# accumulator
collects the partial sums into the final outputs
# output feature memory
stores the computed results.

