//Override
class Animal{
    var name:String;
    var isAlive:Bool;
    init(){
        self.name="Bubu";
        self.isAlive=true;
    }
    func die(){
        self.isAlive=false;
    }
    func makeNoise(){
        print("Beep");
    }
}
class Cat : Animal{
    override init(){
        super.init();//calls Animal constructor
        self.name = "Mizi";
    }
    func drink(_ beverage:String){
        if isAlive {
            switch beverage.lowercased() {
                case "milk","water":
                    print("\(self.name) gladly drinks \(beverage)");
                default:
                    print("Cat \(self.name) refusing to drink \(beverage)");
                
            }
        }
    }
    override func makeNoise() {
        print("Meawoo");
    }
}

var c=Cat();
c.makeNoise();
c.drink("milk");
c.drink("Beer");








