
import UIKit

class ViewController: UIViewController {

    @IBOutlet var uName:UITextField!;
    @IBOutlet var uPass:UITextField!;
    let session=URLSession.shared;
    
    @IBAction func login(_ sender:UIButton){
        //scheme://host:port/path?query
        //Sending complex request to remote server
        let query="alt=json";//custom URL string query (HTTP GET params)
        let url=URL(string: "http://nikita.hackeruweb.co.il/hackSwift/?\(query)")!;
        var request=URLRequest(url: url);
        //adding custom HTTP headers
        request.allHTTPHeaderFields=["Accept":"text/json"];//which Content-type - expected to be retrieved
        //set request method to POST
        request.httpMethod="POST";
        let params="uName=\(uName.text!)&uPass=\(uPass.text!)";
        //encode and write data into http body
        request.httpBody=params.data(using: String.Encoding.utf8);
        session.dataTask(with: request, completionHandler: {(d,r,e)in
            AsyncTask(backgroundTask: {(d:Data)->[String:Any]? in
                return try? JSONSerialization.jsonObject(with: d, options: .mutableContainers) as! [String:Any];
                },afterTask:{(json)in
                    if json != nil {
                        print("**************");
                        print(json!);
                        print("**************");
                        self.moveToProfile(json: json!);
                    }else{
                        self.wrongUser();
                    }
            }).execute(d!);
        }).resume();
    }
    
    private func moveToProfile(json:[String:Any]){
        //profile screen instance by id
        let profileVC = storyboard?.instantiateViewController(withIdentifier: "profile") as! ProfileController;
        //pass data
        var data=json;
        data["name"]=uName.text!;
        profileVC.setJson(json: data);
        //show to user
        present(profileVC, animated: true, completion: nil);
    }
    
    private func wrongUser(){
        let alert=UIAlertController(title: "Cannot login", message: "Wrong username & password", preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
        present(alert, animated: true, completion: nil);
    }
    
}

