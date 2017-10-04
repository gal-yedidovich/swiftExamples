import UIKit
class ProfileViewController: UIViewController {
    var prefs=UserDefaults.standard;
    @IBOutlet var ttl: UILabel!;
    override func viewDidLoad() {
        
        //if there is logged user -> show it
        if let logUser=prefs.string(forKey: "logUser"){
            ttl.text="welcome \(logUser)";
        }
    }
    //when logOut
    @IBAction func logout(_ sender: UIButton){
        //remove logged user
        prefs.removeObject(forKey: "logUser");
        //finish view controller
        dismiss(animated: true, completion: nil);
    }
}
