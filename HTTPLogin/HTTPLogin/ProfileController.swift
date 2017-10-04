import UIKit

class ProfileController : UIViewController {
    
    @IBOutlet var ttl:UILabel!;
    @IBOutlet var info:UILabel!;
    
    private var json:[String:Any]=[:];
    
    override func viewWillAppear(_ animated: Bool) {
        ttl.text = json["name"] as! String!;
        info.text = json["info"] as! String!;
    }
    
    public func setJson(json:[String:Any]){
        self.json=json;
    }
    
}
