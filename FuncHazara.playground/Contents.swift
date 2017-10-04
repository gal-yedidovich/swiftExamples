//Ex - takes Int and return [Int]
func triNums(_ steps:Int)->[Int]?{
    var triNums:[Int]=[];//array of Ints
    for n in 1...steps {//iterate from 1 to steps
        triNums.append(n*(n+1)/2);//calc next triangular number
    }
    return triNums;//return
}

//Variadic 
func max(_ nums:Int...)->Int{
    var max=0;
    for n in nums {
        if max<n{
            max=n;
        }
    }
    return max;
}
print(max(70,80,90));

//Optionals ? !
func maybeInt(go:Bool)->Int?{
    if go{
        return 10;
    }
    return nil;
}

var x:Int?;//explicitly Optional Int
x = maybeInt(go: true);//return as wrapped Optional Int
var y = x;//implicitly Optional Int
y = 2;//Can contain Int
y = nil;//Can contain nil
//Unwrapping Optionals
//safe
if var a = x{//if not nil -> declare a
    print("unwrapped a: \(a)");
}
//unsafe 
var b = x!;//(shortcut)






