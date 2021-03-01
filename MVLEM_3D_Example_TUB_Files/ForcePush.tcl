# ----------------------------------------------------
# Force Controlled Analysis
# ----------------------------------------------------
puts "Sequence $SequenceNum of 124."

# Set the loads to be constant & reset the time in the domain
loadConst -time 0.0

# Load Pattern for performing displacmeent- or force- controlled analysis:
pattern Plain [expr $SequenceNum + 1] Linear {
	# Create the nodal load - command: load nodeID xForce yForce zForce xMoment yMoment zMoment
	load 51 [expr 0*$PhX] [expr 0.5*$PhY] [expr 0*$PhZ] 0 0 0
	load 23 [expr 0*$PhX] [expr 0.5*$PhY] [expr 0*$PhZ] 0 0 0
	load 25 [expr 1*$PhX] [expr 0*$PhY] [expr 0*$PhZ] 0 0 0
}

# ------------------------------
set Tol 1.e-5;                          # Convergence Test: tolerance
set maxNumIter 100;              	   	# Convergence Test: maximum number of iterations that will be performed before "failure to converge" is returned
set printFlag 0;                		# Convergence Test: flag used to print information on convergence (optional)        # 1: print information on each step; 
set TestType NormDispIncr;				# Convergence-test type
set algorithmType KrylovNewton 

constraints Transformation; 
numberer RCM
system BandGeneral
test $TestType $Tol $maxNumIter $printFlag
algorithm $algorithmType;     	
analysis Static

integrator LoadControl [expr 1.0/$StepsPerSequence]
set ok [analyze $StepsPerSequence];	# Perform analysis; returns ok=0 if analysis was successful

if {$ok != 0} {      ;	# if analysis was not successful.
	# change some analysis parameters to achieve convergence
	# performance is slower inside this loop
	#    Time-controlled analysis
	set reSolution [expr $reSolution + 1];
	set ok 0;
	set controlTime [getTime];
	while {$controlTime < 1.0 && $ok == 0} { # if not all load applied and 
		set ok [analyze 1]
		# set controlTime [getTime]
		# set ok [analyze 1]
		if {$ok != 0} {
			puts "Trying Newton with Initial Tangent .."
			test NormDispIncr   $Tol 1000  $printFlag
			algorithm Newton -initial
			set ok [analyze 1]
			
			test $TestType $Tol $maxNumIter $printFlag
			algorithm $algorithmType
		}
		set controlTime [getTime]
	}
};  # end if ok !0     

# Interrupt analysis if failed at some sequence
if {$ok != 0} {
    puts "Pushover Analysis FAILED at Sequence $SequenceNum."
    puts "Do you wish to continue y/n ?";
    gets stdin ans;                           
    if {$ans == "n"} 
	return -level 3                      
}