import UIKit
class ViewController: UIViewController {
    //reference to TextField (EditText)
    @IBOutlet var input:UITextField!;
    //when cancel clicked
    @IBAction func cancel(_ btn:UIButton){
        //focus out from input
        input.resignFirstResponder();
    }
    //when screen touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //focus out from any editing fields
        view.endEditing(true);
    }
    //when return key clicked - Event(UIControlEvents.editingDidEndOnExit)
    @IBAction func done(_ textField:UITextField){
        print(textField.text!);
    }
    
}
