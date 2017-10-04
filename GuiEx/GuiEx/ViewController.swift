import UIKit
class ViewController: UIViewController {
    //reference to main section view
    @IBOutlet var section: UIView!;
    //called when button pressed
    @IBAction func recolor(_ btn: UIButton) {
        section.backgroundColor = btn.backgroundColor;
    }
}
