import UIKit
class ViewController: UIViewController {

    
    @IBAction func toYellow(_ btn: UIButton) {
        //create instance of ViewController by given String
        let next = storyboard!.instantiateViewController(withIdentifier: "yellow");
        show(next, sender: self);
    }
    
    @IBAction func toRed(_ btn:UIButton){
        //create instance of ViewController by given String and Cast to RedController
        let next = storyboard!.instantiateViewController(withIdentifier: "red") as! RedController;
        //pass data
        next.setMsg("Bubu is the king");
        present(next, animated: false, completion: nil);
    }
    
}
