public class Warrior{
    private var ability:FightAbility;
    public init(){
        //default ability IS Boxing
        self.ability = FAbilitiesFactory.createAbility("boxing");
    }
    //instance methods:
    public func engage(){
        self.ability.attack();
    }
    public func setAbility(_ ability:FightAbility){
        self.ability = ability;
    }
}
