public class Lion : Animal{
    public override init(){
        super.init();
        self.name = "Simba";
    }
    public override func makeNoise() {
        print("\(self.name!) says Roarr");
    }
    public func eat(_ c:Cow){
        print("\(self.name!) eat \(c.name!)");
        c.die();//when Lion eats the Cow - it dies
    }
}
