# ----------------------------------------------------
# Displacement Controlled Analysis - ARBITRARY
# ----------------------------------------------------

# Turn on timer
set startTime [clock clicks -milliseconds]

# Run gravity analysis and generate the model
source Model.tcl

# ------------------------------
# Gravity load analysis
# ------------------------------
set SequenceNum 1
set PhX 1.0
set PhY 1.0
set PhZ 1.0

set Tol 1.e-5;                          # Convergence Test: tolerance
# Load Pattern for performing displacmeent- or force- controlled analysis:
pattern Plain [expr $SequenceNum] Linear {
	# Create the nodal load - command: load nodeID xForce yForce zForce xMoment yMoment zMoment
	load 64 [expr 0*$PhX] [expr 0*$PhY] [expr -43.84*$PhZ] 0 0 0
	load 65 [expr 0*$PhX] [expr 0*$PhY] [expr -43.84*$PhZ] 0 0 0
	load 66 [expr 0*$PhX] [expr 0*$PhY] [expr -43.84*$PhZ] 0 0 0
	load 67 [expr 0*$PhX] [expr 0*$PhY] [expr -43.84*$PhZ] 0 0 0
}

# ------------------------------
# Analysis generation
# ------------------------------
# Create the integration scheme, the LoadControl scheme using steps of 0.1
integrator LoadControl 0.01

# Create the system of equation, a sparse solver with partial pivoting
system BandGeneral

# Create the convergence test, the norm of the residual with a tolerance of
# 1e-5 and a max number of iterations of 100
test NormDispIncr $Tol  100 0

# Create the DOF numberer, the reverse Cuthill-McKee algorithm
numberer RCM

# Create the constraint handler, the transformation method
constraints Transformation

# Create the solution algorithm, a Newton-Raphson algorithm
algorithm Newton  # -initialThenCurrent

# Create the analysis object
analysis Static

# Run analysis
analyze 100
puts "Gravity load applied successfully";

loadConst -time 0.0

set load_step 1;
set reSolution 0;
set Ncycles 1;
set Pattern 200;

