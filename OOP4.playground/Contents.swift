//Ex1 - default initializer
struct Bubu{
    var name:String;
    var age:Int;
}
var b1 = Bubu(name: "X", age: 1);
//Ex 2 - pass by copy VS by reference
var a1=A();
var a2=a1;
a1.x=3;
print(a2 === a1);
var b2=b1;
b1.name=" lo x ";
print(b2.name);
//Ex 3 - Inheritance -> check files: AA.swift & BB.swift

