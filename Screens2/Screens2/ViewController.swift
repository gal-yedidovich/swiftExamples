import UIKit
class ViewController: UIViewController {
    
    @IBOutlet var mover: UISwitch!;
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toBlue"{//if our segue
            return mover.isOn;//check switch state
        }
        return true;//otherwise allow
    }
    
}
