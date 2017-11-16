;Maxwell E Franklin
;University of Alaska Anchorage
;Kenai River SES Simulation

__includes ["Reporting.nls"]
globals
[
 threshold
 dims
 filename
 early-sock
 early-chin
 sim-day
 comm-day
 comm-week
 sock-start ;starting point in sockeye run list for seeding salmon
 chin-start ;starting point in chinook run list for seeding salmon
 patch-sel
 drift-agents
 set-agents
 floodplain-intervals
 number-floodplains
 vision
 minimum-separation
 max-align-turn
 max-cohere-turn
 max-separate-turn
 max-attractant-turn
 sum_set_list
 sum_set_eff_list
 sum_set_king_list
 avg_set_har
 sd_set_har
 avg_drift_har
 sd_drift_har
 avg_set_har_pdf
 sd_set_har_pdf
 set_eff_adj
 set_eff_adj_list
 drift_eff_adj
 ken_open_list
 kas_open_list
 drift_open_list
 dip_king_har_list
 ken_fishing_allowed?
 kas_fishing_allowed?
 set_fished
 set_eff
 regular_period_list
 sockeye_escapement_list
 days_open_ken
 days_open_kas
 sock_har_21_22 ;;Daily recordings of sockeye or chinook harvest by set gillnet section for proportional comparison.
 sock_har_31_32
 sock_har_41_42
 chin_har_21_22
 chin_har_31_32
 chin_har_41_42
 daily_permits_fished_21_22 ;;Record the number of set gillnet permits fished by section on a daily basis during the model run time.
 daily_permits_fished_31_32
 daily_permits_fished_41_42
 ken_closed?
 ken_opened?
 kas_closed?
 kas_opened?
 drift_closed?
 drift_opened?
  set_21_22_fished
  set_31_32_fished
  set_41_42_fished
  total_set_perm_fished
 ; set_21_22_permits
 ; set_31_32_permits
 ; set_41_42_permits
  set_21_22_eff
  set_31_32_eff
  set_41_42_eff
  drift_daily_king_harvest
  drift_daily_harvest
  set_daily_harvest
  drift_har_%_tot
  king_sonar_list
  ken_eo?
  ken_ec?
  kas_eo?
  kas_ec?
  drift_eo?
  drift_ec?
  regular_period?
  set_sock_depth_adj
  set_chin_depth_adj
  drift_sock_depth_adj
  drift_chin_depth_adj
  sockeye_cum%_depth
  chinook_cum%_depth
  sockeye_accumulator
  chinook_accumulator
  avg_chinook_list
  var_chinook_list
  calc_week
  calc_day
  calc_sockeye_run_list
  calc_chinook_run_list
  dip_son_adj_var
  dip_son_adj_list
  set_son_adj_var
  set_son_adj_list
  drift_son_adj_var
  drift_son_adj_list
  drift_eff ;;for determining the overall level of drift gillnet effort on a given day.
  set_scale ;;scale of setnetters/agent. Automatically calculated such that there are always a maximum of 20 boats in the simulation. There will always be more
  ;;boats than we can represent due to the size of the simulation, hence why we just set an upper limit of 20 boats for each commercial stakeholder group and let the scale adjust itself accordingly
  ;;based on the number of permits fished.
  drift_scale ;;scale of gillnetters/agent. Automatically calculated as above.
  setgillnet_days_open
  driftgillnet_days_open
  sockeye_daily_run_list
  r_list ;;list of rate of change weighted with progression of season.
  EO? ;emergency opening for commercial fleet
  EC? ;emergency closure for commercial fleet
  day1 ;;day1-day7 are used for reporting the temporal distribution of dipnet effort, ie., how many dipnetters stayed xyz many days.
  day2
  day3
  day4
  day5
  day6
  day7
  hhdf ;number of household days fished throughout the season. cumulative. Found by hhd/agent * permit days fished
  run_class ;The overall run dynamics that are in the simulation.
  mean_set ;;reporter for average set gillnet harvest.
  mean_drag ;;reporter for average drift gillnet harvest.
  sum_set ;;reporter for total set gillnet harvest.
  sum_drag ;;reporter for total drift gillnet harvest.
  sockeye_sonar_list ;;reporter containing simulation recorded sonar values over duration of the simulation.
  sum_run
  sockeye_run_avg
  sockeye_run_sd
  ;;lists containing calculated values for each day from the sonar counts.
  sum_III
  sum_IV
  sum_III-IV
  sum_III-IV-V
  avg_III
  sd_III
  avg_IV
  sd_IV
  avg_III-IV
  sd_III-IV
  avg_III-IV-V
  sd_III-IV-V
  sockeye_daily_run
  chinook_daily_run
  ;daily_sd
  chinook_daily_total
  chinook_sonar
  escaped_chinook
  setnet_tracker
  gillnet_tracker
  dipnet_tracker
  season-dipnet-limit
  Time ;;Overall time passed in terms of the go-button, different from ticks. Helps determine when a large run of sockeye is coming in.
  IDnumber ;; used in assigning school ID numbers to the different generated groups of fish.
  border ;;border of map --> rain dies when it drips to the border.
  water-height ;;for calculating depth of water.
  tributarycolor ;;Used for differentiating between tributaries for help with coding.
  river# ;;for giving patches appropriate river-patch#. Essentially gives the patches a river ID number.
  river-size ;;Somewhat used for various functions including how much erosion a river causes. Will be phased out soon.
  node#cycler ;;Used for assigning an overall node# to patches. Not currently utilized in this version, will reimplement later as stream orders.
  spring#cycler ;;Used in assigned different ID numbers to the patches where rivers are spawned from.
  shoreline ;;This is what you think it is.
  riverbanks ;;the portion of the rivers that the sockeye preferentially swim in.
  escaped_sockeye ;;value of spawned or otherwise dead sockeye that made it up the tributaries
  temp-g ;;A tempory global variable used in more than one procedure occasionally as the same value.
  amount-waviness ;;How much variation the main river CAN have when being drawn out.
  day ;;days passed since start of simulation
  sockeye_sonar
  dailyTotal
  time_scale
  situation_assessed?
  week ;;what week is it?
  day-counter ;;flipping day counter that increments the week.
  daily_multiplier
  dipnet_multiplier
  season_total_list ;a list of the total amount of fish caught by each dipnetter over the course of them fishing
  dipnet_daily_mean_harvest ; a list of mean values from daily dipnet catches
  dipnet_daily_sd_harvest ; a list of sd values from daily dipnet catches.
  date
  dipnet_days_fished ;list of daily total count dipnetters

  total_number_dipnetters ;season total number of dipnetters (len season_total_list) <-- This list is filled with a number of values = to number of reporting dipnetters
  list_failed_dipnetters ;list of 0's from failed dipnetters
  total_number_failed_dipnetters ;total number of dipnetters who failed to catch anything (len list of dipnetters who report 0 for catch_total)
  mean_season_dipnet_harvest ;mean season total for each dipnetter
  max_dipnet_harvest;
  min_dipnet_harvest;
  sum_dipnet_days_fished ;number of days fished by dipnetters. Can divide total_number_dipnetters by this value to obtain proportions of dipnetters who left after one day vs. proportion who stayed more than one day.
  sum_dipnet_season_total ;total number of sockeye caught by dipnetters
  flock-wiggle
  ;open_tracker?
  dip_open_check?
  set_open_check?
  drift_open_check?
  drift_gillnet_effort_list ;;Following record the number of permits fished on a given day so that bar plots can be made of fishing effort in weekly or other time specified periods.
  set_gillnet_effort_list
]

patches-own
[
  sockeye_school_zone?
  deep_water_zone?
  riverMouth?
  dipnet_zone?
  attractant-list? ;;for determining if patches have been assigned an attractant list or not.
  sockeye_list ;; Same list as attractant list except modified for Sockeye such that they are more attracted towards the shoreline.
  chinook_list
  spring# ;;number of originating spring for a tributary.
  node# ;;Gives each set of rivers (primary river, tributaries, 2º tributaries) a number.
  node? ;;For splitting off of flood plains and for loosely determining location of tributaries.
  river? ;;used for differentiating b/w ocean and river.
  elevation ;;Elevation value of patches.
  elevation-here ;;For temporarily storing elevation values before making another elevation modification. Helpful for erroding portions of land.
  temp ;;for placing tributaries in higher elevations.
  temp2 ;;draw out elevation when first drawing tributaries --> revert to temp elevations when letting raindrops assign attractant.
  ocean? ;;differentiating b/w ocean and river
  river-patch# ;;each river or tributary gets its own number.
  floodplains? ;;Do you want floodplains?
  land# ;;Used in determining where tributaries spawn.
  gage-height ;;water level --> essentially elevation of the patch w/ water included.
  depth ;;depth or volume = level - elevation
  ocean-depth ;;Depth of an ocean patch.
  stream-attractant ;;Stream attractant values stored in a list where each member of the list corresponds to a stream ID.
  ocean-attractant ;;Getting phased out since stream attractant is spread everywhere. Still used in several procedures though as a differential variable.
  attractant-list ;;The list where different attractant values corresponding with stream IDs are placed for any given patch.
  ocean-head ;;The patch where stream attractant radiates outward into the ocean.
  base_river? ;;The patches which comprise the main river.
  side ;;Patches on either side of the river. Only used if experimental wedge procedure is activated in setup.
  depthAdder ;;One of the mechanisms for adding depth to streams by downward flow of turtles down tributaries. Not used in this version right now.
  riverbank? ;;for differentiating the shallower portion of the river from the deeper portions.
  pre_cross?
  cross_zone?
  side_length ;;length of the side of a patch in ft.
]

turtles-own
[
  limit? ;;for determining if a fisherman has reach their harvest limit. ;;for determining if an agentset of fishermen is allowed to fish or not.
  open?
  tributary-counter ;;Currently used for spacing out nodes along 1º tributaries for which 2º tributaries are generated from.
  river-turtle# ;;Used in conjunction with river-patch# and river# for assigning appropriate river-patch#.
  schoolID ;; Identifier for which school a turtle belongs too
  flockmates         ;; agentset of nearby turtles
  nearest-neighbor   ;; closest one of our flockmates
  stream# ;; For sockeye and fish only
  node-attractant ;;.....What?
  hitpoints ;;Hitpoints of the salmon. Their lifeforce composite value.
  gender ;; xx = female, xy = male.
  sonar1
  catch_total ;;total amount of fish caught - contributes to a fisherman's happiness value.
  season_total
  motivation ;;random number assigned to each fisherman that helps determine how likely they are to go out fishing.
  happiness ;;determine by both motivation and the catch_total. Happiness in turn determines whether or not a fishermen will go fishing on a given day or will look for a new spot.
  speed ;;speed of a given agent. update speed of the world is matched to the maximum speed of sockeye (2.60km/hr) such that the quickest sockeye still only move a maximum
        ;;of one patch/tick.
  random_number
  netsize ;;size of nets used.
  net_length ;;max aggregate net length in fathoms or ft if either commercial or dipnetter, respectively.
  surface% ;;chance of catch spread over the radius area of the netsize. This has to be calculated since we are implementing radii instead of straight lines for the nets.

]

breed [ nodes node ]
breed [ raindrops raindrop ] ;;currently used for drawing tributaries. might be used for rain, later.
breed [ waters water ] ;;not really used right now --> for depth calcultion when raining.
breed [ gillnetters gillnetter ] ;;Gillnetter breed --> Looks like little boats in the world.
breed [ setnetters setnetter ] ;;Setnetter breed --> Looks like truck.
breed [ radius-circles radius-circle ] ;;the illustration of radius size of the setnet, dipnet, or gillnet.
breed [ sockeyes sockeye ] ;;Sockeye species of salmon
breed [ chinooks chinook ] ;;Chinook species of salmon
breed [dipnetters dipnetter ] ;;Dipnetter breed --> Looks like a little guy with net.
breed [ sportfishers sportfisher ] ;;Sportfisherman breed. Not added yet.
breed [ depth_adders depth_adder ] ;;Breed of turtle used for adding depth.
breed [ deathspots deathspot ] ;;Breed of turtling for showing where fish died.
deathspots-own [ netted? died? ] ;;determines whether or not the fish died from being caught (netted?) or from natural causes (died?).


sportfishers-own [ hookType ] ;;treble hook, etc. Not used yet.
sockeyes-own
[ catch_chance ;;When fish enter radius of fishermen, this is the chance that they'll be caught based on which radius they are in.
  #fish
  dist-trav
  history
  spx
  spy
  sx
  sy
  pmov
  angle
]
chinooks-own
[ catch_chance
  #fish
  dist-trav ]
dipnetters-own [ household_size dip_avg days_fished previous_harvest chinook_harvest sockeye_harvest number_fishers chinook_catch_total chinook_season_total sock_mod chin_mod fishing_allowed? chinook_limit?
  sockeye_adj_factor chinook_adj_factor sock_list chin_list ]

directed-link-breed [ effectsof effectof ] ;;a directed link to the drawn radius for netsize.
directed-link-breed [ a-links a-link ]
gillnetters-own [  drag_avg previous_harvest chinook_harvest sockeye_harvest drift_agents selected? expectation chinook_catch_total chinook_season_total sock_mod chin_mod fishing_allowed? chinook_limit?
  sockeye_adj_factor chinook_adj_factor sock_list chin_list ]
setnetters-own [  set_avg previous_harvest chinook_harvest sockeye_harvest set_agents selected? expectation
  chinook_catch_total chinook_season_total sock_mod chin_mod set_section fishing_allowed? chinook_limit? kenai? kasilof? sockeye_adj_factor chinook_adj_factor sock_list chin_list]


