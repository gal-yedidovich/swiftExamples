
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btn1: GBtn!;
    @IBOutlet var btn2: GBtn!;
    @IBOutlet var btn3: GBtn!;
    @IBOutlet var section: UIView!;
    
    override func viewDidLoad() {
        //assign gradient colors to buttons
        gcBtns(btns: btn1, btn2, btn3);
    }
    
    @IBAction func recolor(_ btn: UIButton){
        let l=CAGradientLayer();
        l.colors=(btn.layer.sublayers![0] as! CAGradientLayer).colors;
        l.frame.size=section.layer.frame.size;
        section.layer.addSublayer(l);
    }
    
    func gcBtns(btns:GBtn...){
        var c=2;
        for b in btns{
            let l=CAGradientLayer();
            l.colors=[UIColor.red.cgColor, UIColor.blue.cgColor];
            if c>0{//some gradient color logic
                c-=1;
                l.colors![c]=UIColor.green.cgColor;
            }
            let bs=b.layer.frame.size;
            l.frame.size=CGSize(width:bs.width-4,height:bs.height-4);
            l.frame.origin=CGPoint(x: 2,y: 2);
            b.layer.insertSublayer(l, at: 0);
        }
    }
    
    

}
