import  UIKit
class RedController : UIViewController{
    
    private var msg:String="";
    
    override func viewDidAppear(_ animated: Bool) {
        print(msg)
    }
    
    
    func setMsg(_ msg :String){
        self.msg = msg;
    }

}
