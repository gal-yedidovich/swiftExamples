import UIKit
class ViewController: UIViewController {
    
    @IBOutlet var uMsg:UITextField!;
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passing Data to next screen
        //(segue.destination as! SecondController).setMsg(uMsg.text!)
        //same functionality - but more readable
        if segue.identifier == "toSecond"{
            let next = segue.destination;
            if next is SecondController{
                let second = next as! SecondController;
                second.setMsg(uMsg.text!);
            }
        }
    }
}
