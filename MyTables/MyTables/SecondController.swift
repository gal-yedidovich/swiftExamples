import UIKit
class SecondController : UIViewController, UITableViewDataSource{
    //db simul
    let stuff:[[String]] = [
       ["Tuna","Avocado","Omelet","Salmon","Shakuka","Choco"],
       ["iPhone 6s", "Sendo", "Nokia", "Galaxy", "Motorola V6"],
       ["Pamela", "Apple", "Banana", "Strawberry"]
    ];
    func numberOfSections(in tableView: UITableView) -> Int {
        //section for each inner array
        return stuff.count;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //row for each String
        return stuff[section].count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        //Assign relevant String by given section & row index
        cell.textLabel!.text=stuff[indexPath.section][indexPath.row];
        return cell;
    }
}
