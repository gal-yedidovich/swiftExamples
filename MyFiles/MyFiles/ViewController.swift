import UIKit
class ViewController: UIViewController {
    
    @IBOutlet var input:UITextField!;
    @IBOutlet var output:UILabel!;
    
    var docs, filePath, fileName:String!;
    let fileMngr=FileManager.default;
    
    override func viewDidLoad() {
       //path for documents directory
       docs = NSSearchPathForDirectoriesInDomains(
                .documentDirectory,//FileManager.SearchPathDirectory.documentDirectory
                .userDomainMask,//FileManager.SearchPathDomainMask.userDomainMask
                true// lo zoher - nivdok
              )[0];//first
       print(docs);//
       fileName="bubu.txt";//
       filePath=docs+"/"+fileName;//
       print(filePath);//
        
        
        //Documents -> write:
        //Create
        //Read
        //Update
        //Delete
    }
    //
    @IBAction func writeIt(_ btn:UIButton){
        let txt=input.text!;
        if txt.isEmpty{return}//if empty - abort
        //write(string: txt);//write from scratch
        write(string: read()+txt);//append to existing
        input.text="";//reset inserted text
    }
    //
    @IBAction func readIt(_ btn:UIButton){
        output.text = read();//load file contents
    }
    //
    @IBAction func deleteIt(_ btn:UIButton){
        //deleteContents();//clear file contents
        deleteFile();//remove entire file
    }
    //writes raw data to filePath
    func write(data:Data){
        if !fileMngr.fileExists(atPath: filePath){//
            fileMngr.createFile(atPath: filePath,//
                                contents: data,//
                                attributes: nil);//
        }
    }
    //write string in UTF8 to filePath
    func write(string:String){
        do {
            try string.write(toFile: filePath,//
                             atomically: true,//
                             encoding: .utf8);//
        }catch{
            print("Couldn't write to file");
        }
    }
    //read fie contents as String
    func read()->String{
        if let txt = try? String(contentsOfFile: filePath){
            return txt;
        }else{
            return "";
        }
    }
    //clear file contents
    func deleteContents(){
        write(string: "");
    }
    //remove file entirely
    func deleteFile(){
        do{
            try fileMngr.removeItem(atPath: filePath);
        }catch{
            print("File couldn't beed deleted");
        }
    }
}











