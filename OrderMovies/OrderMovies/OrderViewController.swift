import UIKit
class OrderViewController: UIViewController {
    @IBOutlet var ttl: UILabel!;
    @IBOutlet var img: UIImageView!;
    @IBOutlet var desc: UITextView!;
    var selTitle:String!;
    private var movie:Movie!;
    private var movieModel:MoviesModel!;
    //at first (once) - store model object
    override func viewDidLoad() {
        movieModel=MoviesModel.instance;
    }
    //second every time - store current Movie object
    override func viewWillAppear(_ animated: Bool) {
        movie=movieModel.getMovie(forTitle:selTitle);
        ttl.text=movie.name;
        desc.text=movie.desc;//Description text
        img.image=UIImage(named: movie.img);//Image name
    }
    //back button pressed
    @IBAction func goBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: true);
    }
    //order button pressed
    @IBAction func order(_ sender: UIButton) {
        let dialog=UIAlertController(title: "Thank you", message: "For ordering: \(movie.name)", preferredStyle: .alert);
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: {(t)in
            //after order - back to home screen
            self.navigationController!.popToRootViewController(animated: true);
        }));
        present(dialog, animated: true, completion: nil);
    }
}
