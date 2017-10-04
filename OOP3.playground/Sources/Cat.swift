import Foundation

public class Cat : Animal {
    public override init() {
        super.init();
        self.name = "Mizi";
    }
    
    public override func makeNoise() {
        print("Miao");
    }
    
    public func drink(_ beverage:String){
        switch beverage.lowercased() {
        case "milk","water":
            print("Cat drinks \(beverage)");
        default:
            print("Refuse to drink \(beverage)");
        }
    }
}
