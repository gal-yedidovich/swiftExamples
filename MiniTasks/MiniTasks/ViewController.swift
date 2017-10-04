import UIKit
class ViewController: UIViewController {
    @IBOutlet var taskTxt: UITextField!;//input
    @IBOutlet var container: UIView!;//all tasks list
    var lastY:CGFloat=0.0;// y point for vertical position
    var even:Bool=false;//for Odd - Even indication
    var taskWidth:CGFloat!;//task width - fixed for all tasks
    
    override func viewDidLoad() {
        taskWidth=container.frame.width;//set parent width when loaded
    }
    @IBAction func addTask(_ sender: UIButton) {
        if taskTxt.text!.isEmpty{return}//if empty don't continue
        let newTask=UILabel();
        newTask.text=taskTxt.text;
        newTask.backgroundColor=(even ? UIColor.white:UIColor.yellow);//Odd-Even color styling
        newTask.frame.origin.y=lastY;//vertical position
        even = !even;//toggle: odd|even
        newTask.sizeToFit();//all size wrap content
        newTask.frame.size.width=taskWidth;//width match parent (height wrap content)
        container.addSubview(newTask);//add this task to the list
        lastY+=newTask.frame.height;//update last y position
        taskTxt.text="";//reset input value
    }
    @IBAction func clearTasks(_ sender: UIButton) {
        //show "Are you sure" dialog
        let alert=UIAlertController(title: "Are you sure?", message: "Tasks will be removed permanently", preferredStyle: .alert);
        //if not sure - just close
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil));
        //if yes - clear all tasks
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive,
            handler: {(a)in
              self.clearTasks();
        }));
        present(alert, animated:true, completion: nil);
        
    }
    
    
    func clearTasks(){
        lastY=0.0;//reset y position
        for task in container.subviews{//remove all tasks from container
            task.removeFromSuperview();
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        taskTxt.resignFirstResponder();
    }


}

