import UIKit
class ViewController: UIViewController {
    //instance variables
    @IBOutlet var ttl:UILabel!;
    @IBOutlet var img:UIImageView!;
    @IBOutlet var desc:UITextView!;
    //Array of comics characters
    private let characters:[ComicsCharacter]=[
        ComicsCharacter(title:"Groot", desc:"Groot is a Flora colossus from Planet X, the capital of the branch worlds. The Flora colossi are tree-like beings whose language is almost impossible to understand due to the stiffness of their larynxes, causing their speech to sound like they are repeating the phrase \"I am Groot\".", image:UIImage(named: "groot")!),
        ComicsCharacter(title:"Deadpool", desc:"The character's back-story has been presented as vague and subject to change, and within the narrative he is unable to remember his personal history due to a mental condition. Whether or not his name was even Wade Wilson is subject to speculation since one of his nemeses", image:UIImage(named: "deadpool")!),
        ComicsCharacter(title:"Rocket", desc:"Rocket joins the new Guardians of the Galaxy at the behest of his friend Star-Lord.[25] It is he who suggests that the team adopt that moniker after hearing it mentioned by Major Victory.[26] Later on, when the team almost disbands and Peter Quill (Star-Lord) disappears (sent into the Negative Zone by Ronan), Rocket keeps the team alive, and brings in Groot as member, as the two had become firm friends", image:UIImage(named: "rocket")!),
    ];
    //when screen loaded
    override func viewDidLoad() {
        setCharacter(1);//default comics character
    }
    //when button clicked
    @IBAction func setCharacter(_ btn:UIButton){
        setCharacter(btn.tag);//select character by tag
    }
    //select character by given index
    private func setCharacter(_ i:Int){
        let selectedCharacter=characters[i];
        ttl.text = selectedCharacter.title;
        img.image = selectedCharacter.image;
        desc.text = selectedCharacter.desc;
    }
}
