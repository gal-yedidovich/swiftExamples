import UIKit
class MoviesViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var titles:[String]!;
    //when loaded - store array of movies titles
    override func viewDidLoad() {
        titles=MoviesModel.instance.getMoviesNames();
    }
    //go to order screen with selected data
    private func moveToOrder(_ selTitle:String){
        let orderScreen=storyboard!.instantiateViewController(withIdentifier: "order") as! OrderViewController;
        orderScreen.selTitle=selTitle;//pass selected title to next screen
        navigationController!.show(orderScreen, sender: self);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie=UITableViewCell();
        movie.textLabel?.text=titles[indexPath.row];
        return movie;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToOrder(titles[indexPath.row]);
    }
}
