import UIKit
class ViewController: UIViewController {
    @IBOutlet var uName:UITextField!;
    @IBOutlet var uPass:UITextField!;
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        return Shared.users[uName.text!]?.pass==uPass.text;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //called after shouldPerformSegue...
        Shared.loggedUser=uName.text;//store logged user
    }
    
}

