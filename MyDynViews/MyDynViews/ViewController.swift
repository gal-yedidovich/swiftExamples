import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        //dyn1();
        //dyn2();
        dyn3();
        dyn4();
    }
    //Example 1
    private func dyn1(){
        let origin=CGPoint(x: 40, y: 20);
        let size=CGSize(width: 50, height: 50);
        //CGRect => width * height AT (x,y)
        let frame=CGRect(origin: origin, size:size);
        let square=UIView(frame: frame);//view with given CGRect
        square.backgroundColor=UIColor.red;
        view.addSubview(square);//show to user
    }
    //Example 2
    private func dyn2(){
        let ttl=UILabel(frame: CGRect(x: 20, y: 60, width: 150, height: 50));
        ttl.text="Roei";
        ttl.textAlignment = .center;
        ttl.layer.borderWidth=1;
        view.insertSubview(ttl, at: 0);
    }
    //Example 3
    private func dyn3(){
        let btn = UIButton();
        btn.addTarget(self, action: #selector(onClick), for: .touchUpInside);
        btn.setTitle("Lichi", for: .normal);
        btn.setTitleColor(UIColor.red, for: .highlighted);
        btn.setTitleColor(UIColor.green, for: .normal);
        btn.sizeToFit();//wrap current content
        let vs=view.frame.size;
        btn.frame.origin.x = vs.width/2 - btn.frame.size.width/2;//left
        btn.frame.origin.y = vs.height/5;//top
        view.addSubview(btn);
    }
    //Example 4
    private func dyn4(){
        let movies=["John wick", "Logan", "Ted", "Up", "ET"];
        var y:CGFloat = view.frame.size.height/8;
        for m in movies{
            let ttl=UILabel();
            ttl.text=m;//assign relevante text
            ttl.sizeToFit();//wrap content
            ttl.frame.origin.x=10;//x position
            ttl.frame.origin.y=y;//last stored y position
            view.addSubview(ttl);//show to user
            y+=ttl.frame.size.height;//increment last y position
        }
    }
    //Example 5
    var toggle=false;
    func onClick(btn:UIButton){
        print("clicked");
        toggle = !toggle;
        if toggle{
            for v in view.subviews{//iterate all subviews
                if v is UILabel{//each one that is lable
                    v.removeFromSuperview();//remove
                }
            }
        }else{
            dyn4();
        }
    }
}



















