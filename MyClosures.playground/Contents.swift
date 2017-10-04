//Closures examples
var e=Executer();
//Example 1 - predefined function
func task1(){
    let msg="Passed message";
    print(msg);
}
e.execute(task: task1);
//Example 2 - predefined function & capture
var num=0;
func task2()->(){
    let n1=1;
    let n2=2;
    num=n1+n2;
}
e.execute(task: task2);
print(num);
//Example 3 - shorter closure syntax
e.execute(task: {()->() in
    print("Passed msg 2");
});
//Example 4 - even shorter...
e.execute(task: {print("Passed 4")});
//How many tasks executed untill now:
print(e.totalTasks);
//Example 5 - 
var result:Double;
func multiply(n1:Double,n2:Double)->Double{
    return n1*n2;
}
result=e.calc(n1: 2.5, n2: 9.25, oper: multiply);
print(result);

//Example 6 - shorter
result=e.calc(n1: 1, n2: 3.5, oper: {(n1:Double,n2:Double)->Double in
    return n1*n2;
});
print(result);
//Example 7 - shortcut Infered type
result=e.calc(n1: 2, n2: 4.7, oper: {(n1,n2)in
    return n1*n2;
});
print(result);
//Example 8 - shortcut++ Infer type + implicit return
result=e.calc(n1: 3, n2: 4, oper: {(n1,n2)in n1*n2});
print(result);
//Example 9 - shortcut++++ Infer type + implicit return + default arguments
result=e.calc(n1: 1.2, n2: 2.5, oper: {$0*$1});
print(result);

//Exercise: minus,divide,plus
func plus(n1:Double,n2:Double)->Double{
    return n1+n2;
}
result=e.calc(n1: 0.5, n2: 1.5, oper: plus);
print(result);
result=e.calc(n1: 0.3, n2: 0.1, oper: {(n1,n2)in n1/n2});
print(result);
result=e.calc(n1: 123, n2: -123, oper: {$0-$1});
print(result);





