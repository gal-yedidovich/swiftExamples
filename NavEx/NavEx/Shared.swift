import UIKit
class Shared{
    static var colors:[UIColor]=[
        UIColor.cyanColor(),
        UIColor.magentaColor(),
        UIColor.whiteColor()
    ]
    static var loggedUser:String?;
    static var users:[String:User]=[
        "Bubu":User(name:"Bubu",pass: "123"),
        "Groot":User(name:"Groot",pass: "qwerty"),
        "Deadpool":User(name:"Deadpool",pass: "312"),
    ];
}