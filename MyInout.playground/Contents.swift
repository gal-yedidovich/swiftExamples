//Example 1 
func squareIt(n: inout Int){
    n = n*n;
}
var n1 = 10;
print(n1);
squareIt(n: &n1);
print(n1);
//Example 2
func swapInts(n1: inout Int, n2: inout Int){
    let temp = n1;
    n1 = n2;
    n2 = temp;
}
var n2 = 5;
print("n1: \(n1), n2: \(n2)");
swapInts(n1: &n1, n2: &n2);
print("n1: \(n1), n2: \(n2)");


