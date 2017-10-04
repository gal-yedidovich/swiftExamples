import UIKit
class ViewController: UIViewController {
    
    @IBOutlet var traDialog:UIView!;
    @IBOutlet var tdMsg:UILabel!;
    //example 1
    @IBAction func show1(_ btn:UIButton){
        //toggle visibility of old school dialog
        traDialog.isHidden = !traDialog.isHidden;
    }
    //Example 2
    @IBAction func show2(_ btn:UIButton){
        //after iOS 8 (today 10 already) use UIAlertController
        let alert=UIAlertController(title: "Dialog 2", message: "Hello from dialog", preferredStyle: .alert);
        alert.addAction(//to add a simple button
            UIAlertAction(title: "Ok",//with title "ok"
                          style: .default,//with default style
                          handler: nil)//without custom handler
        );
        //show alert dialog to user
        show(alert, sender: self);
    }
    //Example 3
    @IBAction func show3(_ btn:UIButton){
        let alert=UIAlertController(title: "Dialog 3", message: nil, preferredStyle: .alert);
        //add default text field
        alert.addTextField(configurationHandler: nil);
        //add ok button
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alertAction)in
            //get all fields from alert
            let fields=alert.textFields;
            //get text from first field
            let txt=fields![0].text!;
            print("Ok \(txt)");
            self.showTdMsg(txt);
        }));
        //add cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil));
        //show to user
        present(alert, animated: true, completion: nil);
    }
    //Example 4
    @IBAction func show4(_ btn:UIButton){
        let alert=UIAlertController(title: "Login", message: nil, preferredStyle: .alert);
        var uName,uPass:UITextField!;
        //user name text field
        alert.addTextField(configurationHandler: {(input)in
            uName=input;//store in uName
            input.placeholder="username";//customize
        });
        //user password text field
        alert.addTextField(configurationHandler: {(tf:UITextField) in
            uPass=tf;//store in uPass
            uPass.placeholder="password";
            uPass.isSecureTextEntry=true;
        });
        //okHandler - defined in the same scope as alert
        func okHandler(action:UIAlertAction)->Void{
            if(uName.text=="Lilach" && uPass.text=="1234"){
                self.showTdMsg("Welcome Lilach");
            }
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: okHandler));
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil));
        present(alert, animated: true, completion: nil);
    }
    private func showTdMsg(_ msg:String){
        tdMsg.text=msg;
        traDialog.isHidden=false;
    }

}









