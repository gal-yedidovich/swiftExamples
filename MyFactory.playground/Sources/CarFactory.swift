public class CarFactory{
    public init(){}
    public func createCar(_ type:String)->Car?{
        //create & return Car instance by requested type
        switch (type.lowercased()){
            //supported types
            case "private","car":   return Private();
            case "bus"          :   return Bus();
            case "truck"        :   return Truck();
            //unsupported type
            default             :   return nil;
        }
    }
}
