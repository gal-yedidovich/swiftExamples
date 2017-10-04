//OOP -> any object IS, HAS, DOES something
class A{//A is Any
    var b=0;//instance variable
    static var c=1;//class variable
    func d(){}//instance method
    static func e(){}//class method
}
//class -> blu epr int (template)
class Person{
    //Person has: name,age,isMarried
    var name:String="incognito";
    var age:Int=0;
    var isMarried:Bool=false;
    //Person does: sayHi
    func sayHi(){
        print("\(name) says Hello");
    }
}
//instantiation:
var p1=Person();
var p2=Person();
var people:[Person]=[
   p1, p2, Person()
];
p1.name="Bubu";
p2.name="Groot";
for p in people{
    p.sayHi();
}
//Constructor
class iPhone{
    //iPhone has: os, owner
    static let os="iOS";
    var owner : Person;
    init(owner : Person){
        self.owner = owner;
    }
    //phone does: makeCall, receiveCall
    func makeCall(to phone: iPhone){
        phone.receiveCall(from: self);
    }
    func receiveCall(from phone:iPhone){
        print("\(self.owner.name) received call from \(phone.owner.name)");
    }
}
//Object behavior
var phone1 = iPhone(owner: p1);
var phone2 = iPhone(owner: p2);
phone1.makeCall(to: phone2);

//Overloading - constructors & methods
class Bike{
    var year:Int;
    var color:String;
    init(){
        self.year = 2017;
        self.color = "White";
    }
    init(year:Int, color:String){
        self.year = year;
        self.color = color;
    }
}
var b1=Bike();
var b2=Bike(year: 2012, color: "Black");
class Helloer{
    static func sayHi(){
        print("Hello");
    }
    static func sayHi(to person:Person){
        print("Hello to \(person.name)");
    }
    static func sayHi(from person1:Person, to person2:Person){
        print("\(person1.name) says Hello to \(person2.name)");
    }
}
Helloer.sayHi();
Helloer.sayHi(to: p1);
Helloer.sayHi(from: p1, to: p2);






