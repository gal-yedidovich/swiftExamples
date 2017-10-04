import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //local data containers
    var foods:[String:[String]]!;
    var keys:[String]!;
    override func viewDidLoad() {
        let path=Bundle.main.path(forResource: "Foods", ofType: "plist")!;
        foods=NSDictionary(contentsOfFile: path) as! Dictionary;
        keys=Array(foods.keys);
    }
    //data source methods:
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods[keys[section]]!.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row=UITableViewCell();
        row.textLabel!.text=foods[keys[indexPath.section]]![indexPath.row];
        return row;
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //get relevant food key
        let key = keys[section];
        //Total 3 fruits...
        return "Total \(foods[key]!.count) \(key)";
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //move to food screen
        let foodScreen = storyboard!.instantiateViewController(withIdentifier: "FoodScreen") as! FoodController;
        //set chosen food
        foodScreen.setFood( foods[keys[indexPath.section]]![indexPath.row]);
        //move to food screen
        show(foodScreen, sender: self);
    }
    
}
