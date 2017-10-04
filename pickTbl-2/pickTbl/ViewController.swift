
import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var ttl: UILabel!;
    @IBOutlet var tbl: UITableView!;
    //simul DB
    var foods:[String:[String]]=[:];
    private var titles:[String]!;
    private var selectedFoods:[String]!;
    
    override func viewDidLoad() {
        let file=Bundle.main.path(forResource: "menu", ofType: "plist")!;
        foods=NSDictionary(contentsOfFile: file) as! Dictionary;
        titles=Array(foods.keys);//array of category titles
        reload(titles[0]);//default selection
    }
    //reusable method - called when new category selected
    private func reload(_ category:String){
        selectedFoods=foods[category];
        tbl.reloadData();
        ttl.text="Found \(selectedFoods.count) \(category)";
    }
    //table methods:
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedFoods.count;//how many rows in selected category
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = UITableViewCell();
        row.textLabel!.text=selectedFoods[indexPath.row];//row for each food in selected category
        return row;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dialog=UIAlertController(title: selectedFoods[indexPath.row], message: nil, preferredStyle: .alert);
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
        show(dialog, sender: self);
    }
    //picker methods:
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titles.count;//how many categories
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titles[row];
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        reload(titles[row]);//when new category selected
    }
    
}
