import UIKit
class ViewController: UIViewController {
    @IBOutlet var input:UITextField!;
    @IBOutlet var output:UILabel!;
    let prefs = UserDefaults.standard;
    @IBAction func save(_ btn:UIButton){
        prefs.set(input.text!, forKey: "msg");
    }
    @IBAction func load(_ btn:UIButton){
        if let msg = prefs.string(forKey: "msg"){
            output.text=msg;
        }else{
            output.text = "no msg";
        }
    }
    @IBAction func del(_ btn:UIButton){
        prefs.removeObject(forKey: "msg");
    }
    
    
    
}






