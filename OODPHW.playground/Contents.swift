//Tests
var w1 = Warrior();
w1.engage();
var abilities:[FightAbility]=[
    FAbilitiesFactory.createAbility("gun"),
    FAbilitiesFactory.createAbility("rpg"),
    FAbilitiesFactory.createAbility("ion")
];
for a in abilities{
    w1.setAbility(a);
    w1.engage();
}