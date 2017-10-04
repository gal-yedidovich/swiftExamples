//Optionals?!
var x:Int;
x=1;
//cannot assign nil to Int - because object aren't nillable by default
//try: x=nil;
var y:Int?;
y=1;
y=nil;
y=2;

//Un-wrap Optional
//safe
if var num=y{//if not nil - declare num
    print("unwrapped num: \(num)");
}
//unsafe
x=y!;//shortcut unwrap

