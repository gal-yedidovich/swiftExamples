import UIKit
class GreenController : UIViewController{

    @IBAction func toBlue(_ btn:UIButton){
        //push next screen
        let next=self.storyboard!.instantiateViewController(withIdentifier: "blue");
        self.show(next, sender: self);
    }
    
    @IBAction func toRed(_ btn:UIButton){
        //pop to previous screen
        self.navigationController!.popViewController(animated: true);
    }
    
}
