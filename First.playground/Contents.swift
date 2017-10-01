//Comment line
 /* 
    Comment block
 */



/*
   
  /*
    print("ma mazav");
  */
   print("bubu");

// */

//Statements: swift statements - semicolon isn't required
print("Statement")
print("bubu");

//Variables
var num:Int;//Int variable declaration with name: num
num=4;//initialization
var num2:Int=5;
var some=100;//Type wasn't declared - but implicitly declared by initialized value - of type Int
//Try: num="1"; some="2";
//concatinating values
print("The value of num: \(num) ");
var sum="1+3 = \(1+3) ";
print(sum)

var a,b,c:String;//multiple variable declaration
var dub:Double;
//Converting types:
dub = Double(num);
dub += 0.5;
num = Int(dub);
//Variable names:
var משתנה = "Mishtane";
var `var` = "var";
print("Both works with variables: \(משתנה) & \(`var`), but I strongly don't reccomend neither of those");
//constants - finals
let kavua = 1.4;
//Try: kavua=1.5;
let msg="Hello world";
print(msg);


//Conditions:
var n1=5,n2=3;
//Ex1
if n1>n2{
    print("gadol");
}

//Ex2
if n1==n2{
    print("shavim")
}else if n1<n2{
    print("katan")
}else{
    print("gadol")
}

//Ex3
if n1 != n2{
    print("lo shave");
}

//Ex4 
if !(n1==n2){
    print("lo shave");
}

//Ex5
var bubu:String;
if n1>n2{
    bubu="gadol"
}else{
    bubu="logadol";
}
var message=n1>n2 ? "gadol":"lo gadol";
print(message);//



