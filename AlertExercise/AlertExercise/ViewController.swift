

import UIKit

class ViewController: UIViewController {

    @IBOutlet var profilBtn: UIButton!;
    var myUsers:[String:String]!;
    var prefs=UserDefaults.standard;
    
    
    override func viewDidLoad() {
        //users data from plist
        myUsers=NSDictionary(contentsOfFile: Bundle.main.path(forResource: "users", ofType: "plist")!) as! [String:String];
    }
    
    override func viewDidAppear(_ animated: Bool) {
        profilBtn.isHidden=true;
        //check if user is loggedIn already?
        if let logUser=prefs.string(forKey: "logUser"){
            //set text on button
            profilBtn.setTitle(logUser, for: .normal);
        }else{
            //if not:
            alertLogIn();
        }
    }
    func alertLogIn(){
        let dialog=UIAlertController(title: "Log In", message: "Please sign in", preferredStyle: .alert);
        //Ok button handler
        func okHandler(act:UIAlertAction!){
            // user authentication
            let vals=dialog.textFields!;
            let uName=vals[0].text!;
            if myUsers[uName]==vals[1].text{
                //legal user -> save as logUser
                prefs.set(uName, forKey: "logUser");
                //set text on button
                profilBtn.setTitle(uName, for: .normal);
                profilBtn.isHidden=false;
            }else{
                //wrong user
                alertLogIn();
            }
        }
        //2 input fields
        dialog.addTextField(configurationHandler: {(tf)in
            tf.placeholder="username";
        });
        dialog.addTextField(configurationHandler: {(tf)in
            tf.placeholder="password";
            tf.isSecureTextEntry=true;
        });
        //2 buttons
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: okHandler));
        dialog.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil));
        //show it
        present(dialog, animated: true, completion: nil);
    }

}

