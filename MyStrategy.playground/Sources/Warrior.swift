public class Warrior{
    //Warrior HAS an ability...
    private var ability:FightAbility!;
    public init(){
        //default ability
        self.ability = Boxing();
    }
    //use current ability
    public func engage(){
        self.ability.attack();
    }
    //changing ability at runtime
    public func setAbility(_ ability:FightAbility){
        self.ability = ability;
    }
}
