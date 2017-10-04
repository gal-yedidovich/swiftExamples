import UIKit
class TrianglesView: UIView {
    var con:CGContext!;
    override func draw(_ rect: CGRect) {
        //context, lineWidth & color doesn't change so we declare at start
        con=UIGraphicsGetCurrentContext();
        con.setLineWidth(3.0);
        con.setStrokeColor(UIColor.red.cgColor);
        //starting drawing 6 triangles on max rect(canvas) size
        drawTriangle(6, a:CGPoint(x:rect.width/2,y:0), b: CGPoint(x:0,y:rect.height), c: CGPoint(x:rect.width,y:rect.height));
    }
    ///Void function that draws trianlge between given point a,b & c on given context and recursivelly calls it's with count down
    /// @param:`count` how many triangles left
    /// @param:`a` first point coordinates (x,y)
    /// @param:`b` second point coordinates (x,y)
    /// @param:`c` third point coordinates (x,y)
    func drawTriangle(_ count:Int, a:CGPoint,b:CGPoint,c:CGPoint){
        if count==0{return}//draw until count resets
        con.move(to: a);//start
        con.addLine(to: b);
        con.addLine(to: c);
        con.addLine(to: a);
        con.strokePath();
        drawTriangle(count-1, a:midBetween(a, and: b), b: midBetween(b, and: c), c: midBetween(c, and: a));//draw next triangle
    }
    ///calculates and returns middle point between two given points
    ///calculation formula: midX=((x1+x2)/2) midY=((y1-y2)/2)
    /// @param`p1` first point coordinates (x,y)
    /// @param`p2` second point coordinates (x,y)
    /// @return: CGPoint with middle point's coordinates as (x,y)
    func midBetween(_ p1:CGPoint, and p2: CGPoint)->CGPoint{
        return CGPoint(x:(p1.x+p2.x)/2,y:(p1.y+p2.y)/2);
    }
}
