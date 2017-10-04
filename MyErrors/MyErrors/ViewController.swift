import UIKit
class ViewController: UIViewController {
    let e = MyErrors();
    override func viewDidLoad() {
        //Example 1
        do{
            //can have multiple tries in the same block
            try e.notReallyBad();
            try e.doSomeBad();
            //success handling
        }catch{
            //failure handling
            print("error handler");
        }
        
        //Example 2 - multiple catch block
        do{
            try e.goToWork();
        }catch MyErrors.WorkError.isSunday{
            print("need more sleep");
        }catch MyErrors.WorkError.notEnoughSleep{
            print("Drink more coffee");
        }catch MyErrors.WorkError.notEnoughCoffee{
            print("At this point, there is not much you can do...");
        }catch{
            print("Another error..");
        }
        
        //Example 3 - defer cleanups
        do{
            try e.badAndClean();//use defer
        }catch{
            print("");
        }
        
        //Example 4 - inline syntax
        try! e.notReallyBad();//if thrown - crash
        try? e.notReallyBad();//if thrown - return nil
        
    }
    @IBAction func bad(_ btn:UIButton){
        do{
            try e.doSomeBad();
        }catch{
            print("Bad catched");
        }
    }
    @IBAction func notBad(_ btn:UIButton){
        try? e.notReallyBad();//
    }
    @IBAction func badOrNot(_ btn:UIButton){
        try! e.badOrNot();//
    }
    
}








