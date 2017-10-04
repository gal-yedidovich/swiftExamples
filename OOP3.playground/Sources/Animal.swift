public class Animal{
    var name:String?;
    private var isAlive:Bool;
    init() {
        self.isAlive = true;
    }
    public func die(){
        self.isAlive = false;
    }
    func getIsAlive()->Bool{
        return self.isAlive;
    }
    public func makeNoise(){
        print("beep");
    }
}
