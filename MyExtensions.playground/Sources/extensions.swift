//Example 1 - custom class
extension Person{
    public func getName() -> String{
        return self.name;
    }
    public func setName(_ name:String){
        self.name = name;
    }
}
//Example 2 - built in 
extension Int{
    public func timesTwo()->Int{
        return self+self;
    }
    //mutating...
}
//Example 3 - Inheritance
extension Person : LivingBeing{
    public func breath() {
        
    }
}
//Example 4 - computed properties
extension Bike{
    //Calculated on the fly
    public var hp:Double{
        return cc / 3;
    }
}






