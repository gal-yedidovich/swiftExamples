
import UIKit

class HomeVC: UIViewController {
    @IBOutlet var btn:UIButton!;
    override func viewWillAppear(animated: Bool) {
        btn.setTitle(Shared.loggedUser!, forState: .Normal);
    }
}