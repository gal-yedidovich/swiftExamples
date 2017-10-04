//Enumeration
//Example 1
enum Direction{
    case North;
    case South;
    case East;
    case West;
}
var d : Direction;//
d = Direction.North;//
d = Direction.East;//
d = .West;//
if d == Direction.West{//
   print("Wild wild west");
}
if d == .West{//
    print("The best from the west");
}
//standard usage
switch d {
    case .North:
        print("Winter is coming");
    case .South:
        print("Crazy Dornish women");
    case .West:
        print("Westerous ... ");
    case .East:
        print("Valar morghulis");
}
//Example 2 - inline declaration
enum Element {
    case Fire, Water, Air, Earth;
}
var e=Element.Water;
print(e);
print("\(e) hashValue: \(e.hashValue)")

//
enum Bulb {
    case A, B, C, D;
    //var age=1;//
    var watt:Int{//computed property
        return self.hashValue*50+10;
    }
}
var c = Bulb.C;
print("\(c) bulb works with \(c.watt) watt");

//Example 4
enum iStuff{
    case iPod, iPad, iPhone, iCloud;
    //instance methods
    func makeNoise(){
        switch self {
            case .iPod, .iPad, .iPhone:
                print("Blie blib blip");
            case .iCloud:
                print("Silence I kill you ;-P");
        }
    }
}
var ipod = iStuff.iPod;
ipod.makeNoise();
iStuff.iCloud.makeNoise();

//Example 5 - Inheritance - CustomStringConvertible (Printable)
enum Permission : CustomStringConvertible{
    case Guest, User, Moderator, Admin;
    var description: String{//equivalent .toString()
        return ["Guest","User","Moderator","Admin"][hashValue];
    }
}

var p = Permission.Moderator;
print(p);








