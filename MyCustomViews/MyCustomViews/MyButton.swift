import UIKit
class MyButton : UIButton{
    //Example 4
    override func draw(_ rect: CGRect) {
        //customization on view instance (self)
        layer.backgroundColor = UIColor.magenta.cgColor;
        layer.cornerRadius = CGFloat(15);
    }
}
