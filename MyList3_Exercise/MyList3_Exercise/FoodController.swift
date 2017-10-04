import UIKit
class FoodController : UIViewController{
    @IBOutlet var ttl:UILabel!;
    private var food="";//empty by default
    override func viewWillAppear(_ animated: Bool) {
        ttl.text = food;
    }
    func setFood(_ food:String){
        self.food = food;
    }
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil);
    }
}
