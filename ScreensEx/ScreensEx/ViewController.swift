import UIKit
class ViewController: UIViewController {
    
    @IBOutlet var userBtn: UIBarButtonItem!;
    @IBOutlet var uName: UITextField!;
    @IBOutlet var uPass: UITextField!;
    @IBOutlet var benny: UIView!;
    
    
    //db simul
    let users:[String:String]=[
       "Bubu":"123",
       "Shiri":"deadpool"
    ];
    
    @IBAction func tryLogin(_ btn: UIButton) {
        let uName=self.uName.text!;
        if users[uName] == uPass.text!{//valid
            //bar button
              userBtn.isEnabled = true;
                  userBtn.title = uName;
            //login form views
            self.benny.isHidden = true;
            view.endEditing(true);
        }
    }
    
    
}





