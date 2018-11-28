;;
;; Bed Bug infestation model
;; James Sturgis 2018
;;

breed [nests nest]
breed [bugs  bug ]
breed [bodys body]

globals [
  date		    ;; Days into simulation
  time		    ;; Time into simulation
]

turtles-own [	;; Turtles are Bedbugs
  state		    ;; Bedbugs can be sleeping, active, feeding or dead.
  is-male?    ;; Bedbugs can be male or female.
  fullness	  ;; Bedbug fullness is 100 when replete, 0 when hungry and < 0 when starving.
  infection	  ;; Bedbugs can be infected by Beauveria bassiana
]

nests-own [	  ;; Nests and traps are the same thing except for their starting conditions bed bugs feel safe there.
  pheromone	  ;; Current pheromone level in BED (bug equivalent days).
  spores	    ;; Current level of active Beauveria spores in nest.
  histamine	  ;; Current level of feel safe stuff in BED.
]

bodys-own [	  ;; This is the food source for bed bugs
  itchiness	  ;; How iritated is the food source.
]

to setup
  clear-all
  place-nests start_nests
  place-bugs start_bugs
  reset-ticks
end

to go
  update-bodys
  update-nests
  update-bugs
  update-globals
  tick		;; Time moves on 1 tick is 1 minute at night 1 tick is 30 minutes during the day.
end

@#$#@#$#@
Interface tab   
@#$#@#$#@
## WHAT IS IT?

This file implements a model of a bedbug infestation, and has been created to try and understand how best to 
control the infestation with a pathogenic fungus Beauveria bassiana. As time goes by the bed bugs wake up and 
search for food, feed, moult, reproduce and sleep in aggregates located in nests. Their mouvements are controlled 
by gradients of pheromones (to find their shelters) and heat (to find their prey). Their behaviour has been as 
far as possible modelled on litterature data. As the host gets more itchy the chances of getting squashed while 
or after feeding go up.

## HOW IT WORKS

Begbugs during the night, if they are active (hungry) will move around and be increasingly attracted by food
source pheromones. They move in a biased random walk at a speed of about 0.6cm/sec or 36cm/minute [ref?]. 
If they find a food source they feed until they are full which takes about 10 minutes [ref?]. During this
time the food source becomes more itchy, and this increases the chance of an accident. After feeding they move
around but attracted to insect pheromones looking for a nice home, becoming progressively less active. During 
the night a bedbug can become (some probability) contaminated by visiting (entering or leaving) a contaminated nest.

During the day bedbugs (except eggs) secrete pheromones and histamine (1 BED) into their current residence. 
A fed male bedbug can have sex with any likely lasses in the same nest, this is dangerous for the girls and 
can kill them. A fed and fertilized adult female can lay an egg to make a new bedbug. An egg can hatch 5 days 
after laying, and a nymph can moult and move on to the next days 5 days after feeding (except N1 do not need 
to feed to move on). An adult bedbug can die of old age, or starvation, or as a result of infection (after 3 
days on average). Infected cadavers can sprout mushrooms after an appropriate delay and contaminate the nest,
becoming non-infected in the process. Dead non-infected bedbugs disappear a night-fall.

Nests evaporate lose pheromones with a half-life of several (try 1.5) days and histamine and contamination more 
slowly. A histamine level above some threshold makes a nest very attractive for spending the day and aggregating.

Bodys gain itchiness when fed upon and loose itchiness with a half-life of several hours. They also kill feeding 
bed bugs with a chance depending on the level of itchiness.

Test this model and the settings against: 
- The population structure [Polanco 2011]
- Survivorship during starvation [Polanco 2011a]
- Searching data [Reiss 2011]

## HOW TO USE IT

It does not work at the moment.

## THINGS TO NOTICE

## THINGS TO TRY

## EXTENDING THE MODEL

## NETLOGO FEATURES

## RELATED MODELS

## CREDITS AND REFERENCES

James N. Sturgis 2018

@#$#@#$#@
turtle shapes
@#$#@#$#@
NetLogo version
@#$#@#$#@
preview commands
@#$#@#$#@
System Dynamics Modeler
@#$#@#$#@
BehaviorSpace
@#$#@#$#@
HubNet client
@#$#@#$#@
link shapes
@#$#@#$#@
model settings
@#$#@#$#@
DeltaTick
