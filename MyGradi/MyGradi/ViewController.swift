import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        //grad1();
        //grad2();
        grad3();
    }
    
    //Example 1
    private func grad1(){
        //in iOS gradient is a sort of layer
        let layer=CAGradientLayer();
        //gradient colors
        layer.colors = [
            UIColor.red.cgColor,//start color
            UIColor.blue.cgColor,//end color
        ];
        //reuse CGRect of view
        layer.frame=view.frame;
        layer.frame.origin = CGPoint(x: 0, y: 0);
        //add gradient layer to existing list of layers of the view
        view.layer.insertSublayer(layer, at: 0);
    }
    //Example 2
    private func grad2(){
        let l=CAGradientLayer();
        l.colors=[
            UIColor.red.cgColor,
            UIColor.blue.cgColor,
            UIColor.red.cgColor,
        ];
        //peak points
        l.locations=[0.1, 0.3, 0.8];
        let s=view.frame.size;
        l.frame = CGRect(
            origin: CGPoint(x:0, y:0),
            size:   CGSize(width:s.width, height:s.height)
        );
        view.layer.addSublayer(l);
    }
    //Example 3
    private func grad3(){
        let l=CAGradientLayer();
        l.colors=[UIColor.red.cgColor, UIColor.cyan.cgColor];
        //Directions:
        l.startPoint=CGPoint(x: 0, y: 0);
        l.endPoint=CGPoint(x: 1, y: 1);
        l.frame.size=view.frame.size;
        l.frame.origin.x=0;
        l.frame.origin.y=0;
        view.layer.addSublayer(l);
    }
    
}





