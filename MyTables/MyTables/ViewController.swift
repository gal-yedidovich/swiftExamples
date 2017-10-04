import UIKit
class ViewController: UIViewController, UITableViewDataSource {
    //how many sections (sub lists) in table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    //how many rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    //Visual representation of each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = UITableViewCell();
        row.textLabel?.text = "Bubu is the king";
        return row;
    }
}
