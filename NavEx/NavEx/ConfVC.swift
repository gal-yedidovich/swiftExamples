import UIKit
class  ConfVC: UIViewController {
    
    @IBOutlet var ttl: UILabel!;
    
    override func viewWillAppear(animated: Bool) {
        ttl.text=Shared.loggedUser;
    }
    
    @IBAction func back(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true);
    }
    
    @IBAction func logOut(sender: UIButton) {
        Shared.loggedUser=nil;
        navigationController!.popToRootViewControllerAnimated(true);
    }
}