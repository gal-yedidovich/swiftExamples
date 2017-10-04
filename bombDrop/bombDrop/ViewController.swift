import UIKit
class ViewController: UIViewController {
    var anim:UIDynamicAnimator!;
    var bomb:UIImageView!;
    let bSize=CGFloat(50);
    @IBOutlet var stars: UIImageView!
    @IBOutlet var sun: UIImageView!;
    @IBOutlet var dropBtn: UIButton!;
    @IBOutlet var detonateBtn: UIButton!;
    override func viewDidLoad() {
        anim=UIDynamicAnimator(referenceView: view);
    }
    @IBAction func dayNight(_ sender: UISegmentedControl) {
        let isDay = sender.selectedSegmentIndex==0;
        UIView.animate(withDuration: 1.5, animations: {
            self.view.backgroundColor = isDay ?UIColor.white:UIColor.black;
            self.sun.alpha = isDay ?1:0;//isDay - see sun
            self.stars.alpha = isDay ?0:1;//isDay - see stars
        });
    }
    @IBAction func drop(_ sender: UIButton) {
        dropBtn.isHidden=true;detonateBtn.isHidden=false;
        //pseudoRandom X position, inside the screen
        let xPos=CGFloat(arc4random_uniform(UInt32(view.frame.width-bSize)));
        //new imageView square at pseudoRandom horizontal position
        bomb=UIImageView(frame: CGRect(x: xPos, y: 0, width: bSize, height: bSize));
        bomb.image=UIImage(named: "bomb");
        view.addSubview(bomb);//make it visible
        let gravity=UIGravityBehavior(items: [bomb]);
        gravity.gravityDirection=CGVector(dx: 0.1, dy: 1);//slight angle falling
        anim.addBehavior(gravity);
        let coll=UICollisionBehavior(items: [bomb]);
        coll.translatesReferenceBoundsIntoBoundary=true;
        anim.addBehavior(coll);
    }
    @IBAction func detonate(_ sender: UIButton) {
        anim.removeAllBehaviors();
        bomb.image=UIImage(named: "boom");
        UIView.animate(withDuration: 0.5, animations: {
          self.bomb.alpha=0;
          self.bomb.transform=CGAffineTransform(rotationAngle: 1).concatenating(CGAffineTransform(scaleX: 8, y: 8));
            }, completion: {
                (x:Bool) in
                self.bomb.removeFromSuperview();//delete old view
                self.detonateBtn.isHidden=true; self.dropBtn.isHidden=false;
        });
    }
    
}
