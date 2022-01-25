(define 
    (problem problem2)
    (:domain planet)
    (:objects z1 z2 z3 z4 z5 z6 z7 z8 z9 base yungthug carti shield1 shield2 drake terraformer rocky)
    (:init 
        (gridSqr z1) (gridSqr z2) (gridSqr z3) 
        (gridSqr z4) (gridSqr z5) (gridSqr z6)
        (gridSqr z7) (gridSqr z8) (gridSqr z9)
        (hilly z1) (flat z2) (hilly z3)
        (mountain z4) (flat z5) (flat z6)
        (flat z7) (hilly z8) (mountain z9)
        (baseLoc z2)
        (engineers carti shield1 shield2)
        (engineers yungthug shield1 shield2)
        (sciOfficers drake terraformer)
        (commander rocky)
        (atGridSqr z7)
        (adj z1 z2)
        (adj z2 z1)
        (adj z1 z4)
        (adj z4 z1)
        (adj z2 z3)
        (adj z3 z2)
        (adj z2 z5)
        (adj z5 z2)
        (adj z3 z6)
        (adj z6 z3)
        (adj z4 z5)
        (adj z5 z4)
        (adj z4 z7)
        (adj z7 z4)
        (adj z5 z8)
        (adj z8 z5)
        (adj z5 z6)
        (adj z6 z5)
        (adj z6 z9)
        (adj z9 z6)
        (adj z7 z8)
        (adj z8 z7)
        (adj z8 z9)
        (adj z9 z8))
    (:goal
        (and 
        (terraformed z7)
        (terraformed z8)
        (bigBoyshield z2)))
    )
        
