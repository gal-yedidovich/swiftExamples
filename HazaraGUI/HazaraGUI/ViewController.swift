import UIKit
class ViewController: UIViewController {
    //references
    @IBOutlet var bHalf:UIView!;
    @IBOutlet var speakerBtn:UIButton!;
    var volumeOn=true;//state toggler
    override func viewWillAppear(_ animated: Bool) {
        volume(speakerBtn);
    }
    @IBAction func volume(_ speakerBtn:UIButton){
        //different speaker by volume state
        speakerBtn.setTitle(
            (volumeOn ?"\u{1f50a}":"\u{1f507}")
            , for: .normal);
        volumeOn = !volumeOn;//toggle state
    }
    @IBAction func recolor(_ btn:UIButton){
        bHalf.backgroundColor = btn.backgroundColor;
    }
}
