public class Singy{
    //instance variable
    public var name="Singy A";
    //stored Singy class instance
    private static var instance:Singy?;
    //to prevent instantiation from outside
    private init(){}
    public static func getInstance()->Singy{
        //if not yet exists
        if Singy.instance == nil{
           //create & store statically
           Singy.instance = Singy();
        }
        //return to caller
        return Singy.instance!;
    }
}
