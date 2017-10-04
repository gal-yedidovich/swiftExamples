import UIKit
class MyDrawView : UIView{
    override func draw(_ rect: CGRect) {
        //rect => frame => canvas of view
        let h=rect.height, w=rect.width;
        print("canvas width: \(w), height: \(h)");
        //CGContext to draw with
        let c=UIGraphicsGetCurrentContext()!;
        typealias p = CGPoint;
        /*
        //Example 1
        //starting point
        c.move(to: CGPoint(x: 0, y: 0));
        //line to ending point
        c.addLine(to: CGPoint(x: rect.width, y: rect.height));
        //How to draw
        c.setStrokeColor(UIColor.red.cgColor);
        c.setLineWidth(CGFloat(3));
        c.strokePath();//draw
        / * /
        //Example 2
        c.move(to: p(x:10,y:30));
        //what to draw
        c.addLine(to: p(x:10, y:100));
        c.addLine(to: p(x:150, y:100));
        c.addLine(to: p(x:150, y:30));
        c.addLine(to: p(x:80, y:0));
        c.addLine(to: p(x:10, y:30));//close path
        //how to draw
        c.setFillColor(UIColor.green.cgColor);
        c.fillPath();//draw
        // * /
        //Example 3 - arc
        let center=p(x: rect.width/2, y: rect.height/2);
        //PI/180*degrees
        c.addArc(center: center,
                 radius: rect.width/4,
                 startAngle: CGFloat(M_PI/180*360),
                 endAngle: CGFloat((M_PI/180)*0),
                 clockwise: true);
        c.setStrokeColor(UIColor.blue.cgColor);
        c.strokePath();//draw
        c.addArc(center: center, radius: rect.width/6, startAngle: CGFloat(M_PI), endAngle: 0, clockwise: true);
        c.strokePath();//draw
        / * /
        //Example 4 - curves
        c.setStrokeColor(UIColor.red.cgColor);
        c.setLineWidth(2);
        c.move(to: p(x:100,y:250));//starting point
        c.addQuadCurve(to: p(x:200,y:250), control: p(x:150,y:200));
        c.addQuadCurve(to: p(x:200,y:150), control: p(x:150,y:200));
        c.addQuadCurve(to: p(x:100,y:150), control: p(x:150,y:200));
        c.addQuadCurve(to: p(x:100,y:250), control: p(x:150,y:200));
        c.strokePath();
        / */
        //Example 5
        let points:[[p]]=[
            [p(x:240,y:0),p(x:315,y:25)],
            [p(x:265,y:25),p(x:265,y:63)],
            [p(x:265,y:100),p(x:290,y:100)],
            [p(x:290,y:120),p(x:270,y:125)],
            [p(x:300,y:120),p(x:305,y:100)],
            [p(x:365,y:100),p(x:365,y:63)],
            [p(x:365,y:25),p(x:315,y:25)]
        ];
        // * /
        //Example 6 - draw image
        let img = UIImage(named: "deadpool")!;
        let imgFrame = CGRect(x:10, y:10, width:w-20, height:h-20);
        img.draw(in: imgFrame);
        draw(points: points, onContext: c);
        
        // */
    }
    private func draw(points:[[CGPoint]], onContext c:CGContext){
        c.setLineWidth(3);
        c.move(to: points[0][1]);
        for p in points{
            c.addQuadCurve(to: p[1], control: p[0]);
        }
        c.strokePath();
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let t=touches.first!;//UITouch object
        let p=t.location(in: self);//CGPoint location in this view
        print("touched at (\(p.x),\(p.y))");
    }
}



