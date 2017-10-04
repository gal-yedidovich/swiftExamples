//Functions
//Example 1
func sayHi(){
    print("hello world");
}
sayHi();
//Example 2 
func sayHi(to:String){//default external parameter name
    print("Hello to \(to)");
}
func sayHi(_ to:String){//ommit external parameter name
    print("Hello to \(to)");
}
sayHi(to: "Bubu");//invoke with external
sayHi("Groot");//invoke without
//Example 3 - multiple params with default external names
func sayHi(to:String, from:String){
    print("\(from) says Hi to \(to)");
}
sayHi(to: "Groot", from: "Bubu");
//Example 4 - controling parameter names
func plus(_ n1:Int, and n2:Int){
    print(n1+n2);
}
plus(1, and: 3);
//Example 5 - void functions:
func a(){}//void function -> implicit
func b()->(){}//void function -> explicit using empty tuple
func c()->Void{}//void function -> explicit using predefined struct Void
//Example 6 params & return type (pure function concept)
func minus(_ n1:Double,and n2:Double)->Double{
    return n1-n2;
}
print(minus(9.1, and: 4.2));
//Example 7 - default param values
func who(amI:String = "Groot"){
    print("I am \(amI)");
}
who();
who(amI: "Batman");
//Example 8 - variadic arguments (var-args)
func sayHelloTo(_ names:String...){
    for n in names{
        print("Hello to \(n)");
    }
}
sayHelloTo("Bubu", "Groot", "Deadpool");

