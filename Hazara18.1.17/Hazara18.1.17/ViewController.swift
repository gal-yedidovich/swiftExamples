import UIKit
class ViewController: UIViewController {

    private var movieImgs:[UIImage] = [
        UIImage(named: "lala")!,
        UIImage(named: "xxx")!,
        UIImage(named: "wolvi")!
    ];
    
    @IBOutlet var img: UIImageView!;
    
    @IBAction func movieChose(_ sender: UISegmentedControl) {
        img.image = movieImgs[sender.selectedSegmentIndex];
    }
    
}
