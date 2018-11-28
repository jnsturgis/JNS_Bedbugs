;;
;; Bed Bug infestation model
;; James Sturgis 2018
;;

breed [nests nest]
breed [bugs  bug ]
breed [bodys body]

globals [
  date		;; Days into simulation
  time		;; Time into simulation
]

turtles-own [	;; Turtles are Bedbugs
  state		;; Bedbugs can be sleeping, active, feeding or dead.
  is-male?      ;; Bedbugs can be male or female.
  fullness	;; Bedbug fullness is 100 when replete, 0 when hungry and < 0 when starving.
  infection	;; Bedbugs can be infected by Beauveria bassiana
]

nests-own [	;; Nests and traps are the same thing except starting conditions bed bugs feel safe there.
  pheromone	;; Current pheromone level in BED (bug equivalent days).
  spores	;; Current level of active Beauveria spores in nest.
  histamine	;; Current level of feel safe stuff in BED.
]

bodys-own [	;; This is the food source for bed bugs
  itchiness	;; How iritated is the food source.
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

This file implements a model of a bedbug infestation, and has been created to try and understand how best to control the infestation with a pathogenic fungus Beauveria bassiana. As time goes by the bed bugs wake up and search for food, feed, moult, reproduce and sleep in aggregates located in nests. Their mouvements are controlled by gradients of pheromones (to find their shelters) and heat (to find their prey). Their behaviour has been as far as possible modelled on litterature data.

## HOW IT WORKS

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
