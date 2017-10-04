//Functions
//Example 1
func sayHi(){
    print("hello world");
}
sayHi();
//Example 2 
func sayHi(to:String){
    print("Hello to \(to)");
}
sayHi(to: "Bubu");
//Example 3
func sayHi(to:String,from:String){
    print("\(from) says Hi to \(to)");
}
sayHi(to: "Groot", from: "Bubu");
//Example 4
func plus(_ n1:Int, and n2:Int){
    print(n1+n2);
}
plus(1, and: 3);
//Example 5 
func a(){}//void function
func b()->(){}//void function
func c()->Void{}//void function
//Example 6
func minus(_ n1:Double,and n2:Double)->Double{
    return n1-n2;
}
print(minus(9.1, and: 4.2));


