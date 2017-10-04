import UIKit
class ViewController: UIViewController {
    
    @IBOutlet var feed: UILabel!;
    private let texts:[String]=[
        "Groot is awesome",
        "Bubu is great",
        "Shiri is hyperactive"
    ];
    
    @IBAction func sliderChange(_ slider : UISlider) {
        feed.alpha=CGFloat(slider.value);//
    }
    @IBAction func switchChange(_ switcher : UISwitch){
        feed.isHidden = !switcher.isOn;
    }
    
    @IBAction func stepChange(_ step: UIStepper) {
        feed.text = "\(step.value)";
    }
    
    @IBAction func segmentChange(_ seg: UISegmentedControl) {
        feed.text = texts[seg.selectedSegmentIndex];
    }
    
}







