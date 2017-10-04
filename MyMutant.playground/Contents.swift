struct Point{
    var x:Int;
    var y:Int;
    mutating func reborn(){
        self = Point(x:0,y:0);
    }
    mutating func notreally(){}
}
//tests
var p1 = Point(x: 3, y: 5);
print(p1);
p1.reborn();
print(p1);