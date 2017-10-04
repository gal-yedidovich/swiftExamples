import UIKit
class CirclesView: UIView {
    var con:CGContext!;
    var colors=[UIColor.black.cgColor,UIColor.white.cgColor];
    var mCenter:CGPoint!;
    var offSet:CGFloat!;
    override func draw(_ rect: CGRect) {
        con=UIGraphicsGetCurrentContext();
        offSet=rect.width/10;//tenth of canvas width
        mCenter=CGPoint(x:rect.width/2,y:rect.height/2);
        drawCircle(5, radius: mCenter.x);
    }
    ///Void function that draws circle with given radius on current context and recursivelly calls it's with count down
    /// @param: `count` how many circles left to draw
    /// @param: `radius` radius for currently drawn circle
    func drawCircle(_ count:Int, radius r:CGFloat){
        if count==0{return}//draw until count resets
        con.setFillColor(count%2==0 ?colors[1]:colors[0]);
        con.addArc(center: mCenter, radius: r, startAngle: CGFloat(M_PI/180*360), endAngle: 0, clockwise: true);
        con.fillPath();
        drawCircle(count-1, radius: r-offSet);
    }

}
