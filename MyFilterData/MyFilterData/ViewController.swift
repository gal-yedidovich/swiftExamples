import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tbl:UITableView!;
    
    private var sweets,filtered:[String]!;
    
    override func viewDidLoad() {
        let file=Bundle.main.path(forResource: "sweets", ofType: "plist")!;
        sweets=NSArray(contentsOfFile: file) as! [String];
        filtered=[];
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reset();
    }
    
    @IBAction func filterData(_ t:UITextField){
        let txt=t.text!;
        if(txt.isEmpty){reset();return}
        filtered=[];
        for sweet in sweets {
            if(sweet.contains(txt)){
                filtered.append(sweet);
            }
        }
        tbl.reloadData();
    }
    
    private func reset(){
        filtered=sweets;
        tbl.reloadData();
    }
    
    //table data source methods:
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text=filtered[indexPath.row];
        return cell;
    }
    //table delegate method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true);
    }

}