to setup
  ;no-display ;;when active, this paired with display command at the end of setup saves on computational time.
  clear-all ;;whipe the previous world away.
  ;;setup must be run with random flow, otherwise, 1º tributaries will never reach 1º river, and setup will be caught in an infinite loop.
  ;set dims 4
  ;set threshold 2
  ask patches
  [
    ;;Zero out everything.
    set elevation 0
    set node# 0
    set river-patch# 0
    set node? false
    set river? false
    set elevation-here 0
    set ocean? false
    set floodplains? false
    set land# 1
    set ocean-depth 0
    set stream-attractant 0
    set ocean-attractant 0
    set attractant-list [ 0 ]
    set sockeye_list [ 0 ]
    set chinook_list [ 0 ]
    set spring# 0
    set ocean-head 0
    set attractant-list? false
    set gage-height 0
    set base_river? false
    set amount-waviness 2 ;;Starting value for the likely hood of the river introducing bends into it's form.
    set side_length 990 ;;every 16 patches in 16 * 330 ft = 5280 ft = 1 mi.
  ]

  set threshold 4
  set dims 2
  set drift-agents 30
  set set-agents 25
  set floodplain-intervals 56
  set number-floodplains 10
  set max-cohere-turn 3
  set max-separate-turn 1
  set max-attractant-turn 5.25
  set flock-wiggle 5
  set vision 3
  set minimum-separation 1
  set max-align-turn 9
  set sum_set_king_list [ ]
  set sum_set_list [ ]
  set sum_set_eff_list [ ]
  set set_eff_adj_list [ 0 ] ;for the first day of the simulation, an effort adjustment cannot be made.
  set avg_set_har_pdf [ 0  0  0  0  0  0  0  44.9339207  85.60311284  75.48638132  50.97276265  55.76132126  189.3889371  317.6550731  242.302161  355.6873156  321.2613386  282.295114  282.3556979  322.780925  280.3582262  206.7915016  181.3492327  185.2116455  132.5854438  175.1560772  159.7842529  128.5323625  89.13819994  65.03877018  55.54916682  44.98448628  59.30990798  38.7216388  34.82361984  43.6263831  33.82266841  30.19263682  45.06872731  78.32218348  50.64839011  53.53689823  81.63723131  48.84716397  46.2384701 ]
  set sd_set_har_pdf [ 0  0  0  0  0  0  0  0  0  0  0  28.04546479  97.02678799  218.8213114  176.8207617  229.6510246  179.7790377  178.5706119  137.3417114  147.9718349  140.3583232  130.8278025  115.7538095  113.3034221  71.29989752  103.1931613  104.5076897  76.95535927  58.43595801  41.54944882  43.54314428  41.25536966  48.75160558  22.03879516  19.65740926  25.03518611  16.38938604  17.36093049  30.08756725  39.13558343  29.1243788  40.32221483  62.2879921  32.54034947  33.78773438 ]
  set avg_set_har [ 0  0  0  0  0  0  0  107.3684211  338.9473684  543.1578947  681.0526316  1684.210526  4578.947368  9821.052632  19498.94737  45519.15789  76532.10526  115849.1579  168183.3158  223430.3684  273389.4211  327354.1053  360803.4211  395271.1579  432335.3684  484088  515529.0526  540712.4211  567184.5263  580263.4737  591301.3684  603221.3684  619523.4737  627295.0526  634338.2105  646245.5789  653000.3158  658984.5263  662732.9474  669128.7368  673276.1053  677083.4737  682848.7368  686328.7368  689691.8947 ]
  set sd_set_har [ 0  0  0  0  0  0  0  107.3684211  338.9473684  543.1578947  681.0526316  819.0977963  1840.930004  3922.877139  6486.591475  8020.681788  10128.11628  13427.51632  16796.29949  18941.04375  21032.43821  21907.65537  22775.58643  23294.24299  24508.94671  25765.28132  26752.9348  27447.86388  28119.15533  28476.91461  28832.11469  29175.10737  29517.63852  29712.12655  29929.8095  30269.58709  30448.66696  30639.13368  30787.27514  30978.59929  31120.24682  31221.33736  31411.99271  31524.95314  31592.10174 ]
  set avg_drift_har [ ]
  set sd_drift_har [ ]
  set set_eff_adj 0
  set drift_eff_adj 0

  let min-limit 2533975 ;;minimum actual run size of sockeye returning to Kenai between 2002-2014.
  let max-limit (6199394 - min-limit + 1) ;;maximum actual run size of sockeyere returning to Kenai between 2002-2014.
  if sockeye-run-size = 0 [ set sockeye-run-size min-limit + random max-limit ] ;;If user has set sockeye-run-size to 0, randomly set the run to be between the lower and upper limit.
  set min-limit 34
  set max-limit (99 - min-limit + 1)
  if dipnetters/agent = 0 [ set dipnetters/agent round ((min-limit + random max-limit) * dip-effort-mag-adj) ]
  set min-limit 315
  set max-limit (385 - min-limit + 1)
  if total-set-permits = 0 [ set total-set-permits min-limit + random max-limit ]
  set min-limit 145
  set max-limit (210 - min-limit + 1)
  if set_21_22_permits = 0 [ set set_21_22_permits min-limit + random max-limit ]
  set min-limit 103
  set max-limit (139 - min-limit + 1)
  if set_31_32_permits = 0 [ set set_31_32_permits min-limit + random max-limit ]
  set min-limit 71
  set max-limit (128 - min-limit + 1)
  if set_41_42_permits = 0 [ set set_41_42_permits min-limit + random max-limit ]
  set min-limit 378
  set max-limit (496 - min-limit + 1)
  if total-drift-permits = 0 [ set total-drift-permits min-limit + random max-limit ]
  set min-limit 19353
  set max-limit (75557 - min-limit + 1)
  if chinook-run-size = 0 [ set chinook-run-size min-limit + random max-limit ]

  set dipnetters/agent round (dipnetters/agent * dip-effort-mag-adj)
  set ken_open_list [ ]
  set kas_open_list [ ]
  set drift_open_list [ ]
  set sockeye_escapement_list [ ]
  set total_set_perm_fished 0
  set set_21_22_fished 0
  set set_31_32_fished 0
  set set_41_42_fished 0
  ;set set_21_22_permits 0
  ;set set_31_32_permits 0
  ;set set_41_42_permits 0
  set set_21_22_eff 0
  set set_31_32_eff 0
  set set_41_42_eff 0
  set drift_daily_king_harvest [ ]
  set drift_daily_harvest [ ]
  set sock_har_21_22 [ ]
  set sock_har_31_32 [ ]
  set sock_har_41_42 [ ]
  set chin_har_21_22 [ ]
  set chin_har_31_32 [ ]
  set chin_har_41_42 [ ]
  set set_daily_harvest [ ]
  set drift_har_%_tot [ ]
  set king_sonar_list [ ]
  set ken_opened? false
  set ken_closed? false
  set kas_opened? false
  set kas_closed? false
  set drift_opened? false
  set drift_closed? false
  set ken_eo? false
  set ken_ec? false
  set kas_eo? false
  set kas_ec? false
  set drift_eo? false
  set drift_ec? false
  ;;list is cumulative percentage found above (shallower) than a given depth. List starts at 1m. eg. 38% of sockeye are found at depths shallower than 1m and so on.
  ;;These lists were constructed from a paper published by Kintama and released to the State of AK for understanding migratory patterns of chinook and sockeye in the year 2013.
  set sockeye_cum%_depth [ 0.38  0.63  0.74  0.83  0.88  0.90  0.93  0.95 0.96  0.98 ]
  set chinook_cum%_depth [ 0.8  0.19  0.25  0.41  0.55  0.62  0.73  0.85  0.89  0.94 ]
  set sockeye_accumulator 0
  set chinook_accumulator 0
  set sockeye_daily_run 0
  set chinook_daily_run 0
  set avg_chinook_list [ 594.75 570.7083333 638 627.1666667 759.7916667 734.2083333 878.125 879.9583333 853.125 926.6666667 1035.75 1068.333333 1258.875 1409.916667 1475.125 1651.291667 1838.416667 1778.208333 1622.416667 1735.166667 1606.041667 1351.958333 1392.791667 1445.625 1296.541667 1151 1339.541667 1221 1037.5 1015.75 994.375 726.5652174 640.3913043 590.5652174 701.15 689.5294118 704.8125 645.875 652.5384615 469.6666667 390.1818182 622.5 ]
  set var_chinook_list [ 50.2735362 65.9746185 98.02493398 72.65724244 88.46023792 64.4688718 89.96717019 106.1734375 103.4103671 119.7494466 167.2578744 159.4802435 200.7491974 181.2361731 148.0389602 155.0363034 191.0235959 154.904283 184.2635647 208.1342121 194.2256875 145.8430077 125.5700333 160.5182144 149.3095702 102.6915495 154.4482815 117.9232894 97.06767772 118.5111939 108.7707803 74.91686873 77.93723377 68.48180931 77.21065767 90.8133233 80.11976549 66.33933442 85.50053347 74.80270346 57.66026175 75.5 ]
  set dip_son_adj_list [ 1.1942026752 1.3591487096 1.3843443795 1.5327388343 1.5817106366 2.2882957663 2.1221987963 1.3880338332 1.3794672555 1.8109156354 1.7252687895 1.3571920002 1.5577315024 1.3206790477 1.3022765456 1.3446002497 1.3275308089 1.3118204103 1.2276801523 1.2239754466 1.2102576161 1.1744348806 ]
  set dip_son_adj_var [ 0.0913528714 0.3480134306 0.1812391461 0.228469852 0.2693082054 0.8349396273 0.7586113698 0.3765943971 0.1859009278 0.5172055092 0.577084283 0.2108848102 0.4764708693 0.1352873213 0.128968723 0.0921473797 0.1474856029 0.1395853774 0.0451576269 0.0820327931 0.0685777449 0.0660626149 ]
  ;set drift_son_adj_list [ 3.2335791624 6.7211167306 2.8744080147 2.1484857363 1.4292469135 1.1346254421 1 ]
  set drift_son_adj_list [ 3.233579162  6.721116731  3.133909613  2.235535155  1.412301733  1.132750685  1 ]
  ;set drift_son_adj_var [ 2.1544174914 8.9234283004 2.1921646379 0.6710235046 0.2699727095 0.1284316223 0 ]
  set drift_son_adj_var [ 2.154417491  8.923428301  2.106612192  0.740507994  0.264182399  0.126955892  0 ]
  set set_son_adj_list [ 1.521113885 2.67210857 1.928983844 1.627321202 1.536001896 1.693227037 1 ]
  set set_son_adj_var [ 0.280480107 1.495298694 0.733036939 0.412471716 0.284846706 0.482914826 0 ]
  set calc_sockeye_run_list [ ]
  set calc_chinook_run_list [ ]
  set drift_gillnet_effort_list [ ]
  set daily_permits_fished_21_22 [ ]
  set daily_permits_fished_31_32 [ ]
  set daily_permits_fished_41_42 [ ]
  set set_gillnet_effort_list [ ]
  set setgillnet_days_open [  ]
  set driftgillnet_days_open [  ]
  set days_open_ken [ ]
  set days_open_kas [ ]
  set r_list [ 0 ]
  set sockeye_daily_run_list [ ]
  set EC? false
  set EO? false
  set hhdf [ ]
  set setnet_tracker 0
  set gillnet_tracker 0
  set sockeye_sonar_list [ ]
  ;;The following are lists of averaged sonar counts from similar sockeye salmon run profiles published by ADFG.
  set avg_III-IV-V [ 2919  3817  3906  4142  5079  6447  6945  6832  9390  7777  6660  9136  7838  11503  22283  23133  36921  31623  38628  42363  34090  36323  53100  57972  46742  51316  53580  59552  53531  44992  50142  62110  49848  27158  22837  27508  24670  19466  18419  18354  16579  20451  21153  22080  25442  30002  30746  25597  24598  32106  31374  19270  20659  21288  27579  26545  22538 ]
  set sd_III-IV-V [ 712  908  982  1002  937  940  1496  1672  2757  1926  1426  3719  2928  4452  9950  9996  11008  7135  6377  8475  4838  6223  7444  6941  8157  14035  10427  9382  9697  7332  8039  14683  11099  5897  6696  8046  5596  5085  5031  3792  3040  4816  4895  3744  4347  5709  7514  6963  6819  7393  8652  5592  8469  6908  669  3436  9114 ]
  set avg_III-IV [ 2918  3711  3714  4199  4284  3582  3574  4610  4065  6961  12947  20588  26331  39439  45441  58728  58684  68693  46627  57358  69508  68719  66816  71100  71374  59773  50860  44968  38069  28078  24562  20967  19168  20489  21707  17175  16659  15294  13936  16739  19682  20908  19926  16713  17223  14747  10856  19316  14305 ]
  set sd_III-IV [ 719  960  905  1088  1217  909  691  1022  919  2688  6922  9984  11569  16001  18212  19347  12399  13399  10664  13984  16507  17220  14152  12942  14575  12851  10978  9541  7903  5575  7177  7105  5290  5167  5557  3436  3281  2389  2710  3987  6434  7216  7557  5739  3429  3509  2320  5375  5817 ]
  set avg_IV [ 1165  722  633  912  1023  1541  1538  2124  1979  4279  20129  10089  20170  22740  21628  29528  17167  25446  26755  21763  41742  79075  85792  79325  75693  77132  56996  41226  27287  23646  15364  12620  11936  8885  11795  14925  16207  18507  14761  12185  6999  7866 ]
  set sd_IV [ 519  240  138  314  277  422  742  1166  1448  2450  18507  8512  18619  13618  10408  16763  8339  12174  12153  11064  15620  24387  26129  17786  9189  14597  15482  11430  6770  6986  4835  6814  7699  5402  5076  7252  7329  8286  6798  5208  2844  2921 ]
  set avg_III [ 2629  2797  2397  3339  5344  5875  3322  3763  7654  12480  10537  10813  16252  38428  61209  80256  96391  76092  64132  66917  50549  27561  29126  28220  29020  26123  24823  20009  17559  15423  12406  14658  15452  15140  11891  12530  13017  10028  8121  9934  9460  7726  7508  8182  6285  8567  6754  3505 ]
  set sd_III [ 710  695  532  1058  2013  2134  766  891  2523  6647  4726  5466  5605  14138  16734  21674  23046  15582  10318  10691  6920  3815  8717  9291  8794  6751  6857  4951  3945  3844  2604  3053  3466  4738  2453  2454  3031  2118  1941  2526  2104  1714  1822  2080  3440  5075  5238  2167 ]
  let III (sum avg_III)
  let IV (sum avg_IV)
  let III-IV (sum avg_III-IV)
  let III-IV-V (sum avg_III-IV-V)
  ;;Determine simulation run timing dynamics based on user input.
  if Run-Type = "III"
  [ set run_class "III" set sockeye_run_avg avg_III set sockeye_run_sd sd_III set sum_run III ]
  if Run-Type = "IV"
  [ set run_class "IV" set sockeye_run_avg avg_IV set sockeye_run_sd sd_IV set sum_run IV ]
  if Run-Type = "III-IV"
  [ set run_class "III-IV" set sockeye_run_avg avg_III-IV set sockeye_run_sd sd_III-IV set sum_run III-IV ]
  if Run-Type = "III-IV-V"
  [ set run_class "III-IV-V" set sockeye_run_avg avg_III-IV-V set sockeye_run_sd sd_III-IV-V set sum_run III-IV-V ]
  ;;If the random run type selection is used, run the biased roulette wheel for finding the run to simulate. Chance of selection based on representation of patterns in ADFG data.
  if Run-Type = "random"
  [ let x (random 33) + 1
    if x >= 1 and x <= 11 [ set sockeye_run_avg avg_III set sockeye_run_sd sd_III set sum_run III set run_class "III"]
    if x > 11 and x <= 22 [ set sockeye_run_avg avg_III-IV set sockeye_run_sd sd_III-IV set sum_run III-IV set run_class "III-IV"]
    if x > 22 and x <= 29 [ set sockeye_run_avg avg_III-IV-V set sockeye_run_sd sd_III-IV-V set sum_run III-IV-V set run_class "III_IV_V"]
    if x > 29 [ set sockeye_run_avg avg_IV set sockeye_run_sd sd_IV set sum_run IV set run_class "IV"]
  ]
  set chinook/agent sockeye/agent
  set set_scale round total-set-permits / set-agents ;;Simple algebra - divide total number of permits for a given year by the number of boats you want to represent.
  set drift_scale round total-drift-permits / drift-agents ;;As above. See variable comments for logic behind this.
  set dip_open_check? true
  set set_open_check? true
  set drift_open_check? true
  set list_failed_dipnetters [ ]
  set dipnet_days_fished [ ]
  set date [ ]
  set dipnet_daily_mean_harvest [ ]
  set dipnet_daily_sd_harvest [ ]
  set season_total_list [ ]
  set dip_king_har_list [ ]
  set dipnet_multiplier 1
  set situation_assessed? false
  set tributarycolor 1 + random 256 ;;Non-significant color value for coloring of tributaries in code de-bugging.
  ;set tide amount-ocean ;;Set up the base lowtide.
  set-default-shape raindrops "circle"
  set-default-shape waters "circle"
  set-default-shape raindrops "circle"
  set water-height 0.5 ;;The "height" of raindrops. If the height of a raindrop and the patch it is on exceed the elevation of its neighbors, it will flow there.
  set border patches with [ count neighbors != 8 ] ;;Set up a border which kills turtles.
  set river-size ( round ( world-height / 8 ) )
  set IDnumber 1 ;;Prep ID number for assigning to schools.
  set Time 0 ;;Reset overall world clock.
  set spring#cycler 1 ;;Set to first value assigned to starting river patch.
  set escaped_sockeye 0 ;;reset the number of escaped sockeye.
  ;set date 07.01 ;;month, day.

  set regular_period? 1
  set regular_period_list [ 1 ]
  set time_scale 2.60 * 1000 * 100 * (1 / 2.54 ) * ( 1 / 12 ) * (1 / 5280) ;2.60 km/hr * 1000m/km * 100cm/m * 1in/2.54cm * 1ft/12in * 5280ft/mi --> Converts maximum speed of sockeye from km/hr to mi/hr
  set time_scale 1 / time_scale ;switch time_scale to hr/mi
  set time_scale time_scale * 0.0625 * 60 ;hr/mi * mi/patch * min/hr --> min/patch. time_scale is now in units of minutes per patch that a sockeye going at maximum speed would spend on one patch.

  primary-river ;;Generates primary river by randomly drawing a path from top of the world to the bottom.
  wedge ;;Sets up two "sides" of the world, a right and a left side divided by the river.
  make-flood-plains ;;Generates floodplains from the primary river node spots assigned for floodplain generation.

  ask patches [ set temp false ] ;;reset an overall temporary patch variable used in many procedures.

  set node#cycler max [ node# ] of patches + 1 ;;After setting up the primary river, get the node cycler prepped for assigning nodes to extra tributaries.
  slant2 ;;slopes the world steeply at the top of the map (max pycor) and gradually decreases in aggressiveness of the slope towards the bottom (min pycor).
  set temp-g 1 ;;temporary global variable reset.
  set-elevation2 ;;Raises up the world relative to how far away from the river a patch is. Greater the distance, greater the elevation.
  set river-size round ( world-height / 8 )
  ask patches with [ node# = 1 ] [ set elevation elevation * ((river-size * 3 ) / 100 ) ] ;;Reset later on. This is for allowing determination of width of tribs.
  add-tributaries ;;Draws in a tributary and erodes the land around it.
  ask patches with [river-patch# > 1]  [ set elevation elevation * 0.75 ] ;;After adding tributaries, lower the stream elevation a little bit more.
  sphere_depth ;;Adds in width to the tributaries. Not used for depth right now, as the name implies.
  ;;do one last digout that really lowers the river systems --> short fix for depth atm. Can remove this later and use spheres when more time available.
  set temp-g 2 ;;setting the value to 2 increases the amount of the digout in set-elevation2.
  set-elevation2 ;;The final digout.n
  let elevation-min min [elevation] of patches ;;Obtain both the minimum and maximum elevation of patches in the world.
  let elevation-max max [elevation] of patches
  ask patches
  [ set elevation (( elevation - elevation-min ) / ( elevation-max - elevation-min )) * 100 ] ;;Normalize between 0 and 100.

  add-ocean ;;Adds in ocean and widens out the main river.

  ask n-of (count patches / 2) patches with [ node# = 0 ] [ set elevation elevation - ( elevation * 0.02) ] ;;Randomly chooses patches and sightly alters their
  ;;elevation so that rain doesn't flow in a straight path towards rivers or the ocean. Keeping, but not necessary since rain not in model.

  set spring#cycler 1
  set shoreline patches with [ ocean? = false and river? = false and any? neighbors with [ ocean? = true or river? = true ]  ] ;;Creates an agentset of shoreline patches
  ask shoreline [ ask neighbors with [ river? = true ] [ set riverbank? true ] ]
  ask patches with [riverbank? = true] [ ask neighbors with [river? = true] [ set riverbank? true ] ]
  set riverbanks patches with [riverbank? = true]
  ask patches with [ pre_cross? = true and ( river? = true or ocean? = true ) ] [ set cross_zone? true ]

  ask patches with [ pcolor = blue and (river? = true or ocean? = true) and (distance min-one-of shoreline [distance myself]) <= 3  ] [ set sockeye_school_zone? true ] ;and pycor > distance-floodplain-top
  ;list_attractant_2 ;;A longer method of spreading attractant from each starting point of the tributaries.
  list_attract_test
  list_attractant_2
  remove-layers ;;Remove the various visualized layers that might have been used at this point for setup.
  generateFishingZone

  ;ask patches [ set sockeye_list attractant-list ]
  ;ask riverbanks [ set sockeye_list map [ 1 + ? ] sockeye_list ]
  ;GenerateStartingFish ;;Generates the first wave of incoming fish.

  set-default-shape deathspots "x"
  set-default-shape dipnetters "dipnetter"
  set-default-shape sportfishers "fishermen"
  test-depth ;;adds in depth accross the world.
  ask patches with [ floodplains? = true ] [set depth depth * (abs pycor * (1 / (abs (max [pycor] of patches with [ ocean? = true ])))) ]
  ask patches with [ ocean? = true and base_river? = false ] [set depth depth * (abs pycor * (1 / (abs (max [pycor] of patches with [ ocean? = true ]))))]
  ask patches with [ node# = 1 and ocean? = true ] [set depth depth * (abs pycor * (1 / (abs (max [pycor] of patches with [ ocean? = true ])))) ]
  repeat 2 [ ask patches with [ node# = 1 ] [ set depth depth * 0.90] ]
  let reg-dist (16 * 2 / 3) ;we have to change the distance from the shore of node#97 to match the new scale of 16 patches to 3 mi. Reg distance of closed fishing for drifters until set fishing opens is 2 mi.
  ask patches with [ node# = 98 and (distance min-one-of shoreline with [ count neighbors with [ sum sockeye_list > 0 ] > 0 ] [distance myself]) <= reg-dist ] [set node# 97]
  remove-layers
  let cor max [pycor] of patches with [ node? = true and pycor <= distance-floodplain-top ]
  ask patches with [ pcolor = blue and pycor = cor ] [ set riverMouth? true ]
  ask patches with [ pcolor = blue ]
  [
    ifelse pycor >= cor
    [ set river? true set ocean? false ]
    [ set ocean? true ]
  ]
  ask patches with [ pcolor = blue and (distance min-one-of shoreline with [ count neighbors with [ sum sockeye_list > 0 ] > 0 ] [distance myself]) <= 1 and (distance min-one-of (patches with [ riverMouth? = true ]) [distance myself]) <= ((16 / 3) * 4 ) and pycor >= cor  ] [set dipnet_zone? true]

  ask patches with [ pcolor = blue and (distance min-one-of shoreline with [ count neighbors with [ sum sockeye_list > 0 ] > 0 ] [distance myself]) <= 1 and (distance min-one-of (patches with [ riverMouth? = true ]) [distance myself]) <= ((16 / 3) * 1.875 ) and pycor < cor  ] [set dipnet_zone? true]

  generate_setnetters ;;Generates setnetters.
  generate_driftgillnetters
  set sum_set sum [ season_total ] of setnetters
  set sum_drag sum [ season_total ] of gillnetters
  ;generate_dipnetters ;;Generates dipnetters.

  remove-layers
  ;;


  determine_sockeye_run
  determine_chinook_run
  ;compress_sock_run
  ;compress_chin_run
  ask patches with [ pcolor = blue and (distance min-one-of shoreline with [ count neighbors with [ sum sockeye_list > 0 ] > 0 ] [distance myself]) > 3 and ocean? = true ] [ set deep_water_zone? true ]
  ;original deep_water_zone distance was 8 patches, not 3. Adjusting for the sake of trying to correct chinook schooling dynamics.
  ;set day 9 ;;advancing clock of the program so that less time is spent collected data for dipnetters. Remove after done collecting data.
  reset-ticks ;;Reset program clock.
  ;display

  sockeye-migration-changes
  chinook-migration-changes
  ;starting day of simulation is now Jun-17
  ;adjust dipnet start
  ;jumpstart sim based on chin-start and sock-start
  ;adjust drift and set starts.


  ;if sock-start >= 13 or chin-start >= 13
  ;[ set day 3 ] ;jumpstart simulation to Jun-19, first day of drift gillnet fishing.
  ;if chin and sock start = 0, run regular simulation procedures
  set day 15 ;day 15 corresponds to July 1, original start of the simulation
  if chin-start > 0 and chin-start > sock-start
  [ set day day - chin-start ]
  if sock-start > 0 and sock-start > chin-start
  [ set day day - sock-start ]

  ;if day <= 0 and sock-start > 14
  ;[ set early-sock 0
  ;  repeat abs sock-start - 14
  ;  [ set early-sock early-sock + item 0 calc_sockeye_run_list
  ;    set calc_sockeye_run_list but-first calc_sockeye_run_list ]
  ;   ]

  ;if day <= 0 and chin-start > 14
  ;[ set early-chin 0
  ;  repeat abs chin-start - 14
  ;  [ set early-chin early-chin + item 0 calc_chinook_run_list
  ;    set calc_chinook_run_list but-first calc_chinook_run_list ]
  ;  ]

  set day 1

  let rem day / 7
  set week ceiling rem

  set comm-day day + 2
  set comm-week ceiling (comm-day / 7)

  set day-counter (day mod 7) + 1
  set sim-day 1

  calc_sockeye_seed
  calc_chinook_seed
  assess_situation
  comm_depth_%_adj
  calc_dip_prob
  calc_set_prob
  calc_gill_prob
end

to test
  set calc_sockeye_run_list [ ]
  set calc_chinook_run_list [ ]

  determine_sockeye_run
  determine_chinook_run

  sockeye-migration-changes
  chinook-migration-changes
end

to sockeye-migration-changes
  ;first, set up a new migration dynamics list of seeded daily salmon using the DMT parameter.
  ;if dmt shift is negative, use linear compression function
  if sockeye-dmt-shift < 0
  [
    let x calc_sockeye_run_list
    let y [ ]
    let xfrac [ ]
    let l1 length x
    repeat l1 [ set xfrac lput 1 xfrac ]
    ;show xfrac
    let l2 l1 - abs (sockeye-dmt-shift)

    let r 0
    let r2 0
    let val 0
    let diff 0
    let frac l1 / l2

    repeat l2
    [
      set val 0
      let t 1
      set r frac
      while [ r > 0 and t < length xfrac + 1]
      [
        ifelse r < item (t - 1) xfrac
        [ set xfrac replace-item (t - 1) xfrac (item (t - 1) xfrac - r)
          set val val + (r * item (t - 1) x)
          set r 0 ]
        [ set r r - item (t - 1) xfrac
          set val val + (item (t - 1) xfrac * item (t - 1) x)
          set xfrac replace-item (t - 1) xfrac 0 ]

        ;show r
        ;show xfrac
        ;set r r - item (t - 1) xfrac
        ;if r < 0 [ set diff abs r ]

        ;set val item (t - 1) xfrac * item (t - 1) x
        set t t + 1

      ]
      set y lput val y
    ]

    let pad length calc_sockeye_run_list - l2

     ifelse pad mod 2 = 1
      [ let z1 floor (pad / 2)
        let z2 ceiling (pad / 2)
        ifelse 1 + random 10 > 5
        [ repeat z1 [ set y lput 0 y ]
          repeat z2 [ set y fput 0 y ] ]
        [ repeat z2 [ set y lput 0 y ]
          repeat z1 [ set y fput 0 y ] ] ]
      [ let z pad / 2
        repeat z
        [ set y lput 0 y
          set y fput 0 y ] ]

  show map round calc_sockeye_run_list
  set calc_sockeye_run_list y
  show map round calc_sockeye_run_list ]
  ;if dmt shift is positive, use linear expansion function
  if sockeye-dmt-shift > 0
  [
  let list1 calc_sockeye_run_list ;odd list for extension
  let factor (length list1) / (length list1 + sockeye-dmt-shift)
  let list2 [ ]
  let x 0
  let slope (item (x + 1) list1) - (item x list1 )
  let rem 0
  let adj 0
  repeat (length list1 + sockeye-dmt-shift)
  [
    if int x != (length list1 - 1)
    [ set slope (item (int x + 1) list1) - (item int x list1 ) ]
    if x mod 2 = 1 or x mod 2 = 0
    [ set list2 lput (item x list1) list2 ]
    if (x mod 2 > 0 and x mod 2 < 1) or (x mod 2 > 1 and x mod 2 < 2)
    [ set rem x mod 1
      set adj (rem * slope) + item (int x) list1
      set list2 lput adj list2 ]
    set x x + factor
  ]
  ;set list2 map [ [i] -> i * (sum list1 / sum list2) ] list2

  set list2 map [ ? * (sum list1 / sum list2) ] list2
  show list2
  show sum list2
  show map round calc_sockeye_run_list
  set calc_sockeye_run_list list2
  show map round calc_sockeye_run_list
  ]

  let list1 calc_sockeye_run_list
  if sockeye-mdmt-shift < 0
  [ repeat abs sockeye-mdmt-shift
    [ set list1 lput 0 list1 ] ]
  if sockeye-mdmt-shift > 0
  [ repeat sockeye-mdmt-shift
    [ set list1 fput 0 list1 ] ]
  ;show list1
  set calc_sockeye_run_list list1
  ;show map round calc_sockeye_run_list

  if sockeye-dmt-shift <= 0
  [ if sockeye-mdmt-shift >= 0 [ set sock-start 0 ]
    if sockeye-mdmt-shift < 0 [ set sock-start (abs sockeye-mdmt-shift) ] ]

  if sockeye-dmt-shift > 0
    [ ifelse (abs sockeye-dmt-shift) mod 2 = 0
      [ set sock-start sockeye-dmt-shift / 2 ] ;even dmt extension
      [ let flip random 101
        ifelse flip >= 49
        [ set sock-start floor (sockeye-dmt-shift / 2) ]
        [ set sock-start ceiling (sockeye-dmt-shift / 2) ] ] ;odd dmt extension
    if sockeye-mdmt-shift < 0 [ set sock-start sock-start + (abs sockeye-mdmt-shift) ] ]
  repeat 14 - sock-start
  [ set calc_sockeye_run_list fput 0 calc_sockeye_run_list ]



end

to chinook-migration-changes
  ;first, set up a new migration dynamics list of seeded daily salmon using the DMT parameter.
  ;if dmt shift is negative, use linear compression function
  if chinook-dmt-shift < 0
  [
    let x calc_chinook_run_list
    let y [ ]
    let xfrac [ ]
    let l1 length x
    repeat l1 [ set xfrac lput 1 xfrac ]
    ;show xfrac
    let l2 l1 - abs (chinook-dmt-shift)

    let r 0
    let r2 0
    let val 0
    let diff 0
    let frac l1 / l2

    repeat l2
    [
      set val 0
      let t 1
      set r frac
      while [ r > 0 and t < length xfrac + 1]
      [
        ifelse r < item (t - 1) xfrac
        [ set xfrac replace-item (t - 1) xfrac (item (t - 1) xfrac - r)
          set val val + (r * item (t - 1) x)
          set r 0 ]
        [ set r r - item (t - 1) xfrac
          set val val + (item (t - 1) xfrac * item (t - 1) x)
          set xfrac replace-item (t - 1) xfrac 0 ]

        ;show r
        ;show xfrac
        ;set r r - item (t - 1) xfrac
        ;if r < 0 [ set diff abs r ]

        ;set val item (t - 1) xfrac * item (t - 1) x
        set t t + 1

      ]
      set y lput val y
    ]

    let pad length calc_chinook_run_list - l2

     ifelse pad mod 2 = 1
      [ let z1 floor (pad / 2)
        let z2 ceiling (pad / 2)
        ifelse 1 + random 10 > 5
        [ repeat z1 [ set y lput 0 y ]
          repeat z2 [ set y fput 0 y ] ]
        [ repeat z2 [ set y lput 0 y ]
          repeat z1 [ set y fput 0 y ] ] ]
      [ let z pad / 2
        repeat z
        [ set y lput 0 y
          set y fput 0 y ] ]

  show map round calc_chinook_run_list
  set calc_chinook_run_list y
  show map round calc_chinook_run_list ]
  ;if dmt shift is positive, use linear expansion function
  if chinook-dmt-shift > 0
  [
  let list1 calc_chinook_run_list ;odd list for extension
  let factor (length list1) / (length list1 + chinook-dmt-shift)
  let list2 [ ]
  let x 0
  let slope (item (x + 1) list1) - (item x list1 )
  let rem 0
  let adj 0
  repeat (length list1 + chinook-dmt-shift)
  [
    if int x != (length list1 - 1)
    [ set slope (item (int x + 1) list1) - (item int x list1 ) ]
    if x mod 2 = 1 or x mod 2 = 0
    [ set list2 lput (item x list1) list2 ]
    if (x mod 2 > 0 and x mod 2 < 1) or (x mod 2 > 1 and x mod 2 < 2)
    [ set rem x mod 1
      set adj (rem * slope) + item (int x) list1
      set list2 lput adj list2 ]
    set x x + factor
  ]
  ;set list2 map [ [i] -> i * (sum list1 / sum list2) ] list2
  set list2 map [ ? * (sum list1 / sum list2) ] list2
  show list2
  show sum list2
  show map round calc_chinook_run_list
  set calc_chinook_run_list list2
  show map round calc_chinook_run_list
  ]

  let list1 calc_chinook_run_list
  if chinook-mdmt-shift < 0
  [ repeat abs chinook-mdmt-shift
    [ set list1 lput 0 list1 ] ]
  if chinook-mdmt-shift > 0
  [ repeat chinook-mdmt-shift
    [ set list1 fput 0 list1 ] ]
  ;show list1
  set calc_chinook_run_list list1
  ;show map round calc_chinook_run_list

  if chinook-dmt-shift <= 0
  [ if chinook-mdmt-shift >= 0 [ set chin-start 0 ]
    if chinook-mdmt-shift < 0 [ set chin-start (abs chinook-mdmt-shift) ] ]

  if chinook-dmt-shift > 0
    [ ifelse (abs chinook-dmt-shift) mod 2 = 0
      [ set chin-start chinook-dmt-shift / 2 ] ;even dmt extension
      [ let flip random 101
        ifelse flip >= 49
        [ set chin-start floor (chinook-dmt-shift / 2) ]
        [ set chin-start ceiling (chinook-dmt-shift / 2) ] ] ;odd dmt extension
    if chinook-mdmt-shift < 0 [ set chin-start chin-start + (abs chinook-mdmt-shift) ] ]

  repeat 14 - chin-start
  [ set calc_chinook_run_list fput 0 calc_chinook_run_list ]
end


to determine_emergency_orders

  ifelse automatic-emergency-orders? = true
  [
  ken_set_eo
  ken_set_ec

  kas_set_eo
  kas_set_ec

  drift_eo
  drift_ec


  let ran_int 1 + random 100
  ifelse ran_int > 50
    [ if drift_eo? = true and drift_ec? = true [ set drift_eo? false ] ]
    [ if drift_eo? = true and drift_ec? = true [ set drift_ec? false ] ]
  set ran_int 1 + random 100
  ifelse ran_int > 50
    [ if ken_eo? = true and ken_ec? = true [ set ken_ec? false ] ]
    [ if ken_eo? = true and ken_ec? = true [ set ken_eo? false ] ]
  set ran_int 1 + random 100
  ifelse ran_int > 50
    [ if kas_eo? = true and kas_ec? = true [ set kas_eo? false ] ]
    [ if kas_eo? = true and kas_ec? = true [ set kas_ec? false ] ]


  ifelse drift_ec? = true [ set drift_closed? true ] [ set drift_closed? false ]
  ifelse ken_ec? = true [ set ken_closed? true ] [ set ken_closed? false ]
  ifelse kas_ec? = true [ set kas_closed? true ] [ set kas_closed? false ]

  ifelse drift_eo? = true [ set drift_opened? true ] [ set drift_opened? false ]
  ifelse ken_eo? = true [ set ken_opened? true ] [ set ken_opened? false ]
  ifelse kas_eo? = true [ set kas_opened? true ] [ set kas_opened? false ]

  if drift_opened? = true and day-counter != 2 and day-counter != 5 [ print "Attn:" print "Drift Gillnet Section Emergency Opened." ]
  if drift_closed? = true and day-counter = 2 or day-counter = 5 [ print "Attn:" print "Drift Gillnet Section Emergency Closed." ]
  ;print word "drift_opened? = " drift_opened?
  ;print word "drift_closed? = " drift_closed?
  if ken_opened? = true and day-counter != 2 and day-counter != 5 [ print "Attn:" print "Kenai Set Gillnet Section Emergency Opened." ]
  if ken_closed? = true and day-counter = 2 or day-counter = 5 [ print "Attn:" print "Kenai Set Gillnet Section Emergency Closed." ]
  ;print word "ken_opened? = " ken_opened?
  ;print word "ken_closed? = " ken_closed?
  if kas_opened? = true and day-counter != 2 and day-counter != 5 [ print "Attn:" print "Kasilof Set Gillnet Section Emergency Opened." ]
  if kas_closed? = true and day-counter = 2 or day-counter = 5 [ print "Attn:" print "Kasilof Set Gillnet Section Emergency Closed." ]
  ]
  [
    set drift_opened? false
    set drift_closed? false
    set ken_opened? false
    set ken_closed? false
    set kas_opened? false
    set kas_closed? false
  ]

end


to ken_set_eo
  ;25  0.444  "p = step(0.625994493728939*b + delay(r, 1) + delay(w, 1) - 615203.679852651 - r - 1147357.54280778*q)"


  ifelse length drift_daily_harvest >= 3 and length set_daily_harvest >= 3;day >= 3
  [
    let q regular_period?
    let b escaped_sockeye + early-sock
    let dr item (sim-day - 3) drift_daily_harvest
    let dw item (sim-day - 3) set_daily_harvest
    let r item (sim-day - 2) drift_daily_harvest
    ifelse (0.625994493728939 * b + dr + dw - 615203.679852651 - r - 1147357.54280778 * q) > 0
    [ set ken_eo? true ] [ set ken_eo? false ]
  ]
  [
   ifelse length drift_daily_harvest >= 2;day >= 2
   [
     let q regular_period?
     let b escaped_sockeye + early-sock
     let dr 0
     let dw 0
     let r item (sim-day - 2) drift_daily_harvest
     ifelse (0.625994493728939 * b + dr + dw - 615203.679852651 - r - 1147357.54280778 * q) > 0
       [ set ken_eo? true ] [ set ken_eo? false ]
   ]
   [
     let q regular_period?
     let b escaped_sockeye
     let dr 0
     let dw 0
     let r 0
     ifelse (0.625994493728939 * b + dr + dw - 615203.679852651 - r - 1147357.54280778 * q) > 0
       [ set ken_eo? true ] [ set ken_eo? false ]
   ]
  ]

end

to ken_set_ec
;25  0.562  "o = logistic(1.9963179573317*q*delay(a, 3) + 0.871301954461207*g*u*q - delay(b, 4))"

  ifelse length sockeye_escapement_list >= 6
  [
    ifelse sum_drag = 0
    [
      let q regular_period?
      let db4 item (sim-day - 6) sockeye_escapement_list
      let da3 item (sim-day - 5) sockeye_sonar_list
      let g escaped_chinook + early-chin
      let u 0

      let x (1.9963179573317 * q * da3 + 0.871301954461207 * g * u * q - db4)
      ifelse round (1 / ( 1 + exp( - x ) )) = 1 ;;logistic function may need to be rounded. It squashes the function successfully in Eureqa but it's hard to say right now whether or not it will in NetLogo, too.
      [ set ken_ec? true ] [ set ken_ec? false ]
    ]
    [
      let q regular_period?
      let db4 item (sim-day - 6) sockeye_escapement_list
      let da3 item (sim-day - 5) sockeye_sonar_list
      let g escaped_chinook + early-chin
      let u ((item (sim-day - 2) drift_daily_harvest) / sum_drag) * 100

      let x (1.9963179573317 * q * da3 + 0.871301954461207 * g * u * q - db4)
      ifelse round (1 / ( 1 + exp( - x ) )) = 1 ;;logistic function may need to be rounded. It squashes the function successfully in Eureqa but it's hard to say right now whether or not it will in NetLogo, too.
      [ set ken_ec? true ] [ set ken_ec? false ]
    ]
  ]
  [
    ifelse length sockeye_sonar_list >= 5
    [
      ifelse sum_drag = 0
      [
        let q regular_period?
        let db4 0
        let da3 item (sim-day - 5) sockeye_sonar_list
        let g escaped_chinook + early-chin
        let u 0

        let x (1.9963179573317 * q * da3 + 0.871301954461207 * g * u * q - db4)
        ifelse round (1 / ( 1 + exp( - x ) )) = 1 ;;logistic function may need to be rounded. It squashes the function successfully in Eureqa but it's hard to say right now whether or not it will in NetLogo, too.
        [ set ken_ec? true ] [ set ken_ec? false ]
      ]
      [
        let q regular_period?
        let db4 0
        let da3 item (sim-day - 5) sockeye_sonar_list
        let g escaped_chinook + early-chin
        let u ((item (sim-day - 2) drift_daily_harvest) / sum_drag) * 100

        let x (1.9963179573317 * q * da3 + 0.871301954461207 * g * u * q - db4)
        ifelse round (1 / ( 1 + exp( - x ) )) = 1 ;;logistic function may need to be rounded. It squashes the function successfully in Eureqa but it's hard to say right now whether or not it will in NetLogo, too.
        [ set ken_ec? true ] [ set ken_ec? false ]
      ]
    ]
    [
      ifelse length drift_daily_harvest >= 2
      [
        ifelse sum_drag = 0
        [
          let q regular_period?
          let db4 0
          let da3 0
          let g escaped_chinook + early-chin
          let u 0

          let x (1.9963179573317 * q * da3 + 0.871301954461207 * g * u * q - db4)
          ifelse round (1 / ( 1 + exp( - x ) )) = 1 ;;logistic function may need to be rounded. It squashes the function successfully in Eureqa but it's hard to say right now whether or not it will in NetLogo, too.
          [ set ken_ec? true ] [ set ken_ec? false ]
        ]
        [
          let q regular_period?
          let db4 0
          let da3 0
          let g escaped_chinook + early-chin
          let u ((item (sim-day - 2) drift_daily_harvest) / sum_drag) * 100

          let x (1.9963179573317 * q * da3 + 0.871301954461207 * g * u * q - db4)
          ifelse round (1 / ( 1 + exp( - x ) )) = 1 ;;logistic function may need to be rounded. It squashes the function successfully in Eureqa but it's hard to say right now whether or not it will in NetLogo, too.
          [ set ken_ec? true ] [ set ken_ec? false ]
        ]
      ]
      [
        let q regular_period?
        let db4 0
        let da3 0
        let g escaped_chinook + early-chin
        let u 0

        let x (1.9963179573317 * q * da3 + 0.871301954461207 * g * u * q - db4)
        ifelse round (1 / ( 1 + exp( - x ) )) = 1 ;;logistic function may need to be rounded. It squashes the function successfully in Eureqa but it's hard to say right now whether or not it will in NetLogo, too.
        [ set ken_ec? true ] [ set ken_ec? false ]
      ]
    ]
  ]



  ;if day < 4
  ;[
  ;  let sock_sd_%_comp [ 0.440159987  0.471889068  0.566902933  0.73975866  1.165860068  1.711827861  2.532432912  3.132394146  3.647055325  4.722328335  5.780511035  7.392955025  9.077934337  10.49233678  11.91770725  13.75783078  14.75441699  15.95503611  17.40605877  19.53222286  20.64358166  20.14357372  19.34416706  18.23994963  17.33081809  16.61549462  16.28678223  15.79800077  15.30126103  14.82891252  14.14300505  12.99925862  12.44055013  11.88617754  11.47763216  10.82408068  10.32254024  9.918794803  9.604630996  9.345316822  9.217914828  8.966852574  8.447574652  8.144871797  8.262211187  8.068697658 ]
  ;  let q regular_period?
  ;  let dl 0
  ;  let w (item (day - 1) set_daily_harvest)
  ;  let df 0

    ;Side note about this equation Eureqa cooked up: due to q being 1 or 0, this equation essentially results in the kenai set gillnet section being defacto closed for the first 4
    ;days of the season until we have king sonar data when day 4 rolls around.
  ;  ifelse round (q /(1 + (dl ^ (w - 8.75083614967099 * df))) ) = 1
  ;  [ set ken_ec? true ] [ set ken_ec? false ]
  ;]
  ;if day = 4
  ;[
  ;  let sock_sd_%_comp [ 0.440159987  0.471889068  0.566902933  0.73975866  1.165860068  1.711827861  2.532432912  3.132394146  3.647055325  4.722328335  5.780511035  7.392955025  9.077934337  10.49233678  11.91770725  13.75783078  14.75441699  15.95503611  17.40605877  19.53222286  20.64358166  20.14357372  19.34416706  18.23994963  17.33081809  16.61549462  16.28678223  15.79800077  15.30126103  14.82891252  14.14300505  12.99925862  12.44055013  11.88617754  11.47763216  10.82408068  10.32254024  9.918794803  9.604630996  9.345316822  9.217914828  8.966852574  8.447574652  8.144871797  8.262211187  8.068697658 ]
  ;  let q regular_period?
  ;  let dl item ( day - 4 ) sock_sd_%_comp
  ;  let w (item (day - 1) set_daily_harvest)
  ;  let df 0

    ;Side note about this equation Eureqa cooked up: due to q being 1 or 0, this equation essentially results in the kenai set gillnet section being defacto closed for the first 4
    ;days of the season until we have king sonar data when day 4 rolls around.
  ;  ifelse round (q /(1 + (dl ^ (w - 8.75083614967099 * df))) ) = 1
  ;  [ set ken_ec? true ] [ set ken_ec? false ]
  ;]
  ;if day >= 5
  ;[
  ;  let sock_sd_%_comp [ 0.440159987  0.471889068  0.566902933  0.73975866  1.165860068  1.711827861  2.532432912  3.132394146  3.647055325  4.722328335  5.780511035  7.392955025  9.077934337  10.49233678  11.91770725  13.75783078  14.75441699  15.95503611  17.40605877  19.53222286  20.64358166  20.14357372  19.34416706  18.23994963  17.33081809  16.61549462  16.28678223  15.79800077  15.30126103  14.82891252  14.14300505  12.99925862  12.44055013  11.88617754  11.47763216  10.82408068  10.32254024  9.918794803  9.604630996  9.345316822  9.217914828  8.966852574  8.447574652  8.144871797  8.262211187  8.068697658 ]
  ;  let q regular_period?
  ;  let dl item ( day - 4 ) sock_sd_%_comp
  ;  let w (item (day - 1) set_daily_harvest)
  ;  let df item ( day - 5 ) king_sonar_list;

    ;Side note about this equation Eureqa cooked up: due to q being 1 or 0, this equation essentially results in the kenai set gillnet section being defacto closed for the first 4
    ;days of the season until we have king sonar data when day 4 rolls around.
    ;ifelse round (q /(1 + (dl ^ (w - 8.75083614967099 * df))) ) = 1
    ;[ set ken_ec? true ] [ set ken_ec? false ]
  ;]

end

to kas_set_eo

 ; 42  0.379  "o = step(delay(q, 2) - q - cos(x + delay(x, 1)))"

  ifelse length regular_period_list >= 4
  [
    ifelse sum_set = 0
    [
      let q regular_period?
      let dq2 item (sim-day - 4) regular_period_list
      let x 0
      let dx1 0
      ifelse (dq2 - q - cos(x + dx1)) > 0
      [ set kas_eo? true ] [ set kas_eo? false ]
    ]
    [
      let q regular_period?
      let dq2 item (sim-day - 4) regular_period_list
      let x ((item (sim-day - 2) set_daily_harvest) / sum_set) * 100
      let dx1 ((item (sim-day - 3) set_daily_harvest) / sum_set) * 100
      ifelse (dq2 - q - cos(x + dx1)) > 0
      [ set kas_eo? true ] [ set kas_eo? false ]
    ]
  ]
  [
   ifelse length set_daily_harvest >= 3
   [
     ifelse sum_set = 0
     [
       let q regular_period?
       let dq2 0
       let x 0
       let dx1 0
       ifelse (dq2 - q - cos(x + dx1)) > 0
       [ set kas_eo? true ] [ set kas_eo? false ]
     ]
     [
       let q regular_period?
       let dq2 0
       let x ((item (sim-day - 2) set_daily_harvest) / sum_set) * 100
       let dx1 ((item (sim-day - 3) set_daily_harvest) / sum_set) * 100
       ifelse (dq2 - q - cos(x + dx1)) > 0
       [ set kas_eo? true ] [ set kas_eo? false ]
     ]
   ]
   [
    ifelse length set_daily_harvest >= 2
    [
      ifelse sum_set = 0
      [
        let q regular_period?
        let dq2 0
        let x 0
        let dx1 0
        ifelse (dq2 - q - cos(x + dx1)) > 0
        [ set kas_eo? true ] [ set kas_eo? false ]
      ]
      [
        let q regular_period?
        let dq2 0
        let x ((item (sim-day - 2) set_daily_harvest) / sum_set) * 100
        let dx1 0
        ifelse (dq2 - q - cos(x + dx1)) > 0
        [ set kas_eo? true ] [ set kas_eo? false ]
      ]
    ]
    [
      let q regular_period?
      let dq2 0
      let x 0
      let dx1 0
      ifelse (dq2 - q - cos(x + dx1)) > 0
      [ set kas_eo? true ] [ set kas_eo? false ]
    ]
   ]
  ]
  ;let q regular_period?
  ;let w (item (day - 1) set_daily_harvest)
  ;ifelse (w - q * w) > 0
  ;[ set kas_eo? true ] [ set kas_eo? false ]

end

to kas_set_ec

 ; 15  0.538  "p = step(2.76623521718575 + 2.76623521718575*u*q - n - w)"


  ifelse length drift_daily_harvest >= 2 and length set_daily_harvest >= 2 and day <= 56
  [
    ifelse sum_drag = 0
    [
      let king_sd_list [ 0.6377584  1.3179711  2.4294995  3.1912883  4.1259594  4.6457231  5.1962814  5.7890463  6.5962584  7.2731454  8.5759955  10.1736191  11.4102685  12.3215495  12.9923595  13.547353  14.0603951  13.7490476  13.2022894  12.4433657  11.6633013  11.5126654  11.1285722  10.7411279  10.3141663  10.1462714  9.7784708  8.9144934  8.0517905  7.2838095  6.9516543  6.3596655  5.9195294  5.6135273  4.7134158  3.5863034  3.0181102  2.7648519  2.1909423  1.7049059  1.3015178  1.842018 ]
      repeat 14 [ set king_sd_list fput 0 king_sd_list ]
      let q regular_period?
      let u 0
      let w item (sim-day - 2) set_daily_harvest
      ;if day > 44, n goes to 0 since the king sd list is only 42 members long.
      let n item (day - 1) king_sd_list
      ifelse (2.76623521718575 + 2.76623521718575 * u * q - n - w) > 0
      [ set kas_ec? true ] [ set kas_ec? false ]
    ]
    [
      let king_sd_list [ 0.6377584  1.3179711  2.4294995  3.1912883  4.1259594  4.6457231  5.1962814  5.7890463  6.5962584  7.2731454  8.5759955  10.1736191  11.4102685  12.3215495  12.9923595  13.547353  14.0603951  13.7490476  13.2022894  12.4433657  11.6633013  11.5126654  11.1285722  10.7411279  10.3141663  10.1462714  9.7784708  8.9144934  8.0517905  7.2838095  6.9516543  6.3596655  5.9195294  5.6135273  4.7134158  3.5863034  3.0181102  2.7648519  2.1909423  1.7049059  1.3015178  1.842018 ]
      repeat 14 [ set king_sd_list fput 0 king_sd_list ]
      let q regular_period?
      let u ((item (sim-day - 2) drift_daily_harvest) / sum_drag) * 100
      let w item (sim-day - 2) set_daily_harvest
      ;if day > 44, n goes to 0 since the king sd list is only 42 members long.
      let n item (day - 1) king_sd_list
      ifelse (2.76623521718575 + 2.76623521718575 * u * q - n - w) > 0
      [ set kas_ec? true ] [ set kas_ec? false ]
    ]
  ]
  [
   if day < 16
   [
     let king_sd_list [ 0.6377584  1.3179711  2.4294995  3.1912883  4.1259594  4.6457231  5.1962814  5.7890463  6.5962584  7.2731454  8.5759955  10.1736191  11.4102685  12.3215495  12.9923595  13.547353  14.0603951  13.7490476  13.2022894  12.4433657  11.6633013  11.5126654  11.1285722  10.7411279  10.3141663  10.1462714  9.7784708  8.9144934  8.0517905  7.2838095  6.9516543  6.3596655  5.9195294  5.6135273  4.7134158  3.5863034  3.0181102  2.7648519  2.1909423  1.7049059  1.3015178  1.842018 ]
     repeat 14 [ set king_sd_list fput 0 king_sd_list ]
     let q regular_period?
     let u 0
     let w 0
     ;if day > 44, n goes to 0 since the king sd list is only 42 members long.
     let n item (day - 1) king_sd_list
     ifelse (2.76623521718575 + 2.76623521718575 * u * q - n - w) > 0
     [ set kas_ec? true ] [ set kas_ec? false ]
   ]
   if day > 56
   [
     ifelse sum_drag = 0
     [
       let q regular_period?
       let u 0
       let w item (sim-day - 2) set_daily_harvest
       ;if day > 44, n goes to 0 since the king sd list is only 42 members long.
       let n 0
       ifelse (2.76623521718575 + 2.76623521718575 * u * q - n - w) > 0
       [ set kas_ec? true ] [ set kas_ec? false ]
     ]
     [
       let q regular_period?
       let u ((item (sim-day - 2) drift_daily_harvest) / sum_drag) * 100
       let w item (sim-day - 2) set_daily_harvest
       ;if day > 44, n goes to 0 since the king sd list is only 42 members long.
       let n 0
       ifelse (2.76623521718575 + 2.76623521718575 * u * q - n - w) > 0
       [ set kas_ec? true ] [ set kas_ec? false ]
     ]
   ]
  ]

  ;ifelse day >= 5
  ;[ let q regular_period?
  ;  let f item day king_sonar_list
  ;  let w (item (day - 1) set_daily_harvest)
  ;  let du item (day - 5) drift_har_%_tot

  ;  ifelse (q + f * q * du - 2.1 * w) > 0
  ;  [ set kas_ec? true ] [ set kas_eo? false ] ]
  ;[ let q regular_period?
  ;  let f item day king_sonar_list
  ;  let w (item (day - 1) set_daily_harvest)
  ;  let du 0

  ;  ifelse (q + f * q * du - 2.1 * w) > 0
  ;  [ set kas_ec? true ] [ set kas_eo? false ] ]

end

to drift_eo
  ;18  0.410  "q = step(8.09287560832276e-24*c^2*delay(o, 1) - 1.92300004886289e-11 - i)"

  let drift_eo_adj 0 ;(1.46698186 - 1)
  ifelse length set_daily_harvest >= 3
  [
    ifelse sum_set = 0
    [
      let i regular_period?
      let c escaped_sockeye + early-sock
      let do 0
      ifelse (8.09287560832276e-24 * ( c ^ 2 ) * do - 1.92300004886289e-11 - i + drift_eo_adj) > 0;* drift_eo_adj > 0
      [ set drift_eo? true ] [ set drift_eo? false ]
    ]
    [
      let i regular_period?
      let c escaped_sockeye + early-sock
      let do ((item (sim-day - 3) set_daily_harvest) / sum_set) * 100
      ifelse (8.09287560832276e-24 * ( c ^ 2 ) * do - 1.92300004886289e-11 - i + drift_eo_adj) > 0;* drift_eo_adj > 0
      [ set drift_eo? true ] [ set drift_eo? false ]
    ]
  ]

  [
    let i regular_period?
    ;let c item ( day - 2 ) sonar_list
    ;let o 0
    ifelse (- 1.92300004886289e-11 - i + drift_eo_adj) > 0 ;* drift_eo_adj > 0
    [ set drift_eo? true ] [ set drift_eo? false ]
  ]

  ;ifelse day >= 3
  ;[ let i regular_period?
  ;  let m sum_set
  ;  let j (item (day - 1) drift_daily_harvest)
  ;  let n (item (day - 1) set_daily_harvest)
  ;  let dn (item (day - 3) set_daily_harvest)
  ;  ifelse ((i * m + j * n + dn * sin(3.49358849635614 * j)) - i) > 0
  ;  [ set drift_eo? true ] [ set drift_eo? false ] ]
  ;[ let i regular_period?
  ;  let m sum_set
  ;  let j (item (day - 1) drift_daily_harvest)
  ;  let n (item (day - 1) set_daily_harvest)
  ;  let dn 0
  ;  ifelse ((i * m + j * n + dn * sin(3.49358849635614 * j)) - i) > 0
  ;  [ set drift_eo? true ] [ set drift_eo? false ] ]
end

to drift_ec

 ; 46  0.400  "p = step(sin(0.54030230586814*i*delay(o, 5)*delay(o, 7)) - n)"



;  let i regular_period?
;  let n (item (day - 2) set_daily_harvest)
;  let do5 ((item (day - 7) set_daily_harvest) / sum_set) * 100
;  let do7 ((item (day - 9) set_daily_harvest) / sum_set) * 100

  ifelse length set_daily_harvest >= 9
  [
    ifelse sum_set = 0
    [
      let i regular_period?
      let n (item (sim-day - 2) set_daily_harvest)
      let do5 0
      let do7 0
      ifelse (sin(0.54030230586814 * i * do5 * do7 ) - n) > 0
      [ set drift_ec? true ] [ set drift_ec? false ]
    ]
    [
      let i regular_period?
      let n (item (sim-day - 2) set_daily_harvest)
      let do5 ((item (sim-day - 7) set_daily_harvest) / sum_set) * 100
      let do7 ((item (sim-day - 9) set_daily_harvest) / sum_set) * 100
      ifelse (sin(0.54030230586814 * i * do5 * do7 ) - n) > 0
      [ set drift_ec? true ] [ set drift_ec? false ]
    ]
  ]
  [
   ifelse length set_daily_harvest >= 7
   [
     ifelse sum_set = 0
     [
       let i regular_period?
       let n (item (sim-day - 2) set_daily_harvest)
       let do5 0
       let do7 0
       ifelse (sin(0.54030230586814 * i * do5 * do7 ) - n) > 0
       [ set drift_ec? true ] [ set drift_ec? false ]
     ]
     [
       let i regular_period?
       let n (item (sim-day - 2) set_daily_harvest)
       let do5 ((item (sim-day - 7) set_daily_harvest) / sum_set) * 100
       let do7 0
       ifelse (sin(0.54030230586814 * i * do5 * do7 ) - n) > 0
       [ set drift_ec? true ] [ set drift_ec? false ]
     ]
   ]
   [
     ifelse length set_daily_harvest >= 2
     [
       let i regular_period?
       let n (item (sim-day - 2) set_daily_harvest)
       let do5 0
       let do7 0
       ifelse (sin(0.54030230586814 * i * do5 * do7 ) - n) > 0
       [ set drift_ec? true ] [ set drift_ec? false ]
     ]

     [
       let i regular_period?
       let n 0
       let do5 0
       let do7 0
       ifelse (sin(0.54030230586814 * i * do5 * do7 ) - n) > 0
       [ set drift_ec? true ] [ set drift_ec? false ]
     ]
   ]
  ]

 ; if day < 3
 ; [
 ;    let i regular_period?
 ;    let n (item (day - 1) set_daily_harvest)
 ;    let o ((item (day - 1) set_daily_harvest) / sum_set) * 100
 ;    let d_7_o 0
 ;    let d_2_o 0
 ;    ifelse (i * d_7_o - n - 2 * d_2_o) > 0
 ;    [ set drift_ec? true ] [ set drift_ec? false ]
 ; ]
 ; if day >= 3 and day < 8
 ; [
 ;   let i regular_period?
 ;   let n (item (day - 1) set_daily_harvest)
 ;   let o ((item (day - 1) set_daily_harvest) / sum_set) * 100
 ;   let d_7_o 0
 ;   let d_2_o ((item (day - 3) set_daily_harvest) / sum_set) * 100
 ;   ifelse (i * d_7_o - n - 2 * d_2_o) > 0
 ;   [ set drift_ec? true ] [ set drift_ec? false ]
 ; ]
 ; if day >= 8
 ; [;

 ; ]
 ; let i regular_period?
 ; let n (item (day - 1) set_daily_harvest)
 ; let o ((item (day - 1) set_daily_harvest) / sum_set) * 100
 ; let d_7_o ((item (day - 8) set_daily_harvest) / sum_set) * 100
 ; let d_2_o ((item (day - 3) set_daily_harvest) / sum_set) * 100
 ; ifelse (i * d_7_o - n - 2 * d_2_o) > 0
 ; [ set drift_ec? true ] [ set drift_ec? false ]
  ;p = step(i*delay(o, 7) - n - 2*delay(o, 2))

end

to list_attract_test
  ;;Create a list of n length (n = highest spring number) and assign starting attractants to starting tributary patches.
  ask patches [ set ocean-head 0 ]
  repeat max [ spring# ] of patches
  [ ask patches [ set sockeye_list lput 0 sockeye_list ] ]
  ask patches with [ spring# >= 1 ] ; spring#cycler ]
  [ let other-targets other patches with [ river-patch# = [river-patch#] of myself ]
    set sockeye_list replace-item ([spring#] of self) sockeye_list 100 ]
  ask patches with [ spring# >= 1 ]
  [ let x ([spring#] of self )
    set ocean-head x ]
  ;ask patches with [ spring
  ; diffuse-from-head
    ;;Spread attractant fully from each tributary throughout the entire world. An alternative option to the "test" procedure.
  let max# max [spring#] of patches
  let cycler 1
  while [ sum [ count neighbors with [ item max# sockeye_list > 0 and sockeye_school_zone? = true ] ] of patches with [ sockeye_school_zone? = true and item max# sockeye_list = 0 ] != 0 ]
  [ ask patches with [ item cycler sockeye_list > 0 ]
    [ ask n-of 2 neighbors;
      [ if item cycler sockeye_list = 0 and ( sockeye_school_zone? = true or cross_zone? = true )
        [  set sockeye_list replace-item cycler sockeye_list ( ([item cycler sockeye_list] of myself) * 0.33) set pcolor (cycler) ] ]]

  if sum [ count neighbors with [ item cycler sockeye_list > 0 and sockeye_school_zone? = true ] ] of patches with [ sockeye_school_zone? = true and item cycler sockeye_list = 0 ] = 0
  [ set cycler cycler + 1 ]]
end

to test-depth
  ;;Assign a value to ocean-ceiling based off of the elevation of the primary river. This value minus the elevation gives us the depth of a patch.
  let ocean-ceiling max [ elevation ] of patches with [ any? neighbors with [ node# = 1 ] = true ] + (log (max-pycor ^ 5) 10)
  ask patches with [ elevation <= ocean-ceiling and pcolor = blue] [ set depth ocean-ceiling - elevation ]
  ask patches [ set gage-height (elevation + depth) ]
  ask patches with [ river? = true and depth = 0 ]
  [ let x min [depth] of neighbors with [ river? = true and depth > 0 ]
    set depth x ]
end

to generateFishingZone
  let cor max [pycor] of patches with [ node? = true and pycor <= distance-floodplain-top ]
  ask patches with [ pycor = cor and node? = true ] [ set pcolor red ]
  ask patches with [pcolor = red] [sprout 1 [ set heading 180 fd 16 set stream# 100 set pcolor orange die ] ]
  ask patches with [pcolor = orange] [sprout 1 [ set heading 60 set stream# 100 ] ]
  ask patches with [pcolor = orange] [sprout 1 [ set heading (360 - 60) set stream# 100 ] ]
  while [ any? turtles with [ stream# = 100 ] ]
  [
    ask turtles with [ stream# = 100 ]
    [
      ask patch-here [set node# 99]
      fd 1
      ask patch-here [set node# 99]
    ]
    ask border [ ask turtles-here [die] ]
  ]

  ask patches with [ node# = 99 ] [ sprout 1 [set stream# 100]]
  while [ any? turtles with [ stream# = 100 ] ]
  [
    ask turtles with [stream# = 100]
    [
      set heading 180
      fd 1
      ask patch-here
      [ if pcolor = blue [ set node# 98 ] ]
      if [pycor] of patch-here = min-pycor [die]
    ]
  ]
end

to remove-layers
  ;;Set elevation scale color brown if no water here.
  ask patches with [ node# = 0 and ocean? = false ] [ set pcolor scale-color brown elevation 0 100 ]
  ;;If water here, set color blue.
  ask patches with [ river? = true ] [ set pcolor blue ]
  ask patches with [ ocean? = true ] [ set pcolor blue ]
end

to add-tributaries
  ;;Adds in tributaries according the slider "number-tributaries"
  set spring#cycler max [ spring# ] of patches + 1 ;;Prep for assigning IDs to starting patches of tributaries.
  set node#cycler 2 ;max [ node# ] of patches + 1 ;;sets node# of new tributaries to 2 so they can be easily differentiated from main stream.
  let node1 patches with [ node# = 1 ] ;;used for finding the distance from the primary river.
  let nodeself other patches with [ node# = node#cycler ] ;;For finding distance of other tributaries aside from the main tributary.
  let spawning-patches patches with [ land# = 1 and river? = false and pycor > (max-pycor / 4) and count neighbors = 8
    and distance (min-one-of (node1) [ distance myself ]) > (world-height / 5)] ;;Allow tributaries to be placed a miniumum distance away from the main river.

  set temp-g 1 ;;reset the global temp variable
  repeat 1
  [ set river# max [ river-patch# ] of patches + 1 ;;For assigning unique river IDs to each tributary.
    repeat number-tributaries ;;Create as many tributaries as called for in the GUI.
    [ ask patches [set temp2 false set temp elevation] ;;Not used right now, but can be used for resetting elevation in other procedures.
      ask one-of spawning-patches
      ;;Find a patch a minimum distance away from the main tributary and other existing secondary tributaries for spawning another secondary tributary.
        [ ifelse any? nodeself
          [ if not any? neighbors with [ ocean? = true or river? = true ] and (distance ( min-one-of (nodeself) [distance myself ] ) > (world-height / 8 ))
            [ set pcolor blue
              set river? true
              set node# node#cycler
              set stream-attractant 100 * node#cycler
              set river-patch# spring#cycler
              set spring# spring#cycler
              set base_river? true
              set ocean-attractant 100
              sprout-raindrops 1
              [ set color red
                set size 1
                set river-turtle# spring#cycler
                set node-attractant node#cycler
                flow-towards-2º ]
                sprout-depth_adders 1
                set spring#cycler spring#cycler + 1 ]  ]
          [ if not any? neighbors with [ ocean? = true or river? = true ]
            [ set pcolor blue
              set river? true
              set node# node#cycler
              set stream-attractant 100 * node#cycler
              set river-patch# spring#cycler
              set spring# spring#cycler
              set base_river? true
              set ocean-attractant 100
              sprout-raindrops 1
              [ set color red
                set size 1
                set river-turtle# spring#cycler
                set node-attractant node#cycler
                flow-towards-2º ]
              sprout-depth_adders 1
              set spring#cycler spring#cycler + 1 ] ] ]
      let elevationbase patches with [ river-patch# = (spring#cycler - 1) and base_river? = true ]
      ask patches [ set land# 1 ]
      set-elevation2 ;;Errode out the riverbed for the newly placed river and all the previous tributaries as well.
      if max [river-patch#] of patches = number-tributaries [ stop ] ]
    set node#cycler node#cycler + 1
    set spawning-patches patches with [ land# = 1 and river? = false and pycor > distance-floodplain-top and count neighbors = 8
      and distance (min-one-of (node1) [ distance myself ]) > (world-height / 8)] ;;reset allowable patches where tributaries can be created.
    if not any? patches with [ land# = 1 ] [ stop ] ]
end

to list_attractant_2
  ;;Create a list of n length (n = highest spring number) and assign starting attractants to starting tributary patches.
  ask patches [ set ocean-head 0 ]
  repeat max [ spring# ] of patches
  [ ask patches [ set chinook_list lput 0 chinook_list ] ]
  ask patches with [ spring# >= 1 ] ; spring#cycler ]
  [ let other-targets other patches with [ river-patch# = [river-patch#] of myself ]
    set chinook_list replace-item ([spring#] of self) chinook_list 100 ]
  ask patches with [ spring# >= 1 ]
  [ let x ([spring#] of self )
    set ocean-head x ]
  ;ask patches with [ spring
  ; diffuse-from-head
  ;;Spread attractant fully from each tributary throughout the entire world. An alternative option to the "test" procedure.
  let max# max [spring#] of patches
  let cycler 1
  while [ any? patches with [ ( ocean? = true or river? = true ) and item max# chinook_list = 0 ] ]
  [ ask patches with [ item cycler chinook_list > 0 ]
    [ ask n-of 2 neighbors;
      [ if item cycler chinook_list = 0 and ( ocean? = true or river? = true )
        [  set chinook_list replace-item cycler chinook_list ( ([item cycler chinook_list] of myself) * 0.33) set pcolor (cycler) ] ]]
  if not any? patches with [ ( ocean? = true or river? = true ) and item cycler chinook_list = 0 ]
  [set cycler cycler + 1 ]]
end

to primary-river
  ;;Spawns turtle on top of the world that deals with drawing the primary river.
  ask n-of 1 patches with [ pycor = max-pycor and pxcor >= ( - world-height / 8 ) and pxcor <= ( world-height / 8 ) ]
  [ set river? true ;;Assign all the variables that the river patches are supposed to hold.
    set node? true
    set node# 1
    set river-patch# 1
    set pcolor blue
    set ocean-attractant 100
    set spring# spring#cycler
    set base_river? true
    set attractant-list lput ocean-attractant attractant-list
    sprout-raindrops 1
    [ set color yellow
      set river-turtle# 1
      set node-attractant 1 ] ]
  set spring#cycler spring#cycler + 1

  ;;Instructions for random movement towards bottom of the map.
  make-primary-river
  ;ask patches with [ node# = 1 ] [ set order 1 ] ;;order not used at the moment, inconsequential code.
end

to make-primary-river
  ;;Alternation b/w moving downhill and randomly moving right or left.
  ;;Downhill portion
  ask turtles
   [ loop
    [ ask raindrops with [ river-turtle# = 1 ]
      [ downhill4 pycor
        ask patch-here
        [ if river? = false
          [ set river? true
            set pcolor blue
            set node# 1
            set river-patch# 1
            set base_river? true ]
          if (pycor <= (min-pycor + round ( world-height * (3 / 4 ) ))) [ set amount-waviness 4 ]
          if (pycor <= (min-pycor + round ( world-height * (2 / 4 ) ) ))[ set amount-waviness 5 ] ]
        ifelse tributary-counter = floodplain-intervals
        [ set tributary-counter 0
          ask patch-here
          [ if ( node# = 1 ) [ set node? true ] ] ]
        [ set tributary-counter tributary-counter + 1 ] ]

      ;;random portion
      ask raindrops with [ river-turtle# = 1 ]
      [  ;;Drawing of river limited by distance from center line.
        let distance-mid-line distance ( min-one-of ( patches with [ pxcor = 0 ] ) [distance myself] )
        let max-distance-mid main-river-width
        ifelse distance-mid-line < max-distance-mid
        [ let direction random 2
          repeat 1 + random amount-waviness
          [ if direction = 0 ;else direction > 0
            [ set heading 90
              fd 1
              ask patch-here
              [ set river? true
                set pcolor blue
                set node# 1
                set river-patch# 1
                set base_river? true ]
              ifelse tributary-counter = floodplain-intervals
              [ set tributary-counter 0
                ask patch-here [ if ( node# = 1 ) [ set node? true ] ] ]
              [ set tributary-counter tributary-counter + 1 ] ]
            if direction = 1
            [ set heading 270
              fd 1
              ask patch-here
              [ set node# 1
                set river-patch# 1
                set river? true
                set pcolor blue
                set base_river? true ]
              ifelse tributary-counter = floodplain-intervals
              [ set tributary-counter 0
                ask patch-here [ if ( node# = 1 ) [ set node? true ] ] ]
              [ set tributary-counter tributary-counter + 1 ] ]] ]
        [ repeat 1 + random amount-waviness

          [ set heading towards ( min-one-of ( patches with [ pxcor = 0 ] ) [distance myself] )
            fd 1
            ask patch-here
            [ set river? true
              set pcolor blue
              set node# 1
              set base_river? true ] ]] ]

      if [river?] of one-of patches with [ pycor = min-pycor ] = true
      [ ask raindrops
        [ die ]
        stop ] ]]
end

to make-flood-plains
  ask patches with [ node# = 1 and node? = true and river? = true and pycor <= distance-floodplain-top and pycor >= (  distance-floodplain-bottom ) ]
  [ sprout-raindrops number-floodplains
    [ set color yellow
      set river-turtle# 1
      set node-attractant 1 ] ]

  draw-floodplains

  ask n-of 5 patches with [ floodplains? = true ]
  [ sprout-raindrops 1
    [ set color yellow
      set river-turtle# 1
      set node-attractant 1 ] ]

  draw-floodplains
end

to draw-floodplains
  loop
  [ extend-river-random
    extend-river-downhill
    ask raindrops
    [ if ycor = min-pycor [ die ] ]
    if any? raindrops = false [ stop ] ]
end

to extend-river-random
  ;;Similar to the downhill function, except that the turtle has a 50-50 chance of going right or left.
  ask raindrops with [ river-turtle# = 1 ]
  [ let direction random 2
    repeat random ( ceiling amount-waviness * 3.0 )
    [ if direction = 0
      [ set heading 90
        fd 1
        ask patch-here
        [ if river? = false
          [ set river? true
            set pcolor blue
            set node# 100
            set river-patch# 1
            set floodplains? true
            set base_river? true ] ] ]
      if direction = 1
      [ set heading 270
        fd 1
        ask patch-here
        [ if river? = false
          [ set river? true
            set pcolor blue
            set node# 100
            set river-patch# 1
            set floodplains? true
            set base_river? true ] ]] ]]
end

to extend-river-downhill
  ;;Simply asks the turtle responsible for drawing the main river to go downhill and change the patch it draws on to a river.
  ask raindrops with [ river-turtle# = 1 ]
  [ let current-elevation ([ elevation ] of patch-here)
    downhill4 pycor
    ask patch-here
    [ if river? = false
      [ set river? true
        set pcolor blue
        set node# 100
        set river-patch# 1
        set floodplains? true
        set elevation current-elevation * 0.1
        set base_river? true ] ]]
end

to set-elevation2
  let elevBase patches with [ node# >= 1]
  ;;Sets elevation based off of distance from the primary river.
  ask patches with [ node# = 0 ]
  [ set elevation elevation + ( (( distance ( min-one-of ( elevBase ) [distance myself] ) )) * temp-g ) ]
end

to slant2
  let x max-pycor
  let y 4
  loop
  [ ask patches with [ pycor = x ]
    [ set elevation ( pycor / ( y ) + (max-pycor  ))
      set elevation-here elevation ]
    set y ( y + (3 / max-pycor))
    set x (x - 1)
    if x < min-pycor [ stop ] ]
end

to wedge
  let x max-pycor
  ;let y [pxcor] of myself
  let wedgeBase patches with [ node# = 1 and pycor = x]
  loop
  [ ask patches with [ pycor = x and node# = 0 ]
    [
      ;set elevation elevation + ( distance ( min-one-of ( wedgeBase ) [distance myself]) )
      ;set elevation-here elevation
      ifelse pxcor > [ pxcor ] of ( min-one-of ( wedgeBase ) [distance myself])
      [ set side 1 ] [ set side 2 ]
    ]
    set x (x - 1)
    set wedgeBase patches with [ node# = 1 and pycor = x]
    if x < min-pycor [ stop ] ]
end

to adjust_heading

  if [ river-patch# ] of patch-here >= 2 [ set heading 0 ]
  loop [

    ifelse [ river-patch# ] of patch-here >= 2 ;count neighbors with [ river-patch# >= 2 ]  >= 1
    [ ifelse [ side ] of patch-here = 1
      [ ;set heading 0
        set heading heading + 5
        if ( [ocean?] of patch-ahead dist-trav = true ) or ([ river? ] of patch-ahead dist-trav = true ) [ fd dist-trav stop ] ]

      [ ;set heading 0
        set heading heading - 5
        if ( [ocean?] of patch-ahead dist-trav = true ) or ([ river? ] of patch-ahead dist-trav = true ) [ fd dist-trav stop ]  ] ]

    [
    ifelse [ side ] of patch-here = 1
      [
        set heading heading - 5
         if ( [ocean?] of patch-ahead dist-trav = true ) or ([ river? ] of patch-ahead dist-trav = true ) [ fd dist-trav stop ] ]
      [
        set heading heading + 5
         if ( [ocean?] of patch-ahead dist-trav = true ) or ([ river? ] of patch-ahead dist-trav = true ) [ fd dist-trav stop ] ]  ] ]
end

;;MODIFIED THE MYFLOW TO TRY AND SOLVE STUCK STARTUP
to my-flow ;; turtle procedure
           ;; get the lowest neighboring patch taking into account
           ;; how much water is on each patch.
           ;let random_target n-of 3 neighbors
   let random_target n-of 3 neighbors
    let target min-one-of random_target [ elevation ]
    if [elevation] of target
    < (elevation)
    [ move-to target ]
end

to my-flow-test
   let random_target n-of 3 neighbors
    let target min-one-of random_target [ elevation ]
    if [elevation] of target
    <= (elevation)
    [ move-to target ]
  ;[  let target min-one-of neighbors [ elevation + (count turtles-here * water-height) ]
  ;;if the elevation + water on the neighboring patch is
  ;; lower than here move to that patch.
  ;ifelse [elevation + (count turtles-here * water-height)] of target
  ;<= (elevation + (count turtles-here * water-height))
  ;[ move-to target ]
  ;[ move-to target print "I was forced to move to a patch with a greater elevation than my own!" ] ]
end

to flow
  ;; get the lowest neighboring patch taking into account
  ;; how much water is on each patch.
  let target min-one-of neighbors [ elevation + (count turtles-here * water-height) ]
  ;if the elevation + water on the neighboring patch is
  ; lower than here move to that patch.
  ifelse [elevation + (count turtles-here * water-height)] of target
  < (elevation + (count turtles-here * water-height))
  [ move-to target ]
  [ set breed waters ]
end

to flow1
  ;; get the lowest neighboring patch taking into account
  ;; how much water is on each patch.
  let target min-one-of neighbors [ elevation ]
  ;if the elevation + water on the neighboring patch is
  ; lower than here move to that patch.
  if [elevation ] of target
  < (elevation + (count turtles-here))
  [ move-to target ]
  ;[ set breed waters ]
end

to flow2
  ;; get the lowest neighboring patch taking into account
  ;; how much water is on each patch.
  let target min-one-of (neighbors with [ river-patch# = [ river-turtle# ] of myself ]) [ elevation ]
  let potentialnewtarget neighbors with [ river-patch# != [ river-turtle# ] of myself ]
  let newtarget min-one-of (neighbors with [ river-patch# != [ river-turtle# ] of myself ]) [ elevation ]

  ;if the elevation + water on the neighboring patch is
  ; lower than here move to that patch.
  ifelse [ node# ] of patch-here = 1
  [ flow1 ]
  [ ifelse any? (neighbors with [ river-patch# = [ river-turtle# ] of myself ]) [
      ifelse [elevation ] of target
      < (elevation); + (count turtles-here))
      [ move-to target ]
      [ if any? potentialnewtarget [
        move-to newtarget
        set river-turtle# [ river-patch# ] of patch-here
      ] ] ] [ if any? potentialnewtarget
    [  move-to newtarget
      set river-turtle# [ river-patch# ] of patch-here ] ] ]
end


to flow-towards-2º
  let node1 node-attractant
  let river river-turtle#
  ;wait 3
  loop
  [ ask raindrops
    [ if any? neighbors with [ (river? = true and river-patch# != river and base_river? = true) or floodplains? = true]
      [ die ]
      my-flow-test

      ask patch-here
      [ if river? = false
        [ set river? true
          set pcolor blue
          set node# node1
          set river-patch# spring#cycler
          set base_river? true ]
        if river? = true and base_river? = false
        [ set node# node1
          set river-patch# spring#cycler
          set base_river? true ] ]
      if any? neighbors with [ (river? = true and river-patch# != river and base_river? = true)or floodplains? = true]
      [ die ] ]

    if any? raindrops = false
    [ ask patches [set elevation temp]
      stop ] ]
end

to add-ocean
  let ocean-ceiling max [ elevation ] of patches with [ any? neighbors with [ node# = 1 ] = true ] + (log (max-pycor) 10)
  set ocean-ceiling (ocean-ceiling * (sqrt sqrt ( sqrt ( number-tributaries / 16) ) ) )
  ask patches with [ elevation <= ocean-ceiling ];and river? = false ]
  [ if pycor <= distance-floodplain-top
    [ set ocean? true if base_river? = false [ set river? false ] set pcolor blue set depth ocean-ceiling - elevation] ;[ set river? true ]; set node# 100]
    if pycor >= distance-floodplain-top ;and pycor < 0
    [ set river? true set pcolor blue
      if depth = 0 [ set depth ocean-ceiling - elevation] ] ]
end

to show-stream-attractant
  let min-stream-attractant min [ stream-attractant ] of patches
  let max-stream-attractant max [ stream-attractant ] of patches

  ask patches with [( ocean? = true or ( river? = true and node# = 1 ) )]
  [ set pcolor scale-color blue stream-attractant min-stream-attractant max-stream-attractant ]
end


to generate_setnetters
  set-default-shape setnetters "boat"
  let total_permits 0
  let stat_32_permits 49
  let stat_41_permits 56
  let stat_32_area 4.5
  let stat_41_area 8
 ;let center_area count patches with [ ocean? = true and side = 0 and distance min-one-of shoreline [ distance myself ] <= 16 ]
  let left_area ( count patches with [ node# = 97 and side = 2 ] ) / (16 ^ 2) ;;Calculates the set net area in miles of the left and right sides of the ocean of the simulation.
  let right_area ( count patches with [ node# = 97 and side = 1 ] ) / (16 ^ 2)
  let stat_32_prop right_area / stat_32_area
  let stat_41_prop left_area / stat_41_area
  set total_permits ( round ( stat_32_permits * stat_32_prop ) ) + ( round ( stat_41_permits * stat_41_prop ) )

  repeat set-agents ;total_set/drift_boats ;;not using the above code in favor of running multiple scenarios with manually set numbers of set gillnetters.
  [
    ;ifelse count setnetters = 0
    ;[
      ask one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished ] ;;Generate set netters in the set netting zone (patches with node# 97). Max shore distance is their net distance.
      [ sprout-setnetters 1
        [ set netsize commercial_radius_fished * 2
          set size 2
          set sockeye_adj_factor 8;(2.343696134 * 2.123146174) ;before catch chance adjustment, trying adjustment to proportion of fishing set gillnetters.
          set chinook_adj_factor 4
          set color white
          set sock_list [ ]
          set chin_list [ ]
          set motivation random-normal average-motivation motivation-sd
          set motivation motivation * 1.5
          set happiness starting-happiness
          ;calculate_setnet_surface%
          set previous_harvest 0
          make-radius-circle
          set limit? false
          set chinook_limit? false
          ht
          ask out-link-neighbors [ ht ] ] ]
  ]
end

to generate_driftgillnetters
  set-default-shape gillnetters "boat"
    repeat drift-agents;total_set/drift_boats ;;not using the above code in favor of running multiple scenarios with manually set numbers of set gillnetters.
  [
    ;ifelse count setnetters = 0
    ;[
      ask one-of patches with [ node# = 98 ]
      [ sprout-gillnetters 1
        [ set netsize commercial_radius_fished * 2
          set size 2
          set sockeye_adj_factor 7;1.733829765
          set chinook_adj_factor 2
          set sock_list [ ]
          set chin_list [ ]
          set color red
          set motivation random-normal average-motivation motivation-sd
          set motivation motivation * 1.5
          set happiness starting-happiness
          ;calculate_setnet_surface%
          set previous_harvest 0
          make-radius-circle
          set limit? false
          set chinook_limit? false
          ht
          ask out-link-neighbors [ ht ] ] ]
  ]
end

to generate_dipnetters
  ;;First, calculate the number of dip netters that will be coming in a day. Set number-dipnetters equal to this value.
  let dipnet_length dipnet_season_end - dipnet_season_start + 1 ;define total number of days dipnetters are fishing for.
  let increase_period (round (dipnet_length * 7 / 22) + dipnet_season_start) ;based on available data, numbers of dipnetters increase until end of this period.
  let decrease_period (round (dipnet_length * 11 / 22) + dipnet_season_start) ;based on available data, numbers of dipnetters decrease until end this period.

  if day <= increase_period [ set dipnet_multiplier dipnet_multiplier + (11 / 22) ] ;increase the dipnet multiplier while in increase period.
  if day >= decrease_period [ set dipnet_multiplier dipnet_multiplier - (7 / 22) ] ;decrease the dipnet multiplier while in decrease period.

  let multiplier dipnet_multiplier ^ 1.25
  ;Currently the scale is set such that each dipnetter agent stands for 60 dipnetters. Data needs to be collected on average number of fish these dipnetters are netting / day and total number of dipnetters / season.
  let number_dipnetters round  (((1 + random 5) * multiplier ) * 0.7) ;* 0.47) ;0.47 is obtained from taking the supposed mean number of dipnet days fished and dividing it by what the model has been putting out for dipnet_days_fished
  ;Previous runs conducted at the above times 0.7 instead of 0.5.
  repeat number_dipnetters [
    ask one-of patches with [ dipnet_zone? = true ]
    [ sprout-dipnetters 1
      [ set netsize dipnet_radius_fished * 2
        make-radius-circle
        set size 2
        set sockeye_adj_factor 16 * 1.14
        set chinook_adj_factor 16
        set household_size 0
        set number_fishers 0
        set dip_avg 0
        set sock_list [ ]
        set chin_list [ ]
        dipnet_roulette
        set previous_harvest 0
        set days_fished 1
        set motivation random-normal average-motivation motivation-sd
        set happiness starting-happiness
        set fishing_allowed? true
        set limit? false
        set chinook_limit? false
        set season_total 0
        set sock_mod 1
        set chin_mod 1
        ht
        ask out-link-neighbors [ ht ] ] ];;dipnetters are always fishing if they are around. ] ];;this is calculated later in the assess-situation procedure.
  ]

  calc_dip_prob
end

to dipnet_roulette
  ;;for each agent, calculates the household size for each of the permits represented by the agent and computes the aggregate household size of the dipnet agent.
  ;repeat dipnetters/agent [
  repeat dipnetters/agent [ ;2003 is the year where harvest by dipnetters seems to consistently match up with adfg harvest. Using dip/agent value for this year to see if this procedure is incorrectly bumping up catch chance too
    ;aggressively.
  let one 15.1
  let two 32.6
  let three 16.7
  let four 18.3
  let five 9.2
  let six 4.3
  let seven+ 3.8
  let hhadj ( 2 / 3 )
  let roll ( 1 + random 1000 ) / 10
  if roll <= one [ set household_size household_size + 1 set dip_avg dip_avg + 15 set number_fishers number_fishers + 1]
  if roll > one and roll <= ( one + two ) [ set household_size household_size + 2 set dip_avg dip_avg + 20 set number_fishers number_fishers + ((30 / 20) * hhadj )]
  if roll > ( one + two ) and roll <= ( one + two + three ) [ set household_size household_size + 3 set dip_avg dip_avg + 23 set number_fishers number_fishers + ((45 / 23) * hhadj)]
  ;;going to try an experiment where we max out the increasing number of fishermen at +2.
  if roll > ( one + two + three ) and roll <= ( one + two + three + four ) [ set household_size household_size + 4 set dip_avg dip_avg + 27 set number_fishers number_fishers + ((60 / 27) * hhadj)]
  if roll > ( one + two + three + four ) and roll <= ( one + two + three + four + five ) [ set household_size household_size + 5 set dip_avg dip_avg + 30 set number_fishers number_fishers + ((75 / 30) * hhadj)]
  if roll > ( one + two + three + four + five ) and roll <= ( one + two + three + four + five + six ) [ set household_size household_size + 6 set dip_avg dip_avg + 33 set number_fishers number_fishers + ((90 / 33) * hhadj)]
  if roll > ( one + two + three + four + five + six ) and roll <= ( one + two + three + four + five + six + seven+ ) [ set household_size household_size + 7 set dip_avg dip_avg + 38 set number_fishers number_fishers + ((105 / 38) * hhadj)] ]
end

to flock  ;; turtle procedure
  let item# stream#
  ;let greaterNeighbors neighbors with [ item item# attractant-list >  [item item# attractant-list] of myself ]
  ;let patch-heading towards one-of greaterNeighbors
  ;let heading-difference heading - patch-heading
  find-flockmates
  if any? flockmates
  [ find-nearest-neighbor
    ifelse distance nearest-neighbor < minimum-separation
    [ separate ]
    [ align
      cohere ] ]
  ; heading towards
end

to find-flockmates  ;; turtle procedure
  set flockmates other sockeyes in-radius vision
end

to find-nearest-neighbor ;; turtle procedure
  set nearest-neighbor min-one-of flockmates [distance myself]
end

;;; SEPARATE

to separate  ;; turtle procedure
  turn-away ([heading] of nearest-neighbor) max-separate-turn
end

;;; ALIGN

to align  ;; turtle procedure
  turn-towards average-flockmate-heading max-align-turn
end

to-report average-flockmate-heading  ;; turtle procedure
                                     ;; We can't just average the heading variables here.
                                     ;; For example, the average of 1 and 359 should be 0,
                                     ;; not 180.  So we have to use trigonometry.
  let x-component sum [dx] of flockmates
  let y-component sum [dy] of flockmates
  ifelse x-component = 0 and y-component = 0
  [ report heading ]
  [ report atan x-component y-component ]
end

;;; COHERE

to cohere  ;; turtle procedure
  turn-towards average-heading-towards-flockmates max-cohere-turn
end

to-report average-heading-towards-flockmates  ;; turtle procedure
                                              ;; "towards myself" gives us the heading from the other turtle
                                              ;; to me, but we want the heading from me to the other turtle,
                                              ;; so we add 180
  let x-component mean [sin (towards myself + 180)] of flockmates
  let y-component mean [cos (towards myself + 180)] of flockmates
  ifelse x-component = 0 and y-component = 0
  [ report heading ]
  [ report atan x-component y-component ]
end

;;; HELPER PROCEDURES
;to turn-towards-rewrite [new-heading max-turn]

;end

to turn-towards [new-heading max-turn]  ;; turtle procedure
  turn-at-most (subtract-headings new-heading heading) max-turn
end

to turn-away [new-heading max-turn]  ;; turtle procedure
  turn-at-most (subtract-headings heading new-heading) max-turn
end

;; turn right by "turn" degrees (or left if "turn" is negative),
;; but never turn more than "max-turn" degrees
to turn-at-most [turn max-turn]  ;; turtle procedure
  ifelse abs turn > max-turn
  [ ifelse turn > 0
    [ rt max-turn ]
    [ lt max-turn ] ]
  [ rt turn ]
end

to go
  report-position
  ask sockeyes [ print-file ]
  if ticks mod 500 = 0
  [files]
  check_dip_limit

  set Time Time + time_scale

  if time >= 360 and time <= 1380 and dip_open_check? = false
  [ ask dipnetters
    [ set open? true
      st
      ask out-link-neighbors [ st ] ]
  set dip_open_check? true
  ]

  if (time < 360 or time > 1380) and dip_open_check? = true
  [ ask dipnetters
    [ set open? false
      ht
      ask out-link-neighbors [ ht ] ]
  set dip_open_check? false
  ]

  if time >= 420 and time <= 1140 and set_open_check? = false
  [
    ask setnetters with [ fishing_allowed? = true ]
      [ st
        ask out-link-neighbors [ st ]
        set open? true ]
    let eff_21 (round ((count setnetters with [ fishing_allowed? = true and set_section = "21_22" ]) * set_scale ))
    let eff_31 (round ((count setnetters with [ fishing_allowed? = true and set_section = "31_32" ]) * set_scale ))
    let eff_41 (round ((count setnetters with [ fishing_allowed? = true and set_section = "41_42" ]) * set_scale ))
    set set_gillnet_effort_list lput round ((count setnetters with [ fishing_allowed? = true ]) * set_scale ) set_gillnet_effort_list
    set daily_permits_fished_21_22 lput eff_21 daily_permits_fished_21_22
    set daily_permits_fished_31_32 lput eff_31 daily_permits_fished_31_32
    set daily_permits_fished_41_42 lput eff_41 daily_permits_fished_41_42
    set sum_set_eff_list lput ( eff_21 + eff_31 + eff_41 ) sum_set_eff_list
    set set_open_check? true ]

  if time >= 420 and time <= 1140 and drift_open_check? = false
  [
    ask gillnetters with [ fishing_allowed? = true ]
      [ set open? true
        st
        ask out-link-neighbors [ st ] ]

    set drift_gillnet_effort_list lput round ((count gillnetters with [ fishing_allowed? = true ]) * drift_scale) drift_gillnet_effort_list
    set drift_open_check? true
  ]

  if (time < 420 or time > 1140) and set_open_check? = true
  [ ask setnetters
    [ set open? false
      ht
      ask out-link-neighbors [ ht ] ]
  set set_open_check? false
  ]

  if (time < 420 or time > 1140) and drift_open_check? = true
  [ ask gillnetters
    [ set open? false
      ht
      ask out-link-neighbors [ ht ] ]

    set drift_open_check? false
  ]

  ;ifelse time > 1140 and (day-counter = 2 or day-counter = 5 or EO? = true or drift-emergency-order = "Open") and drift_open_check? = false
  ;[ set drift_daily_harvest lput ( sum [ catch_total ] of gillnetters ) drift_daily_harvest ]
  ;[ set drift_daily_harvest lput 0 drift_daily_harvest ]

  move_fish

  check-life
  ask sockeyes [ if ycor >= 16 [ die ] ] ;[ if [node#] of patch-here > 1 and [node#] of patch-here <= 50[ die ] ]
  ask chinooks [ if ycor >= 16 [ die ] ] ;[ if [node#] of patch-here > 1 and [node#] of patch-here <= 50 [ die ] ]

  ;create_fish
  create_fish_mkII


  if Time >= 1440
  [
    ifelse item (sim-day - 1) driftgillnet_days_open = day
    [ set drift_daily_harvest lput ( sum [ catch_total ] of gillnetters with [ fishing_allowed? = true ] ) drift_daily_harvest
      set drift_daily_king_harvest lput ( sum [ chinook_catch_total ] of gillnetters with [ fishing_allowed? = true ] ) drift_daily_king_harvest ]
    [ set drift_daily_harvest lput 0 drift_daily_harvest
      set drift_daily_king_harvest lput 0 drift_daily_king_harvest ]

    ;ifelse item (day - 1) driftgillnet_days_open = day
    ;[ set drift_daily_king_harvest lput ( sum [ chinook_catch_total ] of gillnetters ) drift_daily_king_harvest ]
    ;[ set drift_daily_king_harvest lput 0 drift_daily_king_harvest ]

    ;ifelse item (day - 1) setgillnet_days_open = day
    ;[ set set_daily_harvest lput ( sum [ catch_total ] of setnetters ) set_daily_harvest ]
    ;[ set set_daily_harvest lput 0 set_daily_harvest ]

    ifelse item (sim-day - 1) days_open_ken = day or item (sim-day - 1) days_open_kas = day
    [ set sock_har_21_22 lput ( sum [ catch_total ] of setnetters with [ set_section = "21_22" and fishing_allowed? = true ] ) sock_har_21_22
      set sock_har_31_32 lput ( sum [ catch_total ] of setnetters with [ set_section = "31_32" and fishing_allowed? = true ] ) sock_har_31_32
      set sock_har_41_42 lput ( sum [ catch_total ] of setnetters with [ set_section = "41_42" and fishing_allowed? = true ] ) sock_har_41_42
      set set_daily_harvest lput ( sum [ catch_total ] of setnetters with [ fishing_allowed? = true ] ) set_daily_harvest

      set chin_har_21_22 lput ( sum [ chinook_catch_total ] of setnetters with [ set_section = "21_22" and fishing_allowed? = true ] ) chin_har_21_22
      set chin_har_31_32 lput ( sum [ chinook_catch_total ] of setnetters with [ set_section = "31_32" and fishing_allowed? = true ] ) chin_har_31_32
      set chin_har_41_42 lput ( sum [ chinook_catch_total ] of setnetters with [ set_section = "41_42" and fishing_allowed? = true ] ) chin_har_41_42  ]
    [ set sock_har_21_22 lput 0 sock_har_21_22
      set sock_har_31_32 lput 0 sock_har_31_32
      set sock_har_41_42 lput 0 sock_har_41_42
      set set_daily_harvest lput 0 set_daily_harvest

      set chin_har_21_22 lput 0 chin_har_21_22
      set chin_har_31_32 lput 0 chin_har_31_32
      set chin_har_41_42 lput 0 chin_har_41_42 ]


    set date lput day date
    set dipnet_tracker count dipnetters
    set dipnet_days_fished lput dipnet_tracker dipnet_days_fished
    set hhdf lput ( sum [ household_size ] of dipnetters ) hhdf
    set dailyTotal (sockeye_sonar)
    set chinook_daily_total (chinook_sonar)
    set sockeye_sonar_list lput sockeye_sonar sockeye_sonar_list
    set king_sonar_list lput chinook_sonar king_sonar_list
    set sockeye_escapement_list lput (escaped_sockeye + ( sockeye_sonar ) ) sockeye_escapement_list
    set escaped_sockeye (escaped_sockeye + ( sockeye_sonar ) )
    set escaped_chinook (escaped_chinook + (chinook_sonar ) )
    ifelse sum [catch_total] of gillnetters = 0 or sum_drag = 0
    [ set drift_har_%_tot lput 0 drift_har_%_tot ]
    [ set drift_har_%_tot lput (((sum [catch_total] of gillnetters) / sum_drag) * 100) drift_har_%_tot ]
    set sum_set sum [ season_total ] of setnetters
    set sum_set_list lput sum_set sum_set_list
    set sum_drag sum [ season_total ] of gillnetters
    set day day + 1
    set sim-day sim-day + 1
    if ((day - 1) >= (length calc_sockeye_run_list)) and ((day - 1) >= (length calc_chinook_run_list))
    [ show_data
      set escaped_sockeye escaped_sockeye + early-sock
      set escaped_chinook escaped_chinook + early-chin
      file-close-all
      stop ]

    calc_sockeye_seed
    calc_chinook_seed
    set day-counter (day mod 7) + 1
    ifelse day-counter = 2 or day-counter = 5
    [set regular_period? 1
      set regular_period_list lput 1 regular_period_list]
    [set regular_period? 0
      set regular_period_list lput 0 regular_period_list]
    set comm-week ceiling (comm-day / 7)
    let rem day / 7
    set week ceiling rem
    set sockeye_sonar 0
    set chinook_sonar 0
    set time time - 1440
    set situation_assessed? false

    if count dipnetters = 1 [
      set dipnet_daily_mean_harvest lput [catch_total] of dipnetters dipnet_daily_mean_harvest
      set dipnet_daily_sd_harvest lput [catch_total] of dipnetters dipnet_daily_sd_harvest
    ]

    if count dipnetters > 1 [
      set dipnet_daily_mean_harvest lput (mean [catch_total] of dipnetters) dipnet_daily_mean_harvest
      set dipnet_daily_sd_harvest lput (standard-deviation [catch_total] of dipnetters) dipnet_daily_sd_harvest
    ]

    if situation_assessed? = false
    [ assess_situation
      comm_depth_%_adj
      calc_dip_prob
      calc_set_prob
      calc_gill_prob ]

    if day >= dipnet_season_start and day <= dipnet_season_end
    [ generate_dipnetters ]

    if day > dipnet_season_end [
      ask dipnetters with [ season_total = 0 ] [
        set list_failed_dipnetters lput season_total list_failed_dipnetters
      ]

      ask dipnetters [
        set season_total_list lput season_total season_total_list
        set dip_king_har_list lput chinook_season_total dip_king_har_list
        if days_fished = 1 [ set day1 day1 + 1 ]
        if days_fished = 2 [ set day2 day2 + 1 ]
        if days_fished = 3 [ set day3 day3 + 1 ]
        if days_fished = 4 [ set day4 day4 + 1 ]
        if days_fished = 5 [ set day5 day5 + 1 ]
        if days_fished = 6 [ set day6 day6 + 1 ]
        if days_fished = 7 [ set day7 day7 + 1 ]
        ask out-link-neighbors [ die ]
        ask my-out-links [ die ] die    ]
    ]

  ]

  tick
end

to show_data
    set total_number_failed_dipnetters length list_failed_dipnetters
    set total_number_dipnetters length season_total_list * dipnetters/agent
    set mean_season_dipnet_harvest mean season_total_list / dipnetters/agent
    set min_dipnet_harvest min season_total_list / dipnetters/agent
    set max_dipnet_harvest max season_total_list / dipnetters/agent
    set sum_dipnet_days_fished sum dipnet_days_fished * dipnetters/agent
    set sum_dipnet_season_total sum season_total_list
    print "total number dipnet permits:"
    show total_number_dipnetters
    print "total number of dipnet permits who caught nothing:"
    show total_number_failed_dipnetters
    print "mean season dipnet harvest/permit:"
    show mean_season_dipnet_harvest
    print "min season dipnet harvest/permit:"
    show min_dipnet_harvest
    print "max season dipnet harvest/permit:"
    show max_dipnet_harvest
    print "number of dipnet days fished:"
    show sum_dipnet_days_fished
    print "total harvest number of sockeye by dipnetters:"
    show sum_dipnet_season_total
    print "mean harvest/set gillnetter:"
    set mean_set mean [ season_total ] of setnetters
    show mean_set
    print "mean harvest/drag gillnetter:"
    set mean_drag mean [ season_total ] of gillnetters
    show mean_drag
    print "total set harvest:"
    set sum_set sum [ season_total ] of setnetters
    show sum_set
    set sum_set_list lput sum_set sum_set_list
    print "total drag harvest:"
    set sum_drag sum [ season_total ] of gillnetters
    show sum_drag
    print "total set permit-days fished:"
    show setnet_tracker
    print "total drag permit-days fished:"
    show gillnet_tracker
end

to determine_chinook_run
    ;set chinook_run_avg avg_chinook_list
    ;set chinook_run_sd var_chinook_list
  set calc_day 1
  loop
  [
    if calc_day <= 7 [ set calc_week 1 ]
    if calc_day > 7 and calc_day <= 14 [ set calc_week 2 ]
    if calc_day > 14 and calc_day <= 21 [ set calc_week 3 ]
    if calc_day > 21 and calc_day <= 28 [ set calc_week 4 ]
    if calc_day > 28 and calc_day <= 35 [ set calc_week 5 ]
    if calc_day > 42 and calc_day <= 49 [ set calc_week 6 ]
    let avg  (item (calc_day - 1) avg_chinook_list) ;* (sockeye-run-size / (sum_run)))
    let sd  (item (calc_day - 1) var_chinook_list) ;* (sockeye-run-size / (sum_run)))
    set chinook_daily_run random-normal avg sd
    while [ chinook_daily_run + ( 3 * sd ) < avg or chinook_daily_run - ( 3 * sd ) > avg or chinook_daily_run < 0] [ set chinook_daily_run random-normal avg sd ]
    ;;If the calculated daily run is more than 3 se's below or above the average value, re-calculate the daily run.
    ;set chinook_sockeye_daily_run chinook_sockeye_daily_run * (chinook-run-size / (sum avg_chinook_list) )
    set calc_chinook_run_list lput chinook_daily_run calc_chinook_run_list
    set calc_day calc_day + 1
    if calc_day >= length avg_chinook_list
    [
      let x sum calc_chinook_run_list
      let y chinook-run-size / x
      ;set calc_chinook_run_list map [ [i] -> y * i] calc_chinook_run_list
      set calc_chinook_run_list map [y * ?] calc_chinook_run_list
      stop ]

     ]
end

to determine_sockeye_run
  set calc_day 1
  loop
  [
    if calc_day <= 7 [ set calc_week 1 ]
    if calc_day > 7 and calc_day <= 14 [ set calc_week 2 ]
    if calc_day > 14 and calc_day <= 21 [ set calc_week 3 ]
    if calc_day > 21 and calc_day <= 28 [ set calc_week 4 ]
    if calc_day > 28 and calc_day <= 35 [ set calc_week 5 ]
    if calc_day > 42 and calc_day <= 49 [ set calc_week 6 ]
    let avg  (item (calc_day - 1) sockeye_run_avg) ;* (sockeye-run-size / (sum_run)))
    let sd  (item (calc_day - 1) sockeye_run_sd) ;* (sockeye-run-size / (sum_run)))
    set sockeye_daily_run random-normal avg sd
    while [ sockeye_daily_run + ( 2 * sd ) < avg or sockeye_daily_run - ( 2 * sd ) > avg or sockeye_daily_run < 0 ] [ set sockeye_daily_run random-normal avg sd ]
    ;;If the calculated daily run is more than 2 sds below or above the average value, re-calculate the daily run.

    ;let avg_prop_cc 1 - 0.545080475 ;;average proportion of fish caught by commercial fleet from the runs returning to Kenai
    ;let sd_prop_cc 0.101484484 ;;sd proportion of fish caught by commercial fleet from the runs returning to Kenai
    ifelse calc_day >= 10 and calc_day <= 31 [
      let dip_adj random-normal (item (calc_day - 10) dip_son_adj_list) (item (calc_day - 10) dip_son_adj_var)
      let drift_adj random-normal (item (calc_week - 1) drift_son_adj_list) (item (calc_week - 1) drift_son_adj_var)
      let set_adj random-normal (item (calc_week - 1) set_son_adj_list) (item (calc_week - 1) set_son_adj_var)

      while [ dip_adj < 1
        or (drift_adj < 1 or drift_adj > (item (calc_week - 1) drift_son_adj_list) + (item (calc_week - 1) drift_son_adj_var))
        or (set_adj < 1 or set_adj > (item (calc_week - 1) set_son_adj_list) + (item (calc_week - 1) set_son_adj_var)) ]
        [ set dip_adj random-normal (item (calc_day - 10) dip_son_adj_list) (item (calc_day - 10) dip_son_adj_var)
          set drift_adj random-normal (item (calc_week - 1) drift_son_adj_list) (item (calc_week - 1) drift_son_adj_var)
          set set_adj random-normal (item (calc_week - 1) set_son_adj_list) (item (calc_week - 1) set_son_adj_var) ]

      let sockeye_daily_run_dip_adj ( (sockeye_daily_run * dip_adj) - sockeye_daily_run)
      let sockeye_daily_run_drift_adj ( (sockeye_daily_run * drift_adj) - sockeye_daily_run)
      let sockeye_daily_run_set_adj ( (sockeye_daily_run * set_adj) - sockeye_daily_run)
      set sockeye_daily_run sockeye_daily_run + sockeye_daily_run_drift_adj + sockeye_daily_run_dip_adj + sockeye_daily_run_set_adj
      ;set sockeye_daily_run sockeye_daily_run * (sockeye-run-size / (sum_run))
      set sockeye_daily_run_list lput sockeye_daily_run sockeye_daily_run_list ;;This is for purposes of looking at the number of fish returning on a given day after the simulation is complete.
      set calc_sockeye_run_list lput sockeye_daily_run calc_sockeye_run_list

    ]

    [ let drift_adj random-normal (item (calc_week - 1) drift_son_adj_list) (item (calc_week - 1) drift_son_adj_var)
      let set_adj random-normal (item (calc_week - 1) set_son_adj_list) (item (calc_week - 1) set_son_adj_var)
      while [ (drift_adj < 1 or drift_adj > (item (calc_week - 1) drift_son_adj_list) + (item (calc_week - 1) drift_son_adj_var))
        or  (set_adj < 1 or set_adj > (item (calc_week - 1) set_son_adj_list) + (item (calc_week - 1) set_son_adj_var)) ]
        [ set drift_adj random-normal (item (calc_week - 1) drift_son_adj_list) (item (calc_week - 1) drift_son_adj_var)
          set set_adj random-normal (item (calc_week - 1) set_son_adj_list) (item (calc_week - 1) set_son_adj_var) ]
      let sockeye_daily_run_drift_adj ( (sockeye_daily_run * drift_adj) - sockeye_daily_run)
      let sockeye_daily_run_set_adj ( (sockeye_daily_run * set_adj) - sockeye_daily_run)
      set sockeye_daily_run sockeye_daily_run + sockeye_daily_run_drift_adj + sockeye_daily_run_set_adj
      ;set sockeye_daily_run sockeye_daily_run * (sockeye-run-size / (sum_run))
      set sockeye_daily_run_list lput sockeye_daily_run sockeye_daily_run_list ;;This is for purposes of looking at the number of fish returning on a given day after the simulation is complete. This list contains
      ;;the seeded number of sockeye salmon for a given day.
      set calc_sockeye_run_list lput sockeye_daily_run calc_sockeye_run_list
    ]


      ;set sockeye_daily_run sockeye_daily_run * (sockeye-run-size / (sum_run)) ;;If the calculated daily run is all good, adjust the size of it by the proportion of how many fish we are simulating relative to the number of fish making up the list
      ;;that was used to initially calculate the daily run size.

      ;set sockeye_daily_run sockeye_daily_run * (random-normal avg_prop_cc sd_prop_cc)
      ;set sockeye_daily_run_list lput sockeye_daily_run sockeye_daily_run_list ;;This is for purposes of looking at the number of fish returning on a given day after the simulation is complete.


    set calc_day calc_day + 1
    if calc_day >= length sockeye_run_avg
    [
      let x sum calc_sockeye_run_list
      let y sockeye-run-size / x
      ;set calc_sockeye_run_list map [[i] -> y * i] calc_sockeye_run_list
      set calc_sockeye_run_list map [? * y] calc_sockeye_run_list
      stop ]

     ]
end

to calc_sockeye_seed
  carefully
  [ set sockeye_daily_run item (day - 1) calc_sockeye_run_list ] [ set sockeye_daily_run 0 ]
end

to calc_chinook_seed
  ;ifelse day <= length calc_chinook_run_list
  carefully
    [ set chinook_daily_run item (day - 1) calc_chinook_run_list ]
    [ set chinook_daily_run 0 ]
end

to calc_set_prob
  ask setnetters [
  set net_length set_gillnet_length * 6 ;;set gillnet length is in fathoms. 1 fathom = 6 ft. This scales set gillnet length from fathoms to ft.
  let #setnetters set_scale ;;grab the number of set gillnetters per agent.
  set net_length net_length * #setnetters ;;calculate the total length of netting of all STAKEHOLDERS simulated (not agents, eg. 400 stakeholders represented by 50 agents).
  let patch_length 990 * 4
  let total_patch_length patch_length * ( count patches with [ river? = true or ocean? = true ] in-radius (netsize / 2))
  set surface% net_length / total_patch_length ]

end

to comm_depth_%_adj
  let kintama_depth_adj 5.5 / 45
  let net_depth kintama_depth_adj * set_gillnet_depth

  let low_sel floor net_depth - 1
  let up_sel ceiling net_depth - 1

  ifelse low_sel < 0
  [ let dec net_depth - floor net_depth
    set set_sock_depth_adj dec * ( item 0 sockeye_cum%_depth ) ]
  [ let dec net_depth - floor net_depth
    set set_sock_depth_adj (item low_sel sockeye_cum%_depth) + (dec * ( (item up_sel sockeye_cum%_depth) - (item low_sel sockeye_cum%_depth) ) ) ]

  ;let kintama_depth_adj 5.5 / 45
  ;let net_depth kintama_depth_adj * set_gillnet_depth

  ;let low_sel floor net_depth - 1
  ;let up_sel ceiling net_depth - 1

  ifelse low_sel < 0
  [ let dec net_depth - floor net_depth
    set set_chin_depth_adj dec * ( item 0 chinook_cum%_depth ) ]
  [ let dec net_depth - floor net_depth
    set set_chin_depth_adj (item low_sel chinook_cum%_depth) + (dec * ( (item up_sel chinook_cum%_depth) - (item low_sel chinook_cum%_depth) ) ) ]
  let set_chin_adj 1;(1 / 4);1.75
  ask setnetters [ set sock_mod set_sock_depth_adj set chin_mod (set_chin_depth_adj * set_chin_adj) ]
  ;let kintama_depth_adj 5.5 / 45
  set net_depth kintama_depth_adj * drift_gillnet_depth

  set low_sel floor net_depth - 1
  set up_sel ceiling net_depth - 1

  ifelse low_sel < 0
  [ let dec net_depth - floor net_depth
    set drift_sock_depth_adj dec * ( item 0 sockeye_cum%_depth ) ]
  [ let dec net_depth - floor net_depth
    set drift_sock_depth_adj (item low_sel sockeye_cum%_depth) + (dec * ( (item up_sel sockeye_cum%_depth) - (item low_sel sockeye_cum%_depth) ) ) ]

  ;let kintama_depth_adj 5.5 / 45
  ;let net_depth kintama_depth_adj * set_gillnet_depth

  ;let low_sel floor net_depth - 1
  ;let up_sel ceiling net_depth - 1

  ifelse low_sel < 0
  [ let dec net_depth - floor net_depth
    set drift_chin_depth_adj dec * ( item 0 chinook_cum%_depth ) ]
  [ let dec net_depth - floor net_depth
    set drift_chin_depth_adj (item low_sel chinook_cum%_depth) + (dec * ( (item up_sel chinook_cum%_depth) - (item low_sel chinook_cum%_depth) ) ) ]

  let drift_chin_adj 1
  ask gillnetters [ set sock_mod drift_sock_depth_adj set chin_mod (drift_chin_depth_adj * drift_chin_adj) ]
end

to calc_dip_prob
  ask dipnetters
  [
    let #dipnetters number_fishers;dipnetters/agent
    let net_width dipnet_width
    let total_width net_width * #dipnetters
    let patch_area 990 * 4 ;*990
    let water_area ( ( count patches with [ river? = true or ocean? = true ] in-radius dipnet_radius_fished ) * ( patch_area ) )
    set surface% ( total_width / water_area ) * 0.25
  ]
end

to calc_gill_prob
  ask gillnetters [
  set net_length drift_gillnet_length * 6 * drift_scale ;;calculate the total length of netting of all STAKEHOLDERS simulated (not agents, eg. 400 stakeholders represented by 50 agents).
  let patch_length 990 * 4
  let total_patch_length patch_length * ( count patches with [ river? = true or ocean? = true ] in-radius (netsize / 2))
  set surface% net_length / total_patch_length ]
end


to distribute_set_effort
  set ken_fishing_allowed? true
  set kas_fishing_allowed? true


  if (day-counter != 2 and day-counter != 5) or (day < kenai_set_season_start or day > kenai_set_season_end) or (ken_closed? = true) or (kenai-set-emergency-order = "Close")
  [ set ken_fishing_allowed? false ]

  if (ken_opened? = true or kenai-set-emergency-order = "Open") and day <= kenai_set_season_end
  [ set ken_fishing_allowed? true ]

  if (day-counter != 2 and day-counter != 5) or (kas_closed? = true) or (kasilof-set-emergency-order = "Close") or (day < kasilof_set_season_start or day > kasilof_set_season_end)
  [ set kas_fishing_allowed? false ]

  if (kas_opened? = true or kasilof-set-emergency-order = "Open") and day <= kasilof_set_season_end
    [ set kas_fishing_allowed? true ]

  let total_boats round (set_fished / set_scale)
  ask n-of total_boats setnetters [ set fishing_allowed? true ]

  let total set_21_22_permits + set_31_32_permits + set_41_42_permits

  let chance_21_22 (set_21_22_permits / total)

  let chance_31_32 (set_31_32_permits / total) + chance_21_22
  ; let prop_31 1 - random-normal 0.388228701 0.041306902
  ; let prop_32 1 - prop_31
  let chance_41_42 (set_41_42_permits / total) + chance_31_32

  if ken_fishing_allowed? = true and kas_fishing_allowed? = true
  [
    ask setnetters with [ fishing_allowed? = true ]
    [ let x (random 101) / 100
      if x >= 0 and x <= chance_21_22
      [set set_section "21_22"]
      if x > chance_21_22 and x <= chance_31_32
      [ set set_section "31_32"
        let y (random 101) / 100
        ifelse y >= 0.388228701
        [ set kasilof? true ]
        [ set kenai? true ]
      ]
      if x > chance_31_32 and x <= chance_41_42
      [ set set_section "41_42" ] ]

     ]


  if ken_fishing_allowed? = false and kas_fishing_allowed? = true
  [ ask setnetters with [ fishing_allowed? = true ]
    [ let x (random 101) / 100

      while [ x > chance_31_32 ] [ set x (random 101) / 100 ]

      if x >= 0 and x <= chance_21_22
      [ set set_section "21_22"
        set kasilof? true ]
      if x > chance_21_22 and x <= chance_31_32
      [ set set_section "31_32"
        set kasilof? true ]


      ;if x > chance_31_32 and x <= chance_41_42
      ;[ set set_section "41_42" ]

      ] ]

  if ken_fishing_allowed? = true and kas_fishing_allowed? = false
  [ ask setnetters with [ fishing_allowed? = true ]
    [ let x (random 101) / 100

      while [ x <= chance_21_22 ] [ set x (random 101) / 100 ]

     ; if x >= 0 and x <= chance_21_22
     ; [ set set_section "21_22"
     ;   set kasilof? true ]

      if x > chance_21_22 and x <= chance_31_32
      [ set set_section "31_32"
        set kenai? true ]

      if x > chance_31_32 and x <= chance_41_42
      [ set set_section "41_42"
        set kenai? true ]

      ] ]

  ;Cap the maximum number of fishing permits by the maximum number of permits fished in a given section.

  if (count setnetters with [ set_section = "21_22" and fishing_allowed? = true ]) * set_scale > set_21_22_permits
  [ let diff ((count setnetters with [ set_section = "21_22" and fishing_allowed? = true ]) * set_scale) - set_21_22_permits
    let boat_diff ceiling ( diff / set_scale )
    ask n-of boat_diff setnetters with [ set_section = "21_22" and fishing_allowed? = true ] [ set fishing_allowed? false set set_section 0 ] ]

  if ken_fishing_allowed? = false and kas_fishing_allowed? = true
  [ if (count setnetters with [ set_section = "31_32" and fishing_allowed? = true ]) * set_scale > ( set_31_32_permits * ( 1 - 0.388228701 ) )
    [ let diff ((count setnetters with [ set_section = "31_32" and fishing_allowed? = true ]) * set_scale) - ( set_31_32_permits * ( 1 - 0.388228701 ) )
      let boat_diff ceiling ( diff / set_scale )
      ask n-of boat_diff setnetters with [ set_section = "31_32" and fishing_allowed? = true ] [ set fishing_allowed? false set set_section 0 ] ] ]


  if ken_fishing_allowed? = true and kas_fishing_allowed? = false
  [ if (count setnetters with [ set_section = "31_32" and fishing_allowed? = true ]) * set_scale > ( set_31_32_permits * 0.388228701 )
    [ let diff ((count setnetters with [ set_section = "31_32" and fishing_allowed? = true ]) * set_scale) - ( set_31_32_permits * 0.388228701 )
      let boat_diff ceiling ( diff / set_scale )
      ask n-of boat_diff setnetters with [ set_section = "31_32" and fishing_allowed? = true ] [ set fishing_allowed? false set set_section 0 ] ] ]

  if ken_fishing_allowed? = true and kas_fishing_allowed? = true
  [ if (count setnetters with [ set_section = "31_32" and fishing_allowed? = true ]) * set_scale > set_31_32_permits
    [ let diff ((count setnetters with [ set_section = "31_32" and fishing_allowed? = true ]) * set_scale) - set_31_32_permits
      let boat_diff ceiling ( diff / set_scale )
      ask n-of boat_diff setnetters with [ set_section = "31_32" and fishing_allowed? = true ] [ set fishing_allowed? false set set_section 0 ] ] ]


  if (count setnetters with [ set_section = "41_42" and fishing_allowed? = true ]) * set_scale > set_41_42_permits
  [ let diff ((count setnetters with [ set_section = "41_42" and fishing_allowed? = true ]) * set_scale) - set_41_42_permits
    let boat_diff ceiling ( diff / set_scale )
    ask n-of boat_diff setnetters with [ set_section = "41_42" and fishing_allowed? = true ] [ set fishing_allowed? false set set_section 0 ] ]

  if ken_fishing_allowed? = false and kas_fishing_allowed? = false [ ask setnetters [ set fishing_allowed? false ] ]

  ifelse ken_fishing_allowed? = true or kas_fishing_allowed? = true
  [ set setgillnet_days_open lput 1 setgillnet_days_open ]
  [ set setgillnet_days_open lput 0 setgillnet_days_open ]
end

to assess_situation

  if day >= dipnet_season_start and day <= dipnet_season_end [ ;;only check on dipnetters happiness if dipnet season is open in the first place.
    ask dipnetters [
      ifelse days_fished <= 1
      [ dip_day1 ]
      [ dip_day>1 ]

    ] ]

  determine_emergency_orders

  ask setnetters [ set set_section 0 set fishing_allowed? false set kenai? false set kasilof? false set catch_total 0 set chinook_catch_total 0]

  determine_set_gillnet_effort
  distribute_set_effort

  ;Determine if it is an allowed fishing day or kasilof set gillnetters
  let day_open? true
  if (day-counter != 2 and day-counter != 5) or kas_closed? = true or (day < kasilof_set_season_start or day > kasilof_set_season_end) or kasilof-set-emergency-order = "Close"
  [ set day_open? false ]
  if (kas_opened? = true or kasilof-set-emergency-order = "Open") and day <= kasilof_set_season_end
  [ set day_open? true ]

  ;If it is an allowed fishing day for kasilof set gillnetters, update the lists keeping track of when they were allowed to fish.
  ifelse day_open? = true
  [ set days_open_kas lput day days_open_kas
    set kas_open_list lput 1 kas_open_list ]
  [ set days_open_kas lput 0 days_open_kas
    set kas_open_list lput 0 kas_open_list ]

  ;Determine if it is an allowed fishing day or kenai set gillnetters
  set day_open? true
  if (day-counter != 2 and day-counter != 5) or (day < kenai_set_season_start or day > kenai_set_season_end) or kenai-set-emergency-order = "Close" or ken_closed? = true
  [ set day_open? false ]

  if (ken_opened? = true or kenai-set-emergency-order = "Open") and day <= kenai_set_season_end
  [ set day_open? true ]

  ;If it is an allowed fishing day for kenai set gillnetters, update the lists keeping track of when they were allowed to fish.
  ifelse day_open? = true
  [ set days_open_ken lput day days_open_ken
    set ken_open_list lput 1 ken_open_list ]
  [ set days_open_ken lput 0 days_open_ken
    set ken_open_list lput 0 ken_open_list ]

  if day_open? = true [ ask setnetters with [ fishing_allowed? = true ] [ set_relocation ] ]

  ask gillnetters [ set fishing_allowed? false ]
  determine_drift_effort

    ;let permits_fished round (( total-drift-permits * drift_eff ) / drift_scale) ;;calculate the number of permits to simulate on a given day from the above procedure
  let drift_boats_fished floor (round ( drift_eff / drift_scale )) ;;floor the rounding so that it doesn't call more than the number of maximum allowed agents for fishing.
    ;;and the total number of permits that are being simulated for the given simulation season.
    ;;drift_scale is the number of drift gillnetters or drift permits per agent. Dividing the numerator by drift_scale gives the number of agents that should be represented
    ;;in the simulation.

  ask n-of drift_boats_fished gillnetters [ set fishing_allowed? true ]

  ask gillnetters
  [ if (day-counter != 2 and day-counter != 5) or drift_closed? = true or (day < drift_season_start or day > drift_season_end) or drift-emergency-order = "Close"
    [ set fishing_allowed? false ]
    if drift_opened? = true or drift-emergency-order = "Open"
    [ set fishing_allowed? true ] ]

  ;;for drift openings list
  set day_open? true

   if (day-counter != 2 and day-counter != 5) or drift_closed? = true or (day < drift_season_start or day > drift_season_end) or drift-emergency-order = "Close"
    [ set day_open? false ]
    if drift_opened? = true or drift-emergency-order = "Open"
    [ set day_open? true ]

  ifelse day_open? = true
  [ set driftgillnet_days_open lput day driftgillnet_days_open
    set drift_open_list lput 1 drift_open_list ]
  [ set driftgillnet_days_open lput 0 driftgillnet_days_open
    set drift_open_list lput 0 drift_open_list ]

  if day_open? = true [ ask gillnetters with [ fishing_allowed? = true ] [ drift_relocation ] ]

  set situation_assessed? true
end

to dip_day1
        ;;if the catch that the dipnetters get is between 1 and 2 sd greater than the mean, increase happiness.
      let daily_catch catch_total / dipnetters/agent  ;;get the number of fish caught by each individual dipnetter in an agent.
      ;;next, check to see if the total was above or below the mean, and adjust the happiness value accordingly.
      let sight dipnet_vision * 16 ;;convert to patches from mi.
      ifelse count other dipnetters in-radius sight >= 1
        [
          ;;All of following eqn will include local mean happiness since always > 0
          let hl mean [ catch_total ] of other dipnetters in-radius sight
          ifelse hl > 0
          [
            let hp previous_harvest
            ifelse hp > 0
            [
             let hk dip_avg
             let m motivation
             let j happiness
             let g mean [ happiness ] of other dipnetters in-radius sight
             let h catch_total
             let d days_fished
             set happiness (((( h / hl ) + ( h / hk ) + ( h / hp )) / 3) + m )  * g * ( ( 7 / ( d + 7.75 ) ) ) * j
             if happiness > 1 [ set happiness 1 ]
              ;;put the full eqn in here
            ]
            [
              let hk dip_avg
              let m motivation
              let j happiness
              let g mean [ happiness ] of other dipnetters in-radius sight
              let h catch_total
              let d days_fished
              set happiness (((( h / hl ) + ( h / hk ) ) / 2) + m )  * g * ( ( 7 / ( d + 7.75 ) ) ) * j
              if happiness > 1 [ set happiness 1 ]
              ;;put in the eqn without previous harvest here.
            ]
          ]
          [
            let hp previous_harvest
            ifelse hp > 0
            [
              let hk dip_avg
              let m motivation
              let j happiness
              let g mean [ happiness ] of other dipnetters in-radius sight
              let h catch_total
              let d days_fished
              set happiness ((( ( h / hk ) + ( h / hp )) / 2) + m )  * g * ( ( 7 / ( d + 7.75 ) ) ) * j
              if happiness > 1 [ set happiness 1 ]
              ;;eqn without local mean harvest goes here.
            ]
            [
              let hk dip_avg
              let m motivation
              let j happiness
              let g mean [ happiness ] of other dipnetters in-radius sight
              let h catch_total
              let d days_fished
              set happiness ((( ( h / hk ) ) / 1) + m )  * g * ( ( 7 / ( d + 7.75 ) ) ) * j
              if happiness > 1 [ set happiness 1 ]
              ;;eqn without local mean harvest or previous harvest goes here.
            ]
          ]
        ]
        [
          ;;no local harvest or mean happiness
          let hp previous_harvest
          ifelse hp > 0
            [
              let hk dip_avg
              let m motivation
              let j happiness
              let h catch_total
              let d days_fished
              set happiness ((( ( h / hk ) + ( h / hp )) / 2) + m )  * ( ( 7 / ( d + 7.75 ) ) ) * j
              if happiness > 1 [ set happiness 1 ]
              ;;eqn without local mean
            ]
            [
              let hk dip_avg
              let m motivation
              let j happiness
              let h catch_total
              let d days_fished
              set happiness ((( ( h / hk ) ) / 1) + m )  * ( ( 7 / ( d + 7.75 ) ) ) * j
              if happiness > 1 [ set happiness 1 ]
              ;;eqn without local mean or previous harvest
            ]
        ]

      if limit? = true [
        if days_fished = 1 [ set day1 day1 + 1 ]
        if days_fished = 2 [ set day2 day2 + 1 ]
        if days_fished = 3 [ set day3 day3 + 1 ]
        if days_fished = 4 [ set day4 day4 + 1 ]
        if days_fished = 5 [ set day5 day5 + 1 ]
        if days_fished = 6 [ set day6 day6 + 1 ]
        if days_fished = 7 [ set day7 day7 + 1 ]
        set season_total_list lput season_total season_total_list
        set dip_king_har_list lput chinook_season_total dip_king_har_list
        ;;remove any links, eg. the circle that they carry with them.
        ask out-link-neighbors [ die ]
        ask my-out-links [ die ]
        die
        ]

      ifelse happiness > happiness-threshold
      [
        ifelse count dipnetters in-radius sight >= 1
        [
          let l mean [ catch_total ] of dipnetters in-radius sight
          let h catch_total
          let k dip_avg
          let p previous_harvest
          ifelse p = 0
          [
            ifelse l = 0
            [
              if (h / k) < 1 [ move-to one-of patches with [ dipnet_zone? = true ] ]
            ]
            [
              if (h / k) < 1 and (h / l) < 1 [ move-to one-of patches with [ dipnet_zone? = true ] ]
            ]
          ]
          [
            ifelse l = 0
            [
              if (h / k) < 1 and (h / p) < 1 [ move-to one-of patches with [ dipnet_zone? = true ] ]
            ]
            [
              if ((h / k) < 1 and ((h / l) < 1 or (h / p) < 1)) or ( (h / l) < 1 and ( (h / k) < 1 or (h / p) < 1 ) ) or ( (h / p) < 1 and ( (h / k) < 1 or (h / l) < 1 ) ) [ move-to one-of patches with [ dipnet_zone? = true ] ]
            ]
          ]
        ]
        [
          let h catch_total
          let k dip_avg
          let p previous_harvest
          ifelse p = 0
          [
            if (h / k) < 1 [ move-to one-of patches with [ dipnet_zone? = true ] ]
          ]
          [
            if (h / k) < 1 and (h / p) < 1 [ move-to one-of patches with [ dipnet_zone? = true ] ]
          ]
        ]
      ]
      [
        if season_total = 0 [
             set list_failed_dipnetters lput season_total list_failed_dipnetters ;;add their season total to the list of failed dipnetters. The length of this list gives us the count of failed dipnetters.
           ]
        if days_fished = 1 [ set day1 day1 + 1 ]
        if days_fished = 2 [ set day2 day2 + 1 ]
        if days_fished = 3 [ set day3 day3 + 1 ]
        if days_fished = 4 [ set day4 day4 + 1 ]
        if days_fished = 5 [ set day5 day5 + 1 ]
        if days_fished = 6 [ set day6 day6 + 1 ]
        if days_fished = 7 [ set day7 day7 + 1 ]
        set season_total_list lput season_total season_total_list
        set dip_king_har_list lput chinook_season_total dip_king_har_list
        ;;remove any links, eg. the circle that they carry with them.
        ask out-link-neighbors [ die ]
        ask my-out-links [ die ]
        die
      ]
      ;;if the random number that was first calculated is less than the composite happiness and motivation, re-roll the random number. The dipnetter stays in the world for now.
      ;;As a dipnetters happiness and motivation score composite to a low value, the chance that they will leave becomes greater and greater. Simultaneously, as this value gets lower and lower,
      ;;if they do end up staying, the chance that they will move gets higher and higher.

      set days_fished days_fished + 1
      set previous_harvest catch_total
      set catch_total 0
      set chinook_catch_total 0
end

to dip_day>1
        ;;if the catch that the dipnetters get is between 1 and 2 sd greater than the mean, increase happiness.
      let daily_catch catch_total / dipnetters/agent  ;;get the number of fish caught by each individual dipnetter in an agent.
      ;;next, check to see if the total was above or below the mean, and adjust the happiness value accordingly.
      let sight dipnet_vision * 16 ;;convert to patches from mi.
      ifelse count other dipnetters in-radius sight >= 1
        [
          ;;All of following eqn will include local mean happiness since always > 0
          let hl mean [ catch_total ] of other dipnetters in-radius sight
          ifelse hl > 0
          [
            let hp previous_harvest
            ifelse hp > 0
            [
             let hk dip_avg
             let m motivation
             let j happiness
             let g mean [ happiness ] of other dipnetters in-radius sight
             let h catch_total
             let d days_fished
             set happiness (((( h / hl ) + ( h / hk ) + ( h / hp )) / 3) + m )  * g * ( ( 7 / ( d + 6.75 ) ) ) * j
             if happiness > 1 [ set happiness 1 ]
              ;;put the full eqn in here
            ]
            [
              let hk dip_avg
              let m motivation
              let j happiness
              let g mean [ happiness ] of other dipnetters in-radius sight
              let h catch_total
              let d days_fished
              set happiness (((( h / hl ) + ( h / hk ) ) / 2) + m )  * g * ( ( 7 / ( d + 6.75 ) ) ) * j
              if happiness > 1 [ set happiness 1 ]
              ;;put in the eqn without previous harvest here.
            ]
          ]
          [
            let hp previous_harvest
            ifelse hp > 0
            [
              let hk dip_avg
              let m motivation
              let j happiness
              let g mean [ happiness ] of other dipnetters in-radius sight
              let h catch_total
              let d days_fished
              set happiness ((( ( h / hk ) + ( h / hp )) / 2) + m )  * g * ( ( 7 / ( d + 6.75 ) ) ) * j
              if happiness > 1 [ set happiness 1 ]
              ;;eqn without local mean harvest goes here.
            ]
            [
              let hk dip_avg
              let m motivation
              let j happiness
              let g mean [ happiness ] of other dipnetters in-radius sight
              let h catch_total
              let d days_fished
              set happiness ((( ( h / hk ) ) / 1) + m )  * g * ( ( 7 / ( d + 6.75 ) ) ) * j
              if happiness > 1 [ set happiness 1 ]
              ;;eqn without local mean harvest or previous harvest goes here.
            ]
          ]
        ]
        [
          ;;no local harvest or mean happiness
          let hp previous_harvest
          ifelse hp > 0
            [
              let hk dip_avg
              let m motivation
              let j happiness
              let h catch_total
              let d days_fished
              set happiness ((( ( h / hk ) + ( h / hp )) / 2) + m )  * ( ( 7 / ( d + 6.75 ) ) ) * j
              if happiness > 1 [ set happiness 1 ]
              ;;eqn without local mean
            ]
            [
              let hk dip_avg
              let m motivation
              let j happiness
              let h catch_total
              let d days_fished
              set happiness ((( ( h / hk ) ) / 1) + m )  * ( ( 7 / ( d + 6.75 ) ) ) * j
              if happiness > 1 [ set happiness 1 ]
              ;;eqn without local mean or previous harvest
            ]
        ]

      if limit? = true [
        if days_fished = 1 [ set day1 day1 + 1 ]
        if days_fished = 2 [ set day2 day2 + 1 ]
        if days_fished = 3 [ set day3 day3 + 1 ]
        if days_fished = 4 [ set day4 day4 + 1 ]
        if days_fished = 5 [ set day5 day5 + 1 ]
        if days_fished = 6 [ set day6 day6 + 1 ]
        if days_fished = 7 [ set day7 day7 + 1 ]
        set season_total_list lput season_total season_total_list
        set dip_king_har_list lput chinook_season_total dip_king_har_list
        ;;remove any links, eg. the circle that they carry with them.
        ask out-link-neighbors [ die ]
        ask my-out-links [ die ]
        die
        ]

      ifelse happiness > happiness-threshold
      [
        ifelse count dipnetters in-radius sight >= 1
        [
          let l mean [ catch_total ] of dipnetters in-radius sight
          let h catch_total
          let k dip_avg
          let p previous_harvest
          ifelse p = 0
          [
            ifelse l = 0
            [
              if (h / k) < 1 [ move-to one-of patches with [ dipnet_zone? = true ] ]
            ]
            [
              if (h / k) < 1 and (h / l) < 1 [ move-to one-of patches with [ dipnet_zone? = true ] ]
            ]
          ]
          [
            ifelse l = 0
            [
              if (h / k) < 1 and (h / p) < 1 [ move-to one-of patches with [ dipnet_zone? = true ] ]
            ]
            [
              if ((h / k) < 1 and ((h / l) < 1 or (h / p) < 1)) or ( (h / l) < 1 and ( (h / k) < 1 or (h / p) < 1 ) ) or ( (h / p) < 1 and ( (h / k) < 1 or (h / l) < 1 ) ) [ move-to one-of patches with [ dipnet_zone? = true ] ]
            ]
          ]
        ]
        [
          let h catch_total
          let k dip_avg
          let p previous_harvest
          ifelse p = 0
          [
            if (h / k) < 1 [ move-to one-of patches with [ dipnet_zone? = true ] ]
          ]
          [
            if (h / k) < 1 and (h / p) < 1 [ move-to one-of patches with [ dipnet_zone? = true ] ]
          ]
        ]
      ]
      [
        if season_total = 0 [
             set list_failed_dipnetters lput season_total list_failed_dipnetters ;;add their season total to the list of failed dipnetters. The length of this list gives us the count of failed dipnetters.
           ]
        if days_fished = 1 [ set day1 day1 + 1 ]
        if days_fished = 2 [ set day2 day2 + 1 ]
        if days_fished = 3 [ set day3 day3 + 1 ]
        if days_fished = 4 [ set day4 day4 + 1 ]
        if days_fished = 5 [ set day5 day5 + 1 ]
        if days_fished = 6 [ set day6 day6 + 1 ]
        if days_fished = 7 [ set day7 day7 + 1 ]
        set season_total_list lput season_total season_total_list
        set dip_king_har_list lput chinook_season_total dip_king_har_list
        ;;remove any links, eg. the circle that they carry with them.
        ask out-link-neighbors [ die ]
        ask my-out-links [ die ]
        die
      ]
      ;;if the random number that was first calculated is less than the composite happiness and motivation, re-roll the random number. The dipnetter stays in the world for now.
      ;;As a dipnetters happiness and motivation score composite to a low value, the chance that they will leave becomes greater and greater. Simultaneously, as this value gets lower and lower,
      ;;if they do end up staying, the chance that they will move gets higher and higher.

      set days_fished days_fished + 1
      set previous_harvest catch_total
      set catch_total 0
      set chinook_catch_total 0
end


to drift_har_expectations
  ;;Establish drift gillnet harvest expectations randomly among drift gillnet agents based on historical data from 2005-2014 regarding harvest / delivery.
  ;;Data can be found in processed_drift_effort_binned_by_week.csv
  ;;The expected harvest for drift gillnetters is restricted to vary within one standard deviation due to the great amount of variability in the data.
  ;;Expected harvest is also restricted from becoming negative in cases where the variability is large enough that expected harvest could be negative from the random normal distribution.
  let avg_har [ 36.70732143 56.26248902 152.0856387205  312.225162749  278.0251038999  102.7349296914  33.7103581553 6.4349687653  3.3007969508 ]
  let sd_har [ 33.67417342 48.69245112 112.588095777  201.8663808096  174.1555251865  59.8407496903  19.0176102034  11.1290414687  3.3564781799 ]

  let avg item (comm-week - 1) avg_har
  let sd item (comm-week - 1) sd_har

  set expectation random-normal avg sd

  while [ expectation < 0 or expectation > avg + sd or expectation < avg - sd ] [ set expectation random-normal avg sd ]
end

to drift_relocation
  ;;This procedure will have to be set gillnet specific. Create another one for the drag gillnetters.
  ;let m motivation
  let sight 8 ;Range for definition of local.
  let Hp previous_harvest ;Hp is the previos fishing days harvest for comparison with the current day.
  let h catch_total ;current daily harvest.
  let He catch_total / drift_scale ;;catch_total is the total number of sockeye harvested by all the gillnetters of one agent. Therefore you have to find the catch per one gillnetter
  ;;when comparing to expected value since expected value is based on catch per single gillnetter.
  drift_har_expectations

  set gillnet_tracker gillnet_tracker + 1
  ;set fished? true

  ifelse sum days_open_ken >= 1
  [
   ifelse count other gillnetters with [ fishing_allowed? = true ] in-radius sight >= 1
  ;First ifelse construct for determining if local harvest of other fishermen should be factored in.
    [ let Hl mean [ catch_total ] of other gillnetters with [ fishing_allowed? = true ] in-radius sight
      ifelse Hl > 0 ;Now that there are other fishermen in range, check to see if we need to even factor in their harvest or if they caught nothing.
        [ ifelse Hp = 0 ;Was your previous harvest nilch? if so, only worry about whether or not you beet the local harvest and your expected harvest.
          [ if (He / expectation) < 1 and (h / Hl) < 1 ;If you didn't beat those values, move to a new location.
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true ] ]]]
        ;factor in previous harvest now for this scenario. At least two have to be less than what the fisherman wanted in order to move locations.
          [ if ((He / expectation) < 1 and ((h / Hl) < 1 or (h / Hp) < 1)) or ( (h / Hl) < 1 and ( (h / expectation) < 1 or (h / Hp) < 1 ) ) or ( (h / Hp) < 1 and ( (h / expectation) < 1 or (h / Hl) < 1 ) )
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true ] ]]]]
        [ ifelse Hp = 0 ;both local harvest is not a factor and check to see if previous harvest is also.
          [ if (He / expectation) < 1
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true ] ]]]
          [ if (He / expectation) < 1 and (h / Hp) < 1
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true  and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true ] ]]]]]
    [ ifelse Hp = 0 ;local harvest is completely out of the picture due to no one nearby. Only worry about expected and previous harvest.
      [ if (He / expectation) < 1 [
        ifelse count setnetters with [ fishing_allowed? = true ] >= 1
          [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true  and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ]]
          [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true ] ]]]
      [ if (He / expectation) < 1 and (h / Hp) < 1
        [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
          [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true  and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
          [ move-to one-of patches with [ (node# = 98 or node# = 97) and deep_water_zone? = true ] ]]]]

    ]

  [

       ifelse count other gillnetters with [ fishing_allowed? = true ] in-radius sight >= 1
  ;First ifelse construct for determining if local harvest of other fishermen should be factored in.
    [ let Hl mean [ catch_total ] of other gillnetters with [ fishing_allowed? = true ] in-radius sight
      ifelse Hl > 0 ;Now that there are other fishermen in range, check to see if we need to even factor in their harvest or if they caught nothing.
        [ ifelse Hp = 0 ;Was your previous harvest nilch? if so, only worry about whether or not you beet the local harvest and your expected harvest.
          [ if (He / expectation) < 1 and (h / Hl) < 1 ;If you didn't beat those values, move to a new location.
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ (node# = 98) and deep_water_zone? = true and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ (node# = 98) and deep_water_zone? = true ] ]]]
        ;factor in previous harvest now for this scenario. At least two have to be less than what the fisherman wanted in order to move locations.
          [ if ((He / expectation) < 1 and ((h / Hl) < 1 or (h / Hp) < 1)) or ( (h / Hl) < 1 and ( (h / expectation) < 1 or (h / Hp) < 1 ) ) or ( (h / Hp) < 1 and ( (h / expectation) < 1 or (h / Hl) < 1 ) )
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ (node# = 98 ) and deep_water_zone? = true and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ (node# = 98 ) and deep_water_zone? = true ] ]]]]
        [ ifelse Hp = 0 ;both local harvest is not a factor and check to see if previous harvest is also.
          [ if (He / expectation) < 1
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ (node# = 98) and deep_water_zone? = true and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ (node# = 98) and deep_water_zone? = true ] ]]]
          [ if (He / expectation) < 1 and (h / Hp) < 1
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ (node# = 98) and deep_water_zone? = true  and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ (node# = 98) and deep_water_zone? = true ] ]]]]]
    [ ifelse Hp = 0 ;local harvest is completely out of the picture due to no one nearby. Only worry about expected and previous harvest.
      [ if (He / expectation) < 1 [
        ifelse count setnetters with [ fishing_allowed? = true ] >= 1
          [ move-to one-of patches with [ (node# = 98) and deep_water_zone? = true  and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ]]
          [ move-to one-of patches with [ (node# = 98) and deep_water_zone? = true ] ]]]
      [ if (He / expectation) < 1 and (h / Hp) < 1
        [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
          [ move-to one-of patches with [ (node# = 98) and deep_water_zone? = true  and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
          [ move-to one-of patches with [ (node# = 98) and deep_water_zone? = true ] ]]]]

  ]

  set catch_total 0
  set chinook_catch_total 0
end

to set_har_expectations
  let avg_har [ 59.09764586 63.13989793 57.86039126  141.204052  314.2123347  188.2063947  103.761783  62.44012529  17.05378137 ]
  let sd_har [ 11.51112594 29.98570769 26.03590963  117.6041823  163.6787514  104.5197369  50.62423316  44.69816406  10.98301036 ]

  let avg item (comm-week - 1) avg_har
  let sd item (comm-week - 1) sd_har

  set expectation random-normal avg sd

  while [ expectation < 0 or expectation > avg + sd or expectation < avg - sd ] [ set expectation random-normal avg sd ]

end

to set_relocation
    ;;This procedure will have to be set gillnet specific. Create another one for the drag gillnetters.
  ;let m motivation
  let sight 8 ;Range for definition of local.
  let Hp previous_harvest ;Hp is the previos fishing days harvest for comparison with the current day.
  let h catch_total ;current daily harvest.
  let He catch_total / set_scale ;;catch_total is the total number of sockeye harvested by all the gillnetters of one agent. Therefore you have to find the catch per one gillnetter
  ;;when comparing to expected value since expected value is based on catch per single gillnetter.
  set_har_expectations

  set setnet_tracker setnet_tracker + 1
  set fishing_allowed? true
  ifelse count other setnetters with [ fishing_allowed? = true ] in-radius sight >= 1
  ;First ifelse construct for determining if local harvest of other fishermen should be factored in.
    [ let Hl mean [ catch_total ] of other setnetters with [ fishing_allowed? = true ] in-radius sight
      ifelse Hl > 0 ;Now that there are other fishermen in range, check to see if we need to even factor in their harvest or if they caught nothing.
        [ ifelse Hp = 0 ;Was your previous harvest nilch? if so, only worry about whether or not you beet the local harvest and your expected harvest.
          [ if (He / expectation) < 1 and (h / Hl) < 1 ;If you didn't beat those values, move to a new location.
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished ] ]]]
        ;factor in previous harvest now for this scenario. At least two have to be less than what the fisherman wanted in order to move locations.
          [ if ((He / expectation) < 1 and ((h / Hl) < 1 or (h / Hp) < 1)) or ( (h / Hl) < 1 and ( (h / expectation) < 1 or (h / Hp) < 1 ) ) or ( (h / Hp) < 1 and ( (h / expectation) < 1 or (h / Hl) < 1 ) )
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished ] ]]]]
        [ ifelse Hp = 0 ;both local harvest is not a factor and check to see if previous harvest is also.
          [ if (He / expectation) < 1
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished ] ]]]
          [ if (He / expectation) < 1 and (h / Hp) < 1
            [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
              [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
              [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished ] ]]]]]
    [ ifelse Hp = 0 ;local harvest is completely out of the picture due to no one nearby. Only worry about expected and previous harvest.
      [ if (He / expectation) < 1 [
        ifelse count setnetters with [ fishing_allowed? = true ] >= 1
          [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ]]
          [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished ] ]]]
      [ if (He / expectation) < 1 and (h / Hp) < 1
        [ ifelse count setnetters with [ fishing_allowed? = true ] >= 1
          [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished and distance min-one-of setnetters with [fishing_allowed? = true] [distance myself] >= 2 ] ]
          [ move-to one-of patches with [ node# = 97 and distance min-one-of shoreline [distance myself] <= commercial_radius_fished ] ]]]]

  set catch_total 0
  set chinook_catch_total 0
end

to create_fish_mkII
  set sockeye_accumulator sockeye_accumulator + ((sockeye_daily_run * (time_scale / 1440) ) / sockeye/agent)
  if sockeye_accumulator >= 1 [
    create-sockeyes round sockeye_accumulator
    [
      set color black  ;; random shades look nice
      set size 1  ;; easier to see
     ; let x random 3
     ; if x = 0 [ move-to one-of patches with [ ocean? = true and (pycor = min-pycor) ] ]
     ; if x = 1 [ move-to one-of patches with [ ocean? = true and (pxcor = min-pxcor) ] ]
     ; if x = 2 [ move-to one-of patches with [ ocean? = true and (pxcor = min-pxcor) ] ]
     set patch-sel round (random-normal 0 (max-pxcor / 2))
     while [ patch-sel > max-pxcor or patch-sel < min-pxcor ] [ set patch-sel round (random-normal 0 (max-pxcor / 3)) ]
     carefully
     [ move-to one-of patches with [ ocean? = true and (pycor = min-pycor and pxcor = patch-sel)] ]
     [ move-to one-of patches with [ ocean? = true and pycor = min-pycor] ]
      set stream# one-of [spring#] of patches with [ spring# > 0 ]
      set hitpoints 50 + random 51
      set sonar1 false
      set speed random-normal 2.2 0.2 ;;see Kintama paper for reference. Double check to make sure it checks out, if not, cite the appropriate reference.
      set #fish sockeye/agent
      set open? false
      ; hatch (amount_turtles - 1)
      ; [
      ;   set heading random 360
      ;   set size 1 ]
    ]
      set sockeye_accumulator sockeye_accumulator - round sockeye_accumulator
  ]

  set chinook_accumulator chinook_accumulator + ((chinook_daily_run * (time_scale / 1440) ) / chinook/agent)
  if chinook_accumulator >= 1 [
    create-chinooks round chinook_accumulator
    [
      set color yellow  ;; random shades look nice
      set size 1  ;; easier to see
      let x random 3
      if x = 0 [ move-to one-of patches with [ ocean? = true and (pycor = min-pycor) ] ]
      if x = 1 [ move-to one-of patches with [ ocean? = true and (pxcor = min [pxcor] of patches with [ pycor = min-pycor and ocean? = true ]) ] ]
      if x = 2 [ move-to one-of patches with [ ocean? = true and (pxcor = max [pxcor] of patches with [ pycor = min-pycor and ocean? = true ]) ] ]
      set stream# one-of [spring#] of patches with [ spring# > 0 ]
      set hitpoints 50 + random 51
      set sonar1 false
      set speed random-normal 2.2 0.2 ;;see Kintama paper for reference. Double check to make sure it checks out, if not, cite the appropriate reference.
      set #fish chinook/agent
      set open? false
      ; hatch (amount_turtles - 1)
      ; [
      ;   set heading random 360
      ;   set size 1 ]
    ]
      set chinook_accumulator chinook_accumulator - round chinook_accumulator
  ]
end

to determine_drift_effort
  ;First week is shortened and goes from 19-Jun - 23-Jun. Second week picks up on 24-Jun and continues normally.
   let drift_avg_del [ 66.4 106.5714286 230.8571429 345.2857143 312.1428571 229.4285714 121.6428571 44.57142857 13.85714286 5.071428571 3.714285714 2.428571429 ]
   let drift_sd_del [ 71.19550548 93.02483027 161.1815008  76.36909123  143.5849674  100.2278357  118.8008538  51.39992588  15.50729475  3.493190655  3.401680257  2.439750182 ]
   let drift_avg ( item ( comm-week - 1 ) drift_avg_del )
   let drift_sd ( item ( comm-week - 1 ) drift_sd_del )

   set drift_eff random-normal drift_avg drift_sd
   while [ drift_eff < drift_avg - drift_sd or drift_eff > drift_avg + drift_sd ]
   [ set drift_eff random-normal drift_avg drift_sd ]
   if drift_eff > total-drift-permits [ set drift_eff total-drift-permits ]
   if drift_eff < 0 [ set drift_eff 0 ]
end

to determine_set_gillnet_effort

  ;week one starts on 19-Jun. Week two starts on 24-Jun and continues regularly.
  let avg_eff [ 0.318193064 0.362378464 0.321076372 0.527537898 1 0.643151906 0.385190434 0.222862637 0.075070719 ]
  let sd_eff [ 0.026441037 0.108097539 0.09514191 0.261601609 0.298269093 0.229117218 0.14900957 0.108608925 0.030343998 ]

  let avg_eff2 [0.477289596 0.543567696 0.481614558 0.791306846 1 0.964727859 0.577785651 0.334293956 0.112606078]


  let set_eff_avg ( item ( comm-week - 1 ) avg_eff2 ) ;;trying doubling of set gillnet effort distribution before modification of catch chance. Permit days fished should be similar, actual effort different.
  let set_eff_sd ( item ( comm-week - 1 ) sd_eff )

  set set_eff random-normal set_eff_avg set_eff_sd

  while [ set_eff < ( set_eff_avg - set_eff_sd ) or set_eff > 1 ] [ set set_eff random-normal set_eff_avg set_eff_sd ]

  set set_fished ceiling (total-set-permits * set_eff) + set_eff_adj
  if set_fished > total-set-permits [ set set_fished total-set-permits ]
end

to move_fish
  let x max [pycor] of patches with [ riverMouth? = true ] + 24
  ;let fishermen turtles with [ fisherman? = true and fished? = true and open? = true and limit? = false ]

  repeat 1
  [ ask chinooks [ go-uphill-chinooks ]
    ;calc_patch_prob
    ask sockeyes [ go_uphill_vision ] ;set catch_chance random-float 100
    ask sockeyes
    [; let y ([ycor] of self)
      if ycor > x and sonar1 = false
      [ set sonar1 true
        set sockeye_sonar sockeye_sonar + #fish
        ; set escaped_sockeye escaped_sockeye + 1
      ]
      ;if ycor > ( x + 16 ) [ die ]
       ]

    ask chinooks
    [; let y ([ycor] of self)
      if ycor > x and sonar1 = false
      [ set sonar1 true
        set chinook_sonar chinook_sonar + #fish
        ; set escaped_sockeye escaped_sockeye + 1
      ]
      ;if ycor > ( x + 16 ) [ die ]
      ]

    ]



  repeat 1
  [ ;calc_patch_prob
    school

    ask sockeyes
    [ if ycor > x and sonar1 = false
      [ set sonar1 true
        set sockeye_sonar sockeye_sonar + #fish
      ];  set escaped_sockeye escaped_sockeye + 1 ]
    ;if ycor > ( x + 16 ) [ die ]
    ]

    ask chinooks
    [; let y ([ycor] of self)
      if ycor > x and sonar1 = false
      [ set sonar1 true
        set chinook_sonar chinook_sonar + #fish
        ; set escaped_sockeye escaped_sockeye + 1
      ]
      ;if ycor > ( x + 16 ) [ die ]
      ]

  ]



  ask sockeyes [ set catch_chance (1 + random 10000) / 10000 ]
  ask chinooks [ set catch_chance (1 + random 10000) / 10000 ]
  indiv_red_harvest
  ask gillnetters [
    set sock_list [who] of sockeyes in-radius commercial_radius_fished
    set chin_list [who] of chinooks in-radius commercial_radius_fished ]

  ask setnetters [
    set sock_list [who] of sockeyes in-radius commercial_radius_fished
    set chin_list [who] of chinooks in-radius commercial_radius_fished ]

  ask dipnetters [
    set sock_list [who] of sockeyes in-radius dipnet_radius_fished
    set chin_list [who] of chinooks in-radius dipnet_radius_fished ]

end

to indiv_red_harvest
  ;;Adjustment for different depths of migration in catch chance takes place in this harvest procedure.
  ask turtles with [ open? = true and limit? = false ]
  [


     ;-----------------------------------
    ifelse [ ocean? ] of patch-here = true
    [
      let roll (1 + random 100) / 100
      if roll <= sock_mod
      [
        let chance surface% * sockeye_adj_factor
        let harvest sum [ #fish ] of sockeyes in-radius ( netsize / 2) with [ catch_chance <= chance and member? who [sock_list] of myself != true ]
        ask sockeyes in-radius ( netsize / 2) with [ catch_chance <= chance and member? who [sock_list] of myself != true ]
        [
          hatch-deathspots 1 ;;A death spot marker.
          [ set color black
            set hitpoints 1
            set netted? true
            set open? false]
          die

        ]
        set catch_total catch_total + harvest
        set season_total season_total + harvest
        set sockeye_harvest sockeye_harvest + harvest
      ]
      ;;This portion is for harvesting of chinook salmon.
      set roll (1 + random 100) / 100
      if chinook_limit? = false and roll <= chin_mod
      [ let chance surface% * chinook_adj_factor
      let harvest sum [ #fish ] of chinooks in-radius ( netsize / 2) with [ catch_chance <= chance and member? who [chin_list] of myself != true ]
      ask chinooks in-radius ( netsize / 2) with [ catch_chance <= chance and member? who [chin_list] of myself != true ]
      [
        hatch-deathspots 1 ;;A death spot marker.
        [ set color black
          set hitpoints 1
          set netted? true
          set open? false ]
      die

      ]
      set chinook_catch_total chinook_catch_total + harvest
      set chinook_season_total chinook_season_total + harvest
      set chinook_harvest chinook_harvest + harvest ]
    ]
    [
      ;let roll (1 + random 100) / 100
      ;if roll <= sock_mod
      ;[
        let chance surface% * sockeye_adj_factor
        let harvest sum [ #fish ] of sockeyes in-radius ( netsize / 2) with [ catch_chance <= chance and member? who [sock_list] of myself != true ]
        ask sockeyes in-radius ( netsize / 2) with [ catch_chance <= chance and member? who [sock_list] of myself != true ]
        [
          hatch-deathspots 1 ;;A death spot marker.
          [ set color black
            set hitpoints 1
            set netted? true
            set open? false ]
      die
        ]
        set catch_total catch_total + harvest
        set season_total season_total + harvest
        set sockeye_harvest sockeye_harvest + harvest
      ;]

      ;;Portion for harvesting of chinook salmon.
      ;set roll (1 + random 100) / 100
      if chinook_limit? = false ;and roll <= chin_mod
      [ set chance surface% * chinook_adj_factor ;* ( chinook/agent / sockeye/agent )
      set harvest sum [ #fish ] of chinooks in-radius ( netsize / 2) with [ catch_chance <= chance and member? who [chin_list] of myself != true ]
      ask chinooks in-radius ( netsize / 2) with [ catch_chance <= chance and member? who [chin_list] of myself != true ]
      [
        hatch-deathspots 1 ;;A death spot marker.
        [ set color black
          set hitpoints 1
          set netted? true
          set open? false ]
      die
      ]
      set chinook_catch_total chinook_catch_total + harvest
      set chinook_season_total chinook_season_total + harvest
      set chinook_harvest chinook_harvest + harvest ]
    ]

    ;-------------------
  ]
end


to check_dip_limit
  ask dipnetters
  [ if season_total = dipnetters/agent * 25 + ( ( household_size - 1 ) * 10 )
    [ set limit? true ] ;;they've reached the limit with no overflow.
    if chinook_season_total = dipnetters/agent * 1
    [ set chinook_limit? true ]


    if season_total > dipnetters/agent * 25 + ( ( household_size - 1 ) * 10 )  ;;if the catch total of an agent is more than the 25 per dipnetter limit, you've reached the agent's limit.
    [ set limit? true
      let overflow season_total - ( dipnetters/agent * 25 + ( ( household_size - 1 ) * 10 ) )
      set season_total season_total - overflow
      let x xcor
      let y ycor
      ask patch x y
      [ sprout-sockeyes 1
        [
          set #fish overflow
          set open? false
          set color red  ;; random shades look nice
          set size 1  ;; easier to see
          set stream# one-of [spring#] of patches with [ spring# > 0 ]
          set hitpoints 50 + random 51
          set sonar1 false
          set speed random-normal 2.2 0.2 ;;see Kintama paper for reference. Double check to make sure it checks out, if not, cite the appropriate reference.
          ] ] ]

    if chinook_season_total > dipnetters/agent * 1
    [ set chinook_limit? true
      let overflow chinook_season_total - ( dipnetters/agent * 1)
      set chinook_season_total chinook_season_total - overflow
      let x xcor
      let y ycor
      ask patch x y
      [ sprout-chinooks 1
        [
          set #fish overflow
          set open? false
          set color red  ;; random shades look nice
          set size 1  ;; easier to see
          set stream# one-of [spring#] of patches with [ spring# > 0 ]
          set hitpoints 50 + random 51
          set sonar1 false
          set speed random-normal 2.2 0.2 ;;see Kintama paper for reference. Double check to make sure it checks out, if not, cite the appropriate reference.
          ] ] ]


  ]

end

to go-uphill-chinooks
  ;set catch_chance random 100
  let item# stream#
  let random_target neighbors with [ ocean? = true or river? = true ]
  let listNeighbors random_target with [ item item# chinook_list >  [item item# chinook_list] of myself ]
  let ycor_neighbors neighbors with [(ocean? = true or river? = true) and pycor > [ycor] of myself ]
  ;neighbors with [ (ocean? = true or river? = true) and item ([ stream# ] of myself) sockeye_list >  [item stream# sockeye_list] of myself ]
  ifelse [ node# ] of patch-here != 97 and [ node# ] of patch-here != 98
  [ set dist-trav  ((( 0.2 * 2 / 3 ) * speed / 2.60) ) ]
  [ set dist-trav  ((( 0.1 * 2 / 3 ) * speed / 2.60) ) ]
    ifelse [ deep_water_zone? ] of patch-here = true [
      ifelse any? ycor_neighbors
      [ face one-of ycor_neighbors
        ifelse ( [ocean?] of patch-ahead dist-trav = true ) or ([ river? ] of patch-ahead dist-trav = true )
        [ fd dist-trav ] [ adjust_heading ] ;] [ ]
         ]
      [
        ifelse heading >= 0 and heading < 180 [ adj_l ] [ adj_r ]
         ]
     ; set heading heading + random flock-wiggle - random flock-wiggle
      ;carefully [

      display
    ]
    [

      ifelse any? listNeighbors
        [
          ifelse [ item item# chinook_list ] of patch-here = 0 ;or [ cross_zone? ] of patch-here = true
          [
            vision_test
          ]
          [
            face one-of listNeighbors ;[ item item# attractant-list ] ;MaxUphillOceanArea
          ;  set heading heading + random flock-wiggle - random flock-wiggle
            ;carefully [
             ifelse ( [ocean?] of patch-ahead dist-trav = true ) or ([ river? ] of patch-ahead dist-trav = true )
              [ fd dist-trav ] [ adjust_heading ];] [ ]
            display
          ]
        ]
        [
          vision_test
        ];] ;]
         ;]
    ]
end

to go_uphill_vision
  ;set catch_chance random 100
  let item# stream#
  let random_target neighbors with [ ocean? = true or river? = true ]
  let listNeighbors random_target with [ item item# sockeye_list >  [item item# sockeye_list] of myself ]
  let ycor_neighbors neighbors with [(ocean? = true or river? = true) and pycor > [ycor] of myself ]
  ifelse [ node# ] of patch-here != 97 and [ node# ] of patch-here != 98
  [ set dist-trav  ((( 0.2 * 2 / 3 ) * speed / 2.60) ) ]
  [ set dist-trav  ((( 0.1 * 2 / 3 ) * speed / 2.60) ) ]
  ;neighbors with [ (ocean? = true or river? = true) and item ([ stream# ] of myself) sockeye_list >  [item stream# sockeye_list] of myself ]
    ifelse [ deep_water_zone? ] of patch-here = true [
      ifelse any? ycor_neighbors
      [ face one-of ycor_neighbors
        ifelse ( [ocean?] of patch-ahead (dist-trav ) = true ) or ([ river? ] of patch-ahead (dist-trav ) = true )
        [ fd dist-trav ] [ adjust_heading ] ;] [ ]
         ]
      [
        ifelse heading >= 0 and heading < 180 [ adj_l ] [ adj_r ]
         ]
     ; set heading heading + random flock-wiggle - random flock-wiggle
      ;carefully [

      display
    ]
    [

      ifelse any? listNeighbors
        [
          ifelse [ item item# sockeye_list ] of patch-here = 0 ;or [ cross_zone? ] of patch-here = true
          [
            vision_test
          ]
          [
            face one-of listNeighbors ;[ item item# attractant-list ] ;MaxUphillOceanArea
          ;  set heading heading + random flock-wiggle - random flock-wiggle
            ;carefully [
             ifelse ( [ocean?] of patch-ahead (dist-trav ) = true ) or ([ river? ] of patch-ahead (dist-trav ) = true )
              [ fd dist-trav ] [ adjust_heading ];] [ ]
            display
          ]
        ]
        [
          vision_test
        ];] ;]
         ;]
    ]
end

;carefully

to adj_r
  carefully [
  loop [
  set heading heading + 5
  if ( [ocean?] of patch-ahead dist-trav = true ) or ([ river? ] of patch-ahead dist-trav = true )
  [ fd dist-trav stop ] ] ] [ stop ]
end

to adj_l
  carefully [
  loop [
  set heading heading - 5
  if ( [ocean?] of patch-ahead dist-trav = true ) or ([ river? ] of patch-ahead dist-trav = true )
  [ fd dist-trav stop ] ] ] [ stop ]
end

to vision_test
  let vision_radius 6
  let item# stream#
  let greatest max-one-of patches in-radius vision_radius [ item item# sockeye_list ]
  let targets  ([ neighbors ] of greatest) with [ item item# sockeye_list > 0 ]

  ;ifelse any? greatest
   ifelse any? targets ;[
    [
      face one-of targets ;[ item item# attractant-list ] ;MaxUphillOceanArea
     ; set heading heading + random flock-wiggle - random flock-wiggle
      ;carefully [
         ifelse ( [ocean?] of patch-ahead (dist-trav * 1) = true ) or ([ river? ] of patch-ahead (dist-trav * 1) = true )
          [ fd dist-trav ] [ adjust_heading ] ;] [ ]
      display
    ]
    [
      face greatest ;[ item item# attractant-list ] ;MaxUphillOceanArea
     ; set heading heading + random flock-wiggle - random flock-wiggle
     ; carefully [
         ifelse ( [ocean?] of patch-ahead (dist-trav * 1) = true )  or ([ river? ] of patch-ahead (dist-trav * 1) = true )
          [ fd dist-trav ] [ adjust_heading ] ;] [ ]
      display
    ] ;]
  ;[ print "I can't find any patches in my vision!" ]
end


to school
  ask sockeyes
  [ ;set catch_chance random-float 100
    ;;The increased speed where the dipnetters fish is supposed to replicate the faster speed at the river mouth of the salmon.
    ifelse [ node# ] of patch-here != 97 and [ node# ] of patch-here != 98
    [ set dist-trav  ((( 0.2 * 2 / 3 ) * speed / 2.60) ) ]
    [ set dist-trav  ((( 0.1 * 2 / 3 ) * speed / 2.60) ) ]
    flock
    carefully [
      if ( [ocean?] of patch-ahead (dist-trav * 4)= true ) or ([ river? ] of patch-ahead (dist-trav * 4) = true )
      [ fd dist-trav * 4 ] ] [ ] ]
  ;display
  ask chinooks
  [ ;set catch_chance random-float 100
    ifelse [ node# ] of patch-here != 97 and [ node# ] of patch-here != 98
    [ set dist-trav  ((( 0.2 * 2 / 3 ) * speed / 2.60) ) ]
    [ set dist-trav  ((( 0.1 * 2 / 3 ) * speed / 2.60) ) ]
    flock
    carefully [
      if ( [ocean?] of patch-ahead (dist-trav * 4) = true or [ river? ] of patch-ahead (dist-trav * 4) = true )
      [ fd dist-trav * 4 ] ] [ ] ]
  ;display
end


to check-life
  set-default-shape deathspots "x"
  ask sockeyes
  [ ifelse hitpoints <= 0
    [ hatch-deathspots 1
      [ set color black
        set hitpoints 20
        set died? true
        set open? false]
        ;set escaped_sockeye escaped_sockeye + 1 ]
      die ]

    [ if [node#] of patch-here < 1
      [ set hitpoints hitpoints - (0.05 / 6) ]
    if [node#] of patch-here = 1
    [ set hitpoints hitpoints - (0.10 / 6) ]
    if [node#] of patch-here > 1
    [  set hitpoints hitpoints - (0.25 / 6) ] ]

  if [river-patch#] of patch-here = stream#
  [ ifelse [river-patch#] of patch-here > 1
  [ hatch-deathspots 1
    [ set color black
      set hitpoints 20
      set died? true
      set open? false]
      ;set escaped_sockeye escaped_sockeye + 1 ]
    die ]
  [ if [pycor] of patch-here > ( max-pycor / 2 )
    [ hatch-deathspots 1
    [ set color black
      set hitpoints 20
      set died? true
      set open? false]
      ;set escaped_sockeye escaped_sockeye + 1 ]
    die ] ] ]
   ]
  ask deathspots [
    set hitpoints hitpoints - 1
    if hitpoints <= 0 [ die ] ]
end

to make-radius-circle
  ;let radius netsize
  let rad netsize  ;radius
  hatch-radius-circles 1
  [ set size rad
    set shape "thin circle"
    set color lput 64 extract-rgb color
    __set-line-thickness 0.3
    create-effectof-from myself
    [ tie       hide-link ] ]
end

to sphere_depth
  ;; turn this into code for a depth assigning sphere.
  ;; After turtles draw out a river, spawn another turtle that follows it downhill ( after adjusting elevation ). This turtle will add in depth via the bottom half of a sphere.
  ;; If another turtle goes downhill after the first depth assigning due to another river, should work out very well. This is because this second turtle will be spreading depth
  ;; into patches which have lowered their elevation again.
  ;; have turtles assign depth to the main river too. Once turtles reach the point where ocean should spawn, have them die. Also, don't let them ask patches below that point
  ;; to set depth.

  ask depth_adders [
    let rad 0.5
    loop
    [
      ;let floated-elevation elevation + rad ;;push the turtles up into the air by the radius emitted from the going into the ground.
      let patch# [river-patch#] of patch-here
      let hillSize rad;temp - ( [ elevation ] of patch-here )  ; hillRadius ;; move this to generation part of river --> don't want to be continually changing the radius.
      let hillycor ycor ;; base coordinates of the turtle for assigning depth.
      let hillxcor xcor
      ask patches in-radius hillSize with [ node# != 1 ];and river-patch# = 0]
      [ set depthAdder ((hillSize ^ 2) - (((pxcor - hillxcor) ^ 2) + ((pycor - hillycor) ^ 2)))
        set depth depthAdder
        set pcolor blue
        set river? true
        set river-patch# patch#] ;]
      flow
      if rad <= 2 [
        set rad rad + 0.025 ]
      ;if rad >= 4 [ set rad 4 ]
      if ( [node#] of patch-here = 1 or [ count neighbors with [ node# = 2 ] = 1 ] of patch-here ) [ ask patches in-radius 8 [ set pre_cross? true ] die stop] ] ]

end

;; Model based in part on Flocking model by Uri Wilensky, built in 1998.

; Copyright 1998 Uri Wilensky.
; See Info tab for full copyright and license.
@#$#@#$#@
GRAPHICS-WINDOW
368
10
800
463
64
64
3.27132
1
10
1
1
1
0
0
0
1
-64
64
-64
64
1
1
1
ticks
30.0

BUTTON
114
10
180
43
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
186
11
249
44
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
5
82
180
115
number-tributaries
number-tributaries
0
16
10
1
1
NIL
HORIZONTAL

SLIDER
183
47
366
80
distance-floodplain-top
distance-floodplain-top
min-pycor + 1
min-pycor + (round (world-height / 2 ) )
-34
1
1
NIL
HORIZONTAL

SLIDER
182
81
366
114
distance-floodplain-bottom
distance-floodplain-bottom
min-pycor
distance-floodplain-top - 1
-64
1
1
NIL
HORIZONTAL

SLIDER
5
47
180
80
main-river-width
main-river-width
floor ( world-height / 8 )
floor ( world-height / 4 )
30
1
1
NIL
HORIZONTAL

PLOT
803
139
1003
289
Sockeye Escapement
Day
Escaped Sockeye
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plotxy day escaped_sockeye"

PLOT
1005
138
1205
288
Sockeye Sonar Counter
Day
Count Sockeye
0.0
10.0
0.0
10.0
true
false
"plotxy day dailyTotal" "plotxy day dailyTotal"
PENS
"default" 1.0 0 -16777216 true "" "plotxy day dailyTotal"

SLIDER
369
570
553
603
happiness-threshold
happiness-threshold
0
1
0.85
.01
1
NIL
HORIZONTAL

SLIDER
369
604
553
637
average-motivation
average-motivation
0
.6
0.3
.05
1
NIL
HORIZONTAL

SLIDER
560
466
732
499
motivation-sd
motivation-sd
0
.25
0.1
0.05
1
NIL
HORIZONTAL

SLIDER
184
188
362
221
drift_season_start
drift_season_start
1
46
1
1
1
days
HORIZONTAL

SLIDER
184
398
365
431
dipnet_season_start
dipnet_season_start
1
46
22
1
1
days
HORIZONTAL

SLIDER
184
432
364
465
dipnet_season_end
dipnet_season_end
0
46
43
1
1
days
HORIZONTAL

SLIDER
184
223
362
256
drift_season_end
drift_season_end
0
88
88
1
1
NIL
HORIZONTAL

SLIDER
369
535
555
568
starting-happiness
starting-happiness
0
1
1
.1
1
NIL
HORIZONTAL

SLIDER
4
468
197
501
commercial_radius_fished
commercial_radius_fished
1
5
3
1
1
NIL
HORIZONTAL

SLIDER
199
571
364
604
dipnetters/agent
dipnetters/agent
0
400
67
1
1
NIL
HORIZONTAL

SLIDER
199
606
363
639
dipnet_radius_fished
dipnet_radius_fished
1
3
2
1
1
NIL
HORIZONTAL

SLIDER
369
500
555
533
dipnet_width
dipnet_width
3
7
5
0.5
1
(ft.)
HORIZONTAL

SLIDER
183
117
365
150
sockeye/agent
sockeye/agent
1
200
50
1
1
NIL
HORIZONTAL

SLIDER
369
465
556
498
dipnet_vision
dipnet_vision
0.25
1
0.25
0.25
1
mi
HORIZONTAL

SLIDER
184
152
364
185
chinook/agent
chinook/agent
0
100
50
1
1
NIL
HORIZONTAL

PLOT
1005
290
1205
440
Chinook Sonar Counter
Day
Count Chinook
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plotxy day chinook_daily_total"

PLOT
803
290
1003
440
Chinook Escapement
Day
Count Chinook
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plotxy day escaped_chinook"

CHOOSER
5
118
180
163
Run-Type
Run-Type
"III" "IV" "III-IV" "III-IV-V" "random"
2

SLIDER
4
164
180
197
sockeye-run-size
sockeye-run-size
0
6500000
4360248
1
1
NIL
HORIZONTAL

SLIDER
4
399
181
432
total-drift-permits
total-drift-permits
0
496
437
1
1
NIL
HORIZONTAL

CHOOSER
803
45
993
90
drift-emergency-order
drift-emergency-order
"None" "Open" "Close"
0

CHOOSER
803
92
993
137
kasilof-set-emergency-order
kasilof-set-emergency-order
"None" "Open" "Close"
0

SLIDER
4
199
181
232
chinook-run-size
chinook-run-size
0
100000
46914
1
1
NIL
HORIZONTAL

SLIDER
4
571
197
604
set_gillnet_depth
set_gillnet_depth
0
90
45
1
1
meshes
HORIZONTAL

SLIDER
4
502
197
535
drift_gillnet_depth
drift_gillnet_depth
0
90
45
1
1
meshes
HORIZONTAL

SLIDER
4
607
197
640
set_gillnet_length
set_gillnet_length
0
210
105
1
1
fathoms
HORIZONTAL

SLIDER
4
536
197
569
drift_gillnet_length
drift_gillnet_length
0
300
150
1
1
fathoms
HORIZONTAL

SLIDER
198
468
362
501
set_21_22_permits
set_21_22_permits
0
250
178
1
1
NIL
HORIZONTAL

SLIDER
199
503
362
536
set_31_32_permits
set_31_32_permits
0
250
121
1
1
NIL
HORIZONTAL

SLIDER
199
537
363
570
set_41_42_permits
set_41_42_permits
0
250
100
1
1
NIL
HORIZONTAL

SLIDER
4
433
181
466
total-set-permits
total-set-permits
0
500
350
1
1
NIL
HORIZONTAL

SLIDER
184
258
365
291
kenai_set_season_start
kenai_set_season_start
1
46
20
1
1
day
HORIZONTAL

SLIDER
184
294
366
327
kenai_set_season_end
kenai_set_season_end
1
58
58
1
1
day
HORIZONTAL

SLIDER
560
501
732
534
dip-effort-mag-adj
dip-effort-mag-adj
1
4
1
0.25
1
NIL
HORIZONTAL

SLIDER
184
329
365
362
kasilof_set_season_start
kasilof_set_season_start
1
46
7
1
1
NIL
HORIZONTAL

SLIDER
184
364
365
397
kasilof_set_season_end
kasilof_set_season_end
1
58
58
1
1
NIL
HORIZONTAL

CHOOSER
995
45
1186
90
kenai-set-emergency-order
kenai-set-emergency-order
"None" "Open" "Close"
0

SWITCH
802
10
1027
43
automatic-emergency-orders?
automatic-emergency-orders?
0
1
-1000

PLOT
802
444
1063
639
Commercial Sockeye Harvest
Day
Sockeye Harvest
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Drift" 1.0 0 -13345367 true "" "plotxy day (sum drift_daily_harvest)"
"Set" 1.0 0 -2674135 true "" "plotxy day sum_set"

PLOT
1065
445
1314
638
Commercial Chinook Harvest
Day
Chinook Harvest
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Drift" 1.0 0 -13345367 true "" "plotxy day (sum drift_daily_king_harvest)"
"Set" 1.0 0 -2674135 true "" "plotxy day (sum chin_har_21_22 + sum chin_har_31_32 + sum chin_har_41_42)"

PLOT
1207
274
1429
439
Dipnet Sockeye Harvest
Day
Sockeye Harvest
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plotxy day (sum season_total_list)"

SLIDER
559
606
738
639
sockeye-dmt-shift
sockeye-dmt-shift
-14
14
0
1
1
days
HORIZONTAL

SLIDER
559
641
738
674
chinook-dmt-shift
chinook-dmt-shift
-14
14
0
1
1
days
HORIZONTAL

SLIDER
560
536
732
569
sockeye-mdmt-shift
sockeye-mdmt-shift
-14
14
0
1
1
days
HORIZONTAL

SLIDER
560
570
733
603
chinook-mdmt-shift
chinook-mdmt-shift
-14
14
0
1
1
days
HORIZONTAL

@#$#@#$#@
## WHAT IS IT?

An agent-based modeling (ABM) platform for simulating social-ecological (SE) dynamics of pacific salmon fisheries. ABMs consist of individual agents (think James bond) each with their own rule set defining how they behave in the model. By programming relatively simple rule sets for different agents and allowing the agents to interact with one another, different overall model behavioral outcomes may be observed and studied. The model is currently instantiated and validated for dynamics at the Kenai River. Running the model simulates the return of sockeye and Chinook salmon to the Kenai from the 1st of July through the middle of August. As the salmon return, dipnet, drift gillnet, and set gillnet agents attempt to harvest as much sockeye as they can. The dipnet fishermen fish from the beaches of the river using dipnets no wider than 5 ft., while the drift gillnet and set gillnet commercial fishermen hang large gillnets in the waters of Cook Inlet perpendicular to the flow of the current. Drift gillnetters are more mobile than the set gillnetters and can fish throughout the Inlet contingent upon regulations, while set gillnetters stake their nets on beaches and extend them out at an angle from the beach. Historically, set gillnet and drift gillnet fishermen take the largest share of the sockeye harvest, often times harvesting millions of sockeye salmon bound to Kenai. Recently though, the set gillnet fishery has seen years of restriction on allowed fishing time due to Chinook salmon by-catch; the return of Chinook salmon to the Kenai river is much smaller (~ 20,000 - 45,000) than the return of sockeye salmon (~ 2,000,000 - 6,000,000), and there is subsequent concern about the number of Chinook salmon having the opportunity to spawn (known as escapement). In order to quantify escapement, sonar counters are placed in the river to estimate daily passage of sockeye and Chinook salmon. This model was designed for the testing of different scenarios on sockeye and Chinook escapement and stakeholder harvest, such as alteration of stakeholder gear or fishing time in a way that maintains or maximizes sockeye harvest while minimizing Chinook by-catch.

## HOW IT WORKS

The dipnet, drift gillnet, and set gillnet agents follow simple behavioral rules centered around attempting to maximize salmon harvest. The stakeholder/fishermen agents are also influenced by "experience" parameters such as over-crowding of a given fishing location due to high density of stakeholders. Furthermore, the stakeholders are subject to obeying Alaska Department of Fish and Game (ADFG) regulations, e.g., dipnetters are limited to fishing between July 10 and July 31 from 6 AM to 11 PM. Parameters are currently set to values based on the validated model and on Fish and Game regulations. That being said, many of the parameters are easily altered in the model interface. For example, the beginning and ending of the drift gillnet fishing season may be altered using the "drift_season_start" and "drift_season_end" parameters.

The salmon agents are programmed to follow amino acid signatures back to their home tributaries. Salmon agents are seeded in the simulation using observed run-timing distributions reconstructed from ADFG sonar and harvest data. Users may select a proto-typical sockeye run-timing distribution to use ("Run-Type" parameter), or they may leave it as random. Type III runs have strong returns of sockeye during the third week, Type III-IV runs have the greatest return during the third and fourth weeks, and so on. Chinook salmon were found to only have one proto-typical run-timing distribution, hence there is no option for the user to alter this parameter. The timing of return of the sockeye and Chinook salmon may be altered to study the impacts of run compression due to climate change on salmon escapement and stakeholder harvest ("red_days_compressed" and "king_days_compressed" parameters). Users may also select the magnitude of returning salmon, if they desire ("sockeye-run-size" and "chinook-run-size" parameters).

## HOW TO USE IT

Due to the amount of computations performed, the model can be slow to run. Therefore, first adjust the model speed slider at the top of the UI of the model interface tab to "fastest". Next, hit the "setup" button in the upper left hand corner of the UI to generate a stochastic watershed background and instantiate the model with the selected parameter values in the UI. Please be patient, this step can take up to 5 minutes or so depending on the processing speed of your computer! Finally, hit the go button to begin the simulation. The simulation will run from the beginning of July until August 15th. The escapement and daily sonar count of sockeye and chinook salmon are graphed on the right side of the UI. The user can also observe stakeholder harvest on the right side of the UI.

NOTE: The model is in a constant state of improvement, and there may be the occassional bug.

## THINGS TO TRY

As the model is running, "emergency orders" are issued closing or opening different commercial fishing sections dependent on variables like stakeholder sockeye and/or Chinook harvest, date in the season, and salmon escapement. These emergency orders are based off of genetically evolved equations meant to mimic ADFG management behavior in limiting or increasing commercial fishing power during the fishing season. By default, these emergency orders are automatically issued in the simulation ("automatic-emergency-orders?" boolean). A fun alternative to try is to turn off the automatic emergency orders, and attempt to manually manage sockeye or Chinook escapement using the "drift-emergency-order", "kenai-set-emergency-order", and "kasilof-set-emergency-order" drop down menus on the right side of the UI. Setting the drop down to "Open" will open the given section on the next day, and vice versa for "Close". There are two set gillnet sections harvesting salmon from the Kenai, as indicated by the emergency order options. Think of opening or closing one section or the other as partial or full alteration of set gillnet fishing power. If you do turn off automatic emergency orders, try to limit sockeye escapement between 800,000 - 1,200,000, and try to allow for at least 20,000 Chinook to escape. It can be tricky, depending on run conditions! Also, don't be afraid to issue the emergency orders while the simulation is running! Simply hit the "go" button to pause the simulation, make your selection, then hit the "go" button again to resume the simulation, again. Other things to try could include altering set gillnet or drift gillnet net length or depth - it has been postulated that less Chinook by-catch would occur if set gillnet net depth was reduced, but there is concern over how it will effect sockeye harvest and subsequent escapement.

## NOTES

Again, there may be the occasional bug in the model. This is not a final release version, by any means. We're hoping to root out any remaining bugs as well as streamline and speed up the model, in the future!

## FUTURE WORK

We hope to adapt the model to study how culvert placement or river turbidity may impact salmon populations, escapement, and harvest. Culverts can alter flow characteristics to the point that salmon passage is hindered or impossible, and is especially harmful to young developing salmonoids that need mobility between different habitat locations. High levels of turbidity have been found to cause gill trauma and effect reproduction and growth. Turbdity also may reduce spawning habitat and cause damage to salmon redds (nests) containing eggs from spawning activity. With river turbidity in particular, understanding how stakeholders behave is an important factor; the Kenai Watershed Forum found that often times, river turbidity levels exceeded state regulatory levels in relation to background levels of turbidity due to motorboat traffic, i.e., even after taking into account the already silty nature of the river, turbidity violations occurred.

## CREDITS AND REFERENCES

Dr. Martin Cenek and I have a related paper that was recently accepted for publication by GIScience Springer. It is focused around using Big Data for driving agent-based models. I have attached the paper separately, if anyone is curious and would like to take a look.

Citation:
M. Cenek,  M.  Franklin,  Developing  high  fidelity,  data  driven,  verified agent  based  models  of  coupled  socio-ecological  systems  of  alaska  fisheries, In-press for publication in Advances in Geographic Information Science Book Series by Springer.

Thanks to Uri Wilensky and his flocking model published in the NetLogo model library. Portions of his code were modified and utilized for schooling dynamics of the salmon in our model. The license under which he published his model is below, and is the same for our model.

## COPYRIGHT AND LICENSE

Copyright 2016 Martin Cenek and Maxwell Franklin.

![CC BY-NC-SA 3.0](http://ccl.northwestern.edu/images/creativecommons/byncsa.png)

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 License.  To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

boat
false
15
Rectangle -2674135 true false 30 165 270 180
Polygon -1 true true 30 180 105 270 195 270 270 180
Line -7500403 false 150 165 150 120
Polygon -7500403 true false 150 30 30 120 270 120

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dipnetter
false
15
Circle -1 true true 140 5 80
Polygon -1 true true 135 90 150 195 120 285 135 300 165 300 180 225 195 300 225 300 240 285 210 195 225 90
Rectangle -1 true true 157 79 202 94
Polygon -1 true true 225 90 270 150 255 180 195 105
Polygon -1 true true 135 90 90 150 105 180 165 105
Line -16777216 false 75 120 120 315
Circle -16777216 false false -2 -2 122
Line -7500403 false 0 45 60 0
Line -7500403 false 0 60 75 0
Line -7500403 false 0 75 85 6
Line -7500403 false 6 87 98 12
Line -7500403 false 12 97 108 20
Line -7500403 false 20 104 111 33
Line -7500403 false 32 111 117 45
Line -7500403 false 48 117 119 62
Line -7500403 false 8 27 67 117
Line -7500403 false 18 17 79 112
Line -7500403 false 29 9 92 110
Line -7500403 false 38 1 101 99
Line -7500403 false 2 45 52 120
Line -7500403 false 56 1 112 91
Line -7500403 false 69 1 117 75

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

fishermen
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105
Line -16777216 false 15 0 75 180
Line -7500403 true 15 0 15 210

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

thin circle
true
0
Circle -7500403 false true -1 -1 301

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.3.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="Scenario, Random, set d29 l105" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, set d29 l140" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="140"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, set d45  l140" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="140"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, set d29 l70" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, Dip Mag 2.0" repetitions="1" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, Dip Mag 1.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, Dip Mag 2.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, Dip M1 N5.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, Dip M1 N6" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, Dip M1.5 N5.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, Dip M2.0 N5.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, Dip M2.5 N5.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, Dip M1.5 N6" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, Dip M2.0 N6" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Random, Dip M2.5 N6" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Control, Controlled Scenarios" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, set d29 l105" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, set d29 l140" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="140"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, set d45  l140" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="140"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, set d29 l70" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, Dip Mag 1.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, Dip Mag 2.0" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, Dip Mag 2.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, Dip M1 N5.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, Dip M1.5 N5.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, Dip M2.0 N5.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, Dip M2.5 N5.5" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, Dip M1 N6" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, Dip M1.5 N6" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, Dip M2.0 N6" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Scenario, Controlled, Dip M2.5 N6" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="177"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="121"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="437"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="47000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4400000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="66"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="2.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2002" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="351"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="97"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="188"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="137"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="409"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="51700"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="2954000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="40"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2003" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="342"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="208"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="135"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="420"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="56889"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="3700000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="41"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2004" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="356"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="115"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="201"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="139"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="441"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="75557"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4931347"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2005" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="361"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="128"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="210"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="138"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="472"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="67299"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="5657432"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV-V&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="57"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2006" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="335"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="113"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="176"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="123"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="396"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="50484"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="2533975"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV-V&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2007" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="339"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="159"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="116"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="417"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="56179"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="3120843"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV-V&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="60"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2008" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="326"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="73"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="154"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="111"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="426"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="42736"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="2269374"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2009" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="328"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="87"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="147"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="104"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="405"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="31681"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="2498000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV-V&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="71"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2010" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="329"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="81"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="154"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="106"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="378"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="41198"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="3330000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="77"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2011" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="385"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="89"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="178"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="120"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="462"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="44290"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="6199394"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="89"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2012" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="315"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="72"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="145"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="103"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="496"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="29834"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="4487414"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="93"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2013" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="86"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="160"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="106"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="496"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="20286"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="3519000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="90"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="2014" repetitions="24" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>run_size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>sum_set_list</metric>
    <metric>sum_set_eff_list</metric>
    <metric>set_eff_adj_list</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>ken_open_list</metric>
    <metric>kas_open_list</metric>
    <metric>drift_open_list</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <enumeratedValueSet variable="red_days_compressed">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="red_compression">
      <value value="&quot;end&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_days_compressed">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="king_compression">
      <value value="&quot;middle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="364"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="79"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="173"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="110"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="496"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook_run_size">
      <value value="19353"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="run_size">
      <value value="3308475"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;III-IV-V&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="eff-adj-fn">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="coin_toss_eo?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="99"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-agents">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set-agents">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip_mag_adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="draw?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="random-flow?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="flock-wiggle">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_start">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="personal_season_end">
      <value value="31"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="primary-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gillnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="setnetters/agent">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-24"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial-season-end">
      <value value="46"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_length_restriction">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-align-turn">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="floodplain-intervals">
      <value value="56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_eo_depth_restriction">
      <value value="29"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_emergency_order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_open?">
      <value value="&quot;open&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="ScenarioRandomControl" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(0)sdmt(-7)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="-7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(0)sdmt(7)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(-7)sdmt(0)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="-7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(7)sdmt(0)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(7)sdmt(-7)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="-7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(-7)sdmt(-7)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="-7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="-7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(-7)sdmt(7)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="-7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(7)sdmt(7)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(7)sdmt(14)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(7)sdmt(-14)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="-14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(-7)sdmt(14)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="-7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(-7)sdmt(-14)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="-7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="-14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(14)sdmt(7)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(14)sdmt(-7)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="-7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(-14)sdmt(-7)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="-14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="-7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(-14)sdmt(7)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="-14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(14)sdmt(14)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(14)sdmt(-14)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="-14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(-14)sdmt(-14)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="-14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="-14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(-14)sdmt(14)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="-14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(14)sdmt(0)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(-14)sdmt(0)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="-14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(0)sdmt(14)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="smdmt(0)sdmt(-14)cmdmt(0)cdmt(0)" repetitions="48" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>date-and-time</metric>
    <metric>total-drift-permits</metric>
    <metric>total-set-permits</metric>
    <metric>sum drift_open_list</metric>
    <metric>sum setgillnet_days_open</metric>
    <metric>sum ken_open_list</metric>
    <metric>sum kas_open_list</metric>
    <metric>total_number_dipnetters</metric>
    <metric>sum_dipnet_days_fished</metric>
    <metric>mean_season_dipnet_harvest</metric>
    <metric>min_dipnet_harvest</metric>
    <metric>max_dipnet_harvest</metric>
    <metric>sum_dipnet_season_total</metric>
    <metric>sum dip_king_har_list</metric>
    <metric>mean_set</metric>
    <metric>mean_drag</metric>
    <metric>sum_set</metric>
    <metric>sum_drag</metric>
    <metric>setnet_tracker</metric>
    <metric>gillnet_tracker</metric>
    <metric>sockeye-run-size</metric>
    <metric>run_class</metric>
    <metric>happiness-threshold</metric>
    <metric>average-motivation</metric>
    <metric>dipnetters/agent</metric>
    <metric>sockeye_sonar_list</metric>
    <metric>calc_sockeye_run_list</metric>
    <metric>king_sonar_list</metric>
    <metric>calc_chinook_run_list</metric>
    <metric>sum sockeye_sonar_list</metric>
    <metric>sum calc_sockeye_run_list</metric>
    <metric>sum king_sonar_list</metric>
    <metric>sum calc_chinook_run_list</metric>
    <metric>setgillnet_days_open</metric>
    <metric>days_open_ken</metric>
    <metric>days_open_kas</metric>
    <metric>set_scale</metric>
    <metric>daily_permits_fished_21_22</metric>
    <metric>daily_permits_fished_31_32</metric>
    <metric>daily_permits_fished_41_42</metric>
    <metric>max daily_permits_fished_21_22</metric>
    <metric>max daily_permits_fished_31_32</metric>
    <metric>max daily_permits_fished_41_42</metric>
    <metric>sock_har_21_22</metric>
    <metric>sock_har_31_32</metric>
    <metric>sock_har_41_42</metric>
    <metric>chin_har_21_22</metric>
    <metric>chin_har_31_32</metric>
    <metric>chin_har_41_42</metric>
    <metric>sum sock_har_21_22</metric>
    <metric>sum sock_har_31_32</metric>
    <metric>sum sock_har_41_42</metric>
    <metric>sum chin_har_21_22</metric>
    <metric>sum chin_har_31_32</metric>
    <metric>sum chin_har_41_42</metric>
    <metric>driftgillnet_days_open</metric>
    <metric>drift_gillnet_effort_list</metric>
    <metric>drift_scale</metric>
    <metric>drift_daily_harvest</metric>
    <metric>drift_daily_king_harvest</metric>
    <metric>sum drift_daily_harvest</metric>
    <metric>sum drift_daily_king_harvest</metric>
    <metric>regular_period_list</metric>
    <metric>set_gillnet_depth</metric>
    <metric>set_gillnet_length</metric>
    <metric>dipnetters/agent * (day1) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day2) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day3) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day4) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day5) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day6) / total_number_dipnetters</metric>
    <metric>dipnetters/agent * (day7) / total_number_dipnetters</metric>
    <metric>escaped_sockeye</metric>
    <metric>escaped_chinook</metric>
    <metric>chinook-run-size</metric>
    <enumeratedValueSet variable="sockeye-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-dmt-shift">
      <value value="-14"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-mdmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-dmt-shift">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-set-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_41_42_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_21_22_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_31_32_permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="total-drift-permits">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye-run-size">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Run-Type">
      <value value="&quot;random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnetters/agent">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_length">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_length">
      <value value="105"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="set_gillnet_depth">
      <value value="45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_width">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dip-effort-mag-adj">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-separate-turn">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_vision">
      <value value="0.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="vision">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="sockeye/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-floodplains">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_start">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-happiness">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_season_end">
      <value value="43"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="main-river-width">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-top">
      <value value="-34"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-tributaries">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-attractant-turn">
      <value value="5.25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="minimum-separation">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-motivation">
      <value value="0.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="chinook/agent">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="commercial_radius_fished">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="dipnet_radius_fished">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="motivation-sd">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-floodplain-bottom">
      <value value="-64"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-cohere-turn">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="happiness-threshold">
      <value value="0.85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof-set-emergency-order">
      <value value="&quot;None&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_start">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="drift_season_end">
      <value value="88"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_start">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kenai_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_start">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="kasilof_set_season_end">
      <value value="58"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="automatic-emergency-orders?">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
