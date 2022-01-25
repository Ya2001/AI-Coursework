(define
    (domain planet)
    (:requirements 
        :strips
        :typing :negative-preconditions :equality)
    (:predicates 
        (Sqr1 ?x1)
        (Sqr2 ?x2)
        (Sqr3 ?x3)
        (Sqr4 ?x4)
        (Sqr5 ?x5)
        (Sqr6 ?x6)
        (Sqr7 ?x7)
        (Sqr8 ?x8)
        (Sqr9 ?x9)
        (gridSqr ?x)
        (flat ?t)
        (hilly ?t)
        (mountain ?t)
        (baseLoc ?x)
        (atGridSqr ?y)
        (commander ?p)
        (sciOfficers ?p ?t1)
        (engineers ?p ?s1 ?s2)
        (secPersonnel ?p)  
        (adj ?x ?az)
        (shieldUsed ?p ?s)
        (shielded ?x)
        (terraformed ?x)
        (terraformerDead ?p ?u)
        (terraformerDamaged ?p ?d)
        (bigBoyShield ?x)
        (pirateReg ?x)
        (captured ?x))
    (:action move 
        :parameters     (?x ?y)
        :precondition   (and 
                        (gridSqr ?x) 
                        (gridSqr ?y)
                        (adj ?x ?y) (atGridSqr ?x) 
                        (not (mountain ?y)))
        :effect         (and 
                        (atGridSqr ?y)
                        (not (atGridSqr ?x))))
    (:action emitter-shield1
        :parameters     (?x ?p ?s1 ?s2)
        :precondition   (and 
                        (gridSqr ?x)
                        (flat ?x)
                        (atGridSqr ?x) 
                        (engineers ?p ?s1 ?s2)
                        (not (shielded ?x))
                        (not(shieldUsed ?p ?s1))
                        (not(bigBoyShield ?x)))
        :effect         (and 
                        (shielded ?x)
                        (shieldUsed ?p ?s1)))
    (:action emitter-shield2
        :parameters     (?x ?p ?s1 ?s2)
        :precondition   (and 
                        (gridSqr ?x)
                        (flat ?x)
                        (atGridSqr ?x) 
                        (engineers ?p ?s1 ?s2)
                        (not (shielded ?x))
                        (not(bigBoyShield ?x))
                        (not (shieldUsed ?p ?s2)))
        :effect         (and 
                        (shielded ?x)
                        (shieldUsed ?p ?s2)))
    (:action shield-off 
        :parameters     (?x)
        :precondition   (and
                        (gridSqr ?x)
                        (shielded ?x)
                        (atGridSqr ?x))
        :effect         (and 
                        (not(shielded ?x))))
    (:action terraform-flat
        :parameters    (?x ?p ?t1)
        :precondition  (and 
                       (gridSqr ?x)
                       (atGridSqr ?x)
                       (flat ?x)
                       (sciOfficers ?p ?t1)
                       (not(terraformerDead ?p ?t1))
                       (not(terraformed ?x))
                       (not(terraformerDamaged ?p ?t1)))
        :effect        (and
                       (terraformed ?x)
                       (terraformerDead ?p ?t1)))
    (:action terraform-hilly
        :parameters    (?x ?p ?t1)
        :precondition  (and
                       (gridSqr ?x)
                       (atGridSqr ?x)
                       (hilly ?x)
                       (sciOfficers ?p ?t1)
                       (not(terraformerDead ?p ?t1))
                       (not(terraformed ?x))
                       (not(terraformerDamaged ?p ?t1)))
        :effect        (and
                       (terraformed ?x)
                       (terraformerDead ?p ?t1)
                       (terraformerDamaged ?p ?t1)))
    (:action terraformerCharging
        :parameters    (?x ?p ?t1)
        :precondition  (and
                       (gridSqr ?x)
                       (atGridSqr ?x)
                       (baseLoc ?x)
                       (sciOfficers ?p ?t1)
                       (terraformerDead ?p ?t1))
        :effect        (not(terraformerDead ?p ?t1)))
    (:action terraformerFixing
        :parameters    (?x ?p ?t1)
        :precondition  (and
                       (gridSqr ?x)
                       (atGridSqr ?x)
                       (baseLoc ?x)
                       (terraformerDamaged ?p ?t1))
        :effect        (not(terraformerDamaged ?p ?t1)))
     (:action planetaryShield 
         :parameters (?p ?z1 ?z2 ?z3 ?x)
         :precondition (and
                       (baseLoc ?x)
                       (atGridSqr ?x)
                       (not(= ?z1 ?z2))
                       (not(= ?z2 ?z3))
                       (not(= ?z3 ?z1))
                       (shielded ?z1)
                       (shielded ?z2)
                       (shielded ?z3)
                       (not(bigBoyShield ?x))
                       (commander ?p))
         :effect       (and 
                       (bigBoyShield ?x)))
     (:action bigBoyShieldOff 
        :parameters (?p ?x)
         :precondition (and
                       (baseLoc ?x)
                       (atGridSqr ?x)
                       (bigBoyShield ?x)
                       (commander ?p))
         :effect       (and 
                       (not(bigBoyShield ?x))))
    
                    
)

