public class FAbilitiesFactory{
    //static factory method
    public static func createAbility(_ reqType:String)->FightAbility{
        //Type request handle
        switch reqType.lowercased() {
        //valid abilities
        case "shooting","gun":
            return Shooting();
        case "rpg","rocket","bazooka":
            return RocketLaunching();
        case "ioncannon","ion":
            return IONcannon.instance;
        default:
            return Boxing();
        }
    }
}
