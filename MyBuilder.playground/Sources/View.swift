public class View{
    var color="White";
    var width=0;
    var height=0;
    var x=0;
    var y=0;
    public init(){}
    public func show(){
        print("\(color) View(\(width)x\(height)) at \(x),\(y)");
    }
    public func setX(_ x:Int)->View{
        self.x = x;
        return self;
    }
    public func setY(_ y:Int)->View{
        self.y = y;
        return self;
    }
    public func setWidth(_ width:Int)->View{
        self.width = width;
        return self;
    }
    public func setHeight(_ height:Int)->View{
        self.height = height;
        return self;
    }
    public func setColor(_ color:String)->View{
        self.color = color;
        return self;
    }
    public func setSize(width:Int,height:Int)->View{
        self.width=width;
        self.height=height;
        return self;
    }
    public func setOrigin(x:Int,y:Int)->View{
        self.x=x;
        self.y=y;
        return self;
    }
}
