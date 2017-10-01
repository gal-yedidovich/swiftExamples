/* 

//Switch
var x=5;
//Example 1
switch(x){
    case 4:
        print("four");
    case 5:
        print("five");
        fallthrough;
    default:
        print("another");
}
//Example 2
switch(x){
    case 1,3,5:
        print("one,three,five");
    case 2,4:
        print("two,four");
    default:
        print("another");
}
//Example 3 - range
switch x {
    case 1...6:
        print("one to six");
    case 7:
        print("seven");
    case 8...16:
        print("eight to sixteen");
    default:
        print("another");
}

 
// */

//Loops - oops
//Example 1
while(true){
    if(true){
        break;
    }
}
//Example 2
var n=0;
while n<10{
    n+=1;
}
print(n);

//Example 3 - do while
repeat{
    n-=1;
}while(n>0);

//Example 4 - for in
for _ in 0...6{
    print("bubu");
}
//Example 5
for i in 5...7{
    print("Bubu \(i*3)");
}
















