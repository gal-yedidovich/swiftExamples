
import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var ttl: UILabel!;
    @IBOutlet var tbl: UITableView!;
    @IBOutlet var t:UITextField!;
    //simul DB
    var foods:[String:[String]]=[:];
    private var titles:[String]!;
    private var selectedFoods:[String]!;
    private var filtered:[String]=[];
    
    override func viewDidLoad() {
        let file=Bundle.main.path(forResource: "menu", ofType: "plist")!;
        foods=NSDictionary(contentsOfFile: file) as! Dictionary;
        titles=Array(foods.keys);//array of category titles
        reload(titles[0]);//default selection
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reset();
    }
    
    @IBAction func filterData(_ t:UITextField){
        let txt=t.text!;
        if(txt.isEmpty){reset();return}
        filtered=[];
        for food in selectedFoods {
            if(food.contains(txt)){
                filtered.append(food);
            }
        }
        tbl.reloadData();
    }
    
    private func reset(){
        filtered=selectedFoods;
        tbl.reloadData();
    }
    
    //reusable method - called when new category selected
    private func reload(_ category:String){
        selectedFoods=foods[category];
        filterData(t);
        tbl.reloadData();
        ttl.text="Total \(selectedFoods.count) \(category)";
    }
    //table methods:
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count;//how many rows in selected category
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = UITableViewCell();
        row.textLabel!.text=filtered[indexPath.row];//row for each food in selected category
        return row;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dialog=UIAlertController(title: filtered[indexPath.row], message: nil, preferredStyle: .alert);
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
        t.resignFirstResponder();//hide keyboard
    }
    
    
    
}
