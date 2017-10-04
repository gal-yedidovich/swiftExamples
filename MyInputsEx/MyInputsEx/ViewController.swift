import UIKit
class ViewController: UIViewController {
    
    @IBOutlet var uAge: UILabel!;
    @IBOutlet var uName: UITextField!;
    @IBOutlet var uPass: UITextField!;
    @IBOutlet var confPass: UITextField!;
    private var age=18,gender=User.Gender.MALE;
    
    
    @IBAction func ageChange(_ sender: UISlider) {
        age = Int(sender.value);
        uAge.text = "\(age)";
    }
    @IBAction func genderChange(_ sender: UISegmentedControl) {
        gender=User.Gender(rawValue: sender.selectedSegmentIndex)!;
    }
    
    @IBAction func save(_ sender: UIButton) {
        //basic validation
        if !uName.text!.isEmpty
           && !uPass.text!.isEmpty
           && confPass.text == uPass.text{
           //create User
           let u=User(name: uName.text!,
                         pass: uPass.text!,
                         age: age,
                         gender: gender);
           print("\(u.name)");
           print("\(u.pass)");
           print("\(u.age)");
           print("\(u.gender)");
        }
    }
    
    
}
