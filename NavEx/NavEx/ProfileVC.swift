import UIKit
class ProfileVC: UIViewController {
    
    @IBOutlet var uPass: UITextField!;
    @IBOutlet var colors: UISegmentedControl!;
    
    override func viewWillAppear(animated: Bool) {
        //when shown
        //locally store - logged user object
        let lUser=Shared.users[Shared.loggedUser!];
        //assign current password
        uPass.text = lUser!.pass;
        //assign current pref color
        colors.selectedSegmentIndex = lUser!.prefColor;
    }
    
    @IBAction func changeColor(sender: UISegmentedControl) {
        Shared.users[Shared.loggedUser!]!.prefColor = sender.selectedSegmentIndex;
    }
    
    //back to home
    @IBAction func back(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true);
    }
}