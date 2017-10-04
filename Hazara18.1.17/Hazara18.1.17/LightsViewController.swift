import UIKit
class LightsViewController:  UIViewController {
    //Interface Builder references
    @IBOutlet var square: UIView!;
    @IBOutlet var blue: UISlider!;
    @IBOutlet var green: UISlider!;
    @IBOutlet var red: UISlider!;
    //encapsulated flag & typealias
    private var isOn=true;
    typealias cgf = CGFloat;
    //event handlers
    @IBAction func onOff(_ sender: UISwitch) {
        isOn = sender.isOn;
        color();
    }
    @IBAction func dimmer(_ sender: UISlider) {
        color();
    }
    //encapsulated functionality
    private func color(){
        square.backgroundColor = !isOn ?
            UIColor.black:
            UIColor(red: cgf(red.value), green: cgf(green.value), blue: cgf(blue.value), alpha: 1);
    }
}
