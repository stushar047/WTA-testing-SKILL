procedure(wta_simulation(i1 i2 i3 i4 vdd vc)

file = outfile("/home/stushar1/cadence/neuropipe/suny10lpe/wta_data_10_4.csv" "a");

simulator( 'spectre )
design(	 "/data1/stushar1/cmos10lpe/simulation/WTA_circuit/spectre/schematic/netlist/netlist")
resultsDir( "/data1/stushar1/cmos10lpe/simulation/WTA_circuit/spectre/schematic" )
modelFile( 
    '("$KITDIR/cmos10lpe/V1.5.0.0RF/Spectre/models/design.scs" "")
)
stimulusFile( ?xlate nil
    "~/cadence/neuropipe/suny10lpe/wta_graphical_stimuli.scs")
analysis('tran ?stop "4u"  ?errpreset "moderate"  ?triseTemp "1.0"  )
envOption('analysisOrder  list("tran") )
option( ?categ 'turboOpts
	'uniModeSpectreX  "Spectre" 
	'uniMode  "Spectre" 
)

;saveOption( 'currents "all" )
saveOption( 'pwr "all" )
;saveOption( 'save "all" )
save( 'i "/I13/VDD" "/I14/VDD" "/I16/VDD" "/I18/VDD")
temp( 27 ) 
run()
selectResult( 'tran )

;plot(getData("/I13/VDD") getData("/I14/VDD") getData("/I16/VDD") )

I1_out = average(i("/I13/VDD" ?result "tran"))

I2_out = average(i("/I14/VDD" ?result "tran"))

I3_out = average(i("/I16/VDD" ?result "tran"))

I4_out = average(i("/I18/VDD" ?result "tran"))

p_out = average(getData(":pwr" ?result "tran"))


(if (null e_out)

(begin 

(printf ("The variable in null")) 

(e_out=0)

)

(begin

(e_out = average(getData(":pwr" ?result "tran"))*2u))

);

printf("%e,%e,%e,%e,%e,%e,%e,%e,%e,%e,%e,%e\n" i1 i2 i3 i4 vdd vc I1_out I2_out I3_out I4_out p_out e_out);

fprintf(file "%e,%e,%e,%e,%e,%e,%e,%e,%e,%e,%e,%e\n" i1 i2 i3 i4 vdd vc I1_out I2_out I3_out I4_out p_out e_out);

close( file )

;I1_out I2_out

)
