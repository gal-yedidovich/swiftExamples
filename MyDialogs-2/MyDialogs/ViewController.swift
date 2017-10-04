
import UIKit

class ViewController: UIViewController {

    @IBOutlet var traDialog: UIView!;
    @IBOutlet var traDiMsg: UILabel!;
    
    override func viewDidLoad() {
        
    }

    @IBAction func tradiOk(_ sender: UIButton) {
        //hide dialog
        traDialog.isHidden=true;
    }
    //example 1
    @IBAction func showD1(_ sender: UIButton) {
        //show dialog
        traDialog.isHidden=false;
    }
    //example 2 -
    @IBAction func showD2(_ sender: UIButton) {
        let alert=UIAlertController(title: "Dialog 2", message: "Hello from dialog", preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil));
        show(alert, sender: self);
    }
    //example 3-
    @IBAction func showD3(_ sender: UIButton) {
        let alert=UIAlertController(title: "Dialog 3", message: nil, preferredStyle: .alert);
        //default text field
        alert.addTextField(configurationHandler: nil);
        //cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil));
        //ok button
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alertAction)in
            //get all textFields
            let fields=alert.textFields!;
            //print what user entered
            print("User said: \(fields[0].text!)");
            self.traDiMsg.text=fields[0].text;
            self.traDialog.isHidden=false;
        }));
        present(alert, animated: true, completion: nil);
    }
    //example 4 -
    @IBAction func showD4(_ sender: UIButton) {
        let alert=UIAlertController(title: "Login", message: nil, preferredStyle: .alert);
        var uName,uPass:UITextField!;
        alert.addTextField(configurationHandler: {(input)in
            uName=input;//store reference to uName
            //placeholder is equivalent to androids hint
            uName.placeholder="user name";//customize
        });
        alert.addTextField(configurationHandler: {(input)in
            uPass=input;//store reference to uPass
            uPass.placeholder="password";//customize
            uPass.isSecureTextEntry=true;
        });
        //okHandler - defined in the same scope with alert
        func okHandler(action:UIAlertAction){
            if(uName.text=="Liri" && uPass.text=="123"){
                traDialog.isHidden=false;
                traDiMsg.text="welcome Liri";
            }
        }
        //buttons:
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: okHandler));
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil));
        present(alert, animated: true, completion: nil);
    }
}






