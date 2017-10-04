import UIKit
class SecondController : UIViewController {
    @IBOutlet var ttl:UILabel!;
    //encapsulated property
    private var msg:String="";
    //before screen is visible
    override func viewWillAppear(_ animated: Bool) {
        ttl.text = msg;//display passed message
    }
    //accessible setter - to passing data through
    func setMsg(_ msg:String){
        self.msg = msg;
    }
}