# Analysis sequence
set SequenceNum 1
set PhX "-102991";set PhY "0";
source ForcePush.tcl
set SequenceNum 2
set PhX "102991";set PhY "0";
source ForcePush.tcl
set SequenceNum 3
set PhX "102442";set PhY "0";
source ForcePush.tcl
set SequenceNum 4
set PhX "-102442";set PhY "0";
source ForcePush.tcl
set SequenceNum 5
set PhX "-102991";set PhY "0";
source ForcePush.tcl
set SequenceNum 6
set PhX "102991";set PhY "0";
source ForcePush.tcl
set SequenceNum 7
set PhX "102442";set PhY "0";
source ForcePush.tcl
set SequenceNum 8
set PhX "-102442";set PhY "0";
source ForcePush.tcl
set SequenceNum 9
set PhX "0";set PhY "-72016.6";
source ForcePush.tcl
set SequenceNum 10
set PhX "0";set PhY "72016.6";
source ForcePush.tcl
set SequenceNum 11
set PhX "0";set PhY "90085.9";
source ForcePush.tcl
set SequenceNum 12
set PhX "0";set PhY "-90085.9";
source ForcePush.tcl
set SequenceNum 13
set PhX "0";set PhY "-72016.6";
source ForcePush.tcl
set SequenceNum 14
set PhX "0";set PhY "72016.6";
source ForcePush.tcl
set SequenceNum 15
set PhX "0";set PhY "90085.9";
source ForcePush.tcl
set SequenceNum 16
set PhX "0";set PhY "-90085.9";
source ForcePush.tcl
set SequenceNum 17
set PhX "103448";set PhY "-73420.4";
source ForcePush.tcl
set SequenceNum 18
set PhX "-103448";set PhY "73420.4";
source ForcePush.tcl
set SequenceNum 19
set PhX "-66084.3";set PhY "49194.3";
source ForcePush.tcl
set SequenceNum 20
set PhX "66084.3";set PhY "-49194.3";
source ForcePush.tcl
set SequenceNum 21
set PhX "-103448";set PhY "-70893.5";
source ForcePush.tcl
set SequenceNum 22
set PhX "103448";set PhY "70893.5";
source ForcePush.tcl
set SequenceNum 23
set PhX "71846.7";set PhY "53225.3";
source ForcePush.tcl
set SequenceNum 24
set PhX "-71846.7";set PhY "-53225.3";
source ForcePush.tcl
set SequenceNum 25
set PhX "-112435";set PhY "0";
source ForcePush.tcl
set SequenceNum 26
set PhX "112435";set PhY "0";
source ForcePush.tcl
set SequenceNum 27
set PhX "111360";set PhY "0";
source ForcePush.tcl
set SequenceNum 28
set PhX "-111360";set PhY "0";
source ForcePush.tcl
set SequenceNum 29
set PhX "0";set PhY "-100895";
source ForcePush.tcl
set SequenceNum 30
set PhX "0";set PhY "100895";
source ForcePush.tcl
set SequenceNum 31
set PhX "0";set PhY "130115";
source ForcePush.tcl
set SequenceNum 32
set PhX "0";set PhY "-130115";
source ForcePush.tcl
set SequenceNum 33
set PhX "-86161.1";set PhY "-65779.6";
source ForcePush.tcl
set SequenceNum 34
set PhX "86161.1";set PhY "65779.6";
source ForcePush.tcl
set SequenceNum 35
set PhX "85520.9";set PhY "64736.7";
source ForcePush.tcl
set SequenceNum 36
set PhX "-85520.9";set PhY "-64736.7";
source ForcePush.tcl
set SequenceNum 37
set PhX "-112618";set PhY "0";
source ForcePush.tcl
set SequenceNum 38
set PhX "31510.1";set PhY "65458.7";
source ForcePush.tcl
set SequenceNum 39
set PhX "81107.6";set PhY "53606.3";
source ForcePush.tcl
set SequenceNum 40
set PhX "0";set PhY "-119065";
source ForcePush.tcl
set SequenceNum 41
set PhX "0";set PhY "-100113";
source ForcePush.tcl
set SequenceNum 42
set PhX "84354.7";set PhY "38765.8";
source ForcePush.tcl
set SequenceNum 43
set PhX "27645.6";set PhY "61347.5";
source ForcePush.tcl
set SequenceNum 44
set PhX "-112000";set PhY "0";
source ForcePush.tcl
set SequenceNum 45
set PhX "-223886";set PhY "0";
source ForcePush.tcl
set SequenceNum 46
set PhX "223886";set PhY "0";
source ForcePush.tcl
set SequenceNum 47
set PhX "220822";set PhY "0";
source ForcePush.tcl
set SequenceNum 48
set PhX "-220822";set PhY "0";
source ForcePush.tcl
set SequenceNum 49
set PhX "0";set PhY "-200748";
source ForcePush.tcl
set SequenceNum 50
set PhX "0";set PhY "200748";
source ForcePush.tcl
set SequenceNum 51
set PhX "0";set PhY "240055";
source ForcePush.tcl
set SequenceNum 52
set PhX "0";set PhY "-240055";
source ForcePush.tcl
set SequenceNum 53
set PhX "-178816";set PhY "-128230";
source ForcePush.tcl
set SequenceNum 54
set PhX "178816";set PhY "128230";
source ForcePush.tcl
set SequenceNum 55
set PhX "173488";set PhY "123096";
source ForcePush.tcl
set SequenceNum 56
set PhX "-173488";set PhY "-123096";
source ForcePush.tcl
set SequenceNum 57
set PhX "-221920";set PhY "0";
source ForcePush.tcl
set SequenceNum 58
set PhX "51586.9";set PhY "119386";
source ForcePush.tcl
set SequenceNum 59
set PhX "170333";set PhY "121071";
source ForcePush.tcl
set SequenceNum 60
set PhX "0";set PhY "-240456";
source ForcePush.tcl
set SequenceNum 61
set PhX "0";set PhY "-200748";
source ForcePush.tcl
set SequenceNum 62
set PhX "172574";set PhY "81121.5";
source ForcePush.tcl
set SequenceNum 63
set PhX "51861.3";set PhY "119627";
source ForcePush.tcl
set SequenceNum 64
set PhX "-224435";set PhY "0";
source ForcePush.tcl
set SequenceNum 65
set PhX "-338653";set PhY "0";
source ForcePush.tcl
set SequenceNum 66
set PhX "338653";set PhY "0";
source ForcePush.tcl
set SequenceNum 67
set PhX "331565";set PhY "0";
source ForcePush.tcl
set SequenceNum 68
set PhX "-331565";set PhY "0";
source ForcePush.tcl
set SequenceNum 69
set PhX "0";set PhY "-302827";
source ForcePush.tcl
set SequenceNum 70
set PhX "0";set PhY "302827";
source ForcePush.tcl
set SequenceNum 71
set PhX "0";set PhY "358779";
source ForcePush.tcl
set SequenceNum 72
set PhX "0";set PhY "-358779";
source ForcePush.tcl
set SequenceNum 73
set PhX "-278286";set PhY "-188475";
source ForcePush.tcl
set SequenceNum 74
set PhX "278286";set PhY "188475";
source ForcePush.tcl
set SequenceNum 75
set PhX "258392";set PhY "182157";
source ForcePush.tcl
set SequenceNum 76
set PhX "-258392";set PhY "-182157";
source ForcePush.tcl
set SequenceNum 77
set PhX "-337053";set PhY "0";
source ForcePush.tcl
set SequenceNum 78
set PhX "81633.5";set PhY "182619";
source ForcePush.tcl
set SequenceNum 79
set PhX "255419";set PhY "178367";
source ForcePush.tcl
set SequenceNum 80
set PhX "0";set PhY "-360986";
source ForcePush.tcl
set SequenceNum 81
set PhX "0";set PhY "-303027";
source ForcePush.tcl
set SequenceNum 82
set PhX "271426";set PhY "115816";
source ForcePush.tcl
set SequenceNum 83
set PhX "64941";set PhY "187211";
source ForcePush.tcl
set SequenceNum 84
set PhX "-336367";set PhY "0";
source ForcePush.tcl
set SequenceNum 85
set PhX "-466249";set PhY "0";
source ForcePush.tcl
set SequenceNum 86
set PhX "466249";set PhY "0";
source ForcePush.tcl
set SequenceNum 87
set PhX "446126";set PhY "0";
source ForcePush.tcl
set SequenceNum 88
set PhX "-446126";set PhY "0";
source ForcePush.tcl
set SequenceNum 89
set PhX "0";set PhY "-398087";
source ForcePush.tcl
set SequenceNum 90
set PhX "0";set PhY "398087";
source ForcePush.tcl
set SequenceNum 91
set PhX "0";set PhY "485726";
source ForcePush.tcl
set SequenceNum 92
set PhX "0";set PhY "-485726";
source ForcePush.tcl
set SequenceNum 93
set PhX "-364493";set PhY "-253693";
source ForcePush.tcl
set SequenceNum 94
set PhX "364493";set PhY "253693";
source ForcePush.tcl
set SequenceNum 95
set PhX "346199";set PhY "239855";
source ForcePush.tcl
set SequenceNum 96
set PhX "-346199";set PhY "-239855";
source ForcePush.tcl
set SequenceNum 97
set PhX "-450013";set PhY "0";
source ForcePush.tcl
set SequenceNum 98
set PhX "113418";set PhY "244668";
source ForcePush.tcl
set SequenceNum 99
set PhX "336595";set PhY "230830";
source ForcePush.tcl
set SequenceNum 100
set PhX "0";set PhY "-475498";
source ForcePush.tcl
set SequenceNum 101
set PhX "0";set PhY "-404504";
source ForcePush.tcl
set SequenceNum 102
set PhX "358776";set PhY "150010";
source ForcePush.tcl
set SequenceNum 103
set PhX "97640.1";set PhY "254495";
source ForcePush.tcl
set SequenceNum 104
set PhX "-456416";set PhY "0";
source ForcePush.tcl
set SequenceNum 105
set PhX "-680965";set PhY "0";
source ForcePush.tcl
set SequenceNum 106
set PhX "680965";set PhY "0";
source ForcePush.tcl
set SequenceNum 107
set PhX "661758";set PhY "0";
source ForcePush.tcl
set SequenceNum 108
set PhX "-661758";set PhY "0";
source ForcePush.tcl
set SequenceNum 109
set PhX "0";set PhY "-602445";
source ForcePush.tcl
set SequenceNum 110
set PhX "0";set PhY "602445";
source ForcePush.tcl
set SequenceNum 111
set PhX "0";set PhY "715553";
source ForcePush.tcl
set SequenceNum 112
set PhX "0";set PhY "-715553";
source ForcePush.tcl
set SequenceNum 113
set PhX "-544224";set PhY "-376428";
source ForcePush.tcl
set SequenceNum 114
set PhX "544224";set PhY "376428";
source ForcePush.tcl
set SequenceNum 115
set PhX "524330";set PhY "362790";
source ForcePush.tcl
set SequenceNum 116
set PhX "-524330";set PhY "-362790";
source ForcePush.tcl
set SequenceNum 117
set PhX "-688740";set PhY "0";
source ForcePush.tcl
set SequenceNum 118
set PhX "183390";set PhY "368005";
source ForcePush.tcl
set SequenceNum 119
set PhX "505350";set PhY "347348";
source ForcePush.tcl
set SequenceNum 120
set PhX "0";set PhY "-715353";
source ForcePush.tcl
set SequenceNum 121
set PhX "0";set PhY "-604851";
source ForcePush.tcl
set SequenceNum 122
set PhX "545824";set PhY "231833";
source ForcePush.tcl
set SequenceNum 123
set PhX "146803";set PhY "373018";
source ForcePush.tcl
set SequenceNum 124
set PhX "-692627";set PhY "0";
source ForcePush.tcl

# Print the state at control node
print node $IDctrlNode

set finishTime [clock clicks -milliseconds];
set timeSeconds [expr ($finishTime-$startTime)/1000];
set timeMinutes [expr ($timeSeconds/60)];
set timeHours [expr ($timeSeconds/3600)];
set timeMinutes [expr ($timeMinutes - $timeHours*60)];
set timeSeconds [expr ($timeSeconds - $timeMinutes*60 - $timeHours*3600)];
puts "
----------------------------------";
puts "
";
puts "TOTAL TIME TAKEN $timeHours:$timeMinutes:$timeSeconds";
puts "Initial stiffness used $reSolution times"
puts "
----------------------------------";