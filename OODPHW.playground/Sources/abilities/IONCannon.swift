public class IONcannon : FightAbility{
    //Stored constant instance
    static let instance=IONcannon();
    //To prevent instantiation from outside
    private init(){}
    public func attack() {
        print("Blast from the sky");
    }
}
