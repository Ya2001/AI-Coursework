%The different types that the monsters can be
type(normal).
type(dragon).
type(ghost).
type(fighting).
type(flying).

%Establishing the monsters we have along with their respective types
monster(fraxure,dragon).
monster(bewear,normal).
monster(polteageist,ghost).
monster(rookidee,flying).
monster(sirfetchd,fighting).

%Establishing the moves we have along with their respective types
%normal moves
move(strength,normal).
move(takeDown,normal).
move(falseSwipe,normal).
move(facade,normal).
move(teaTime,normal).
move(furyAttack,normal).
move(bodySlam,normal).
%flying moves
move(peck,flying).
move(braveBird,flying).
%fighting moves
move(superPower,fighting).
move(revenge,fighting).
move(brickBreak,fighting).
move(closeCombat,fighting).
%ghost moves
move(shadowClaw,ghost).
move(astonish,ghost).
move(shadowBall,ghost).
%dragon moves
move(dragonClaw,dragon).
move(outrage,dragon).

%Establishing what moves the monsters have 
%bewear moves
monsterMove(bewear,strength).
monsterMove(bewear,takeDown).
monsterMove(bewear,superPower).
monsterMove(bewear,shadowClaw).
%fraxure moves
monsterMove(fraxure,falseSwipe).
monsterMove(fraxure,dragonClaw).
monsterMove(fraxure,outrage).
monsterMove(fraxure,shadowClaw).
%polteageist moves
monsterMove(polteageist,facade).
monsterMove(polteageist,shadowBall).
monsterMove(polteageist,astonish).
monsterMove(polteageist,teaTime).
%rookidee moves
monsterMove(rookidee,revenge).
monsterMove(rookidee,peck).
monsterMove(rookidee,braveBird).
monsterMove(rookidee,furyAttack).
%sirfetchd moves
monsterMove(sirfetchd,brickBreak).
monsterMove(sirfetchd,braveBird).
monsterMove(sirfetchd,bodySlam).
monsterMove(sirfetchd,closeCombat).

%Encoding move type effectiveness
%dragon type moves
typeEffectiveness(dragon,dragon,strong).
typeEffectiveness(dragon,fighting,ordinary).
typeEffectiveness(dragon,flying,ordinary).
typeEffectiveness(dragon,ghost,ordinary).
typeEffectiveness(dragon,normal,ordinary).
%fighting type moves
typeEffectiveness(fighting,dragon,ordinary).
typeEffectiveness(fighting,fighting,ordinary).
typeEffectiveness(fighting,flying,weak).
typeEffectiveness(fighting,ghost,superweak).
typeEffectiveness(fighting,normal,strong).
%flying type moves
typeEffectiveness(flying,dragon,ordinary).
typeEffectiveness(flying,fighting,strong).
typeEffectiveness(flying,flying,ordinary).
typeEffectiveness(flying,ghost,ordinary).
typeEffectiveness(flying,normal,ordinary).
%ghost type moves
typeEffectiveness(ghost,dragon,ordinary).
typeEffectiveness(ghost,fighting,ordinary).
typeEffectiveness(ghost,flying,ordinary).
typeEffectiveness(ghost,ghost,strong).
typeEffectiveness(ghost,normal,superweak).
%normal type moves
typeEffectiveness(normal,dragon,ordinary).
typeEffectiveness(normal,fighting,ordinary).
typeEffectiveness(normal,flying,ordinary).
typeEffectiveness(normal,ghost,superweak).
typeEffectiveness(normal,normal,ordinary).

%Encoding the strict strength level of typeEffectiveness
moreEffective(strong,ordinary).
moreEffective(ordinary,weak).
moreEffective(weak,superweak).

%Encoding unspecified strength levels
moreEffectiveThan(E1,E2):- 
    moreEffective(E1,E2).
moreEffectiveThan(E1,E2):- 
    moreEffective(E1,X), moreEffective(X,E2).
moreEffectiveThan(E1,E2):- 
    moreEffective(E1,X), moreEffective(X,Y), moreEffective(Y,E2).

%Matching the monster move types to the monsters types
monsterMoveMatch(MO,MV):- 
    monsterMove(MO,MV), monster(MO,X), move(MV,Y), X == Y. 

%Checks if MV1 is more effective than MV2 on monster of type T
moreEffectiveMove(MV1,MV2,T):-
    move(MV1,A),move(MV2,B),
    typeEffectiveness(A,T,X), typeEffectiveness(B,T,Y),
    moreEffectiveThan(X,Y).

%Checks if the monster MO1's move MV1 is more effective than MO2's move MV2
moreEffectiveMonster(MO1,MV1,MO2,MV2):-
    monster(MO1,T1), monster(MO2,T2),
    monsterMove(MO1,MV1) , monsterMove(MO2, MV2),
    moreEffectiveMove(MV1,MV2,T2).
    
