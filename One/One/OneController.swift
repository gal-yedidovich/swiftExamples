import UIKit
class OneController : UIViewController{
    var colors=[
        UIColor.red,
        UIColor.blue,
        UIColor.green,
        UIColor.yellow
    ];
    var i=0;
    
    //first - once -> onCreate
    override func viewDidLoad() {
        self.view.backgroundColor = recolor();
    }
    //second - everytime - before view shown
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = recolor();
    }
    //third - everytime - after view shown
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = recolor();
    }
    //fourth - everytime - before view hide
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    //fifth - everytime - after view hide
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    //User defined event handler - when button clicked
    @IBAction func recolor(_ btn:UIButton){
        self.view.backgroundColor = recolor();
    }
    //overloaded - method for color change
    private func recolor()->UIColor{
        i += 1;//increment
        if i >= colors.count {i=0}//if no longer valid - reset
        return colors[i];//use it
    }
    
    
}






