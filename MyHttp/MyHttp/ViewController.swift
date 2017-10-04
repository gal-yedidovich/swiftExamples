import UIKit
class ViewController: UIViewController {
    
    @IBOutlet var feed: UITextView!;
    @IBOutlet var uName: UITextField!;
    @IBOutlet var uPass: UITextField!;
    
    
    
    let session=URLSession.shared;
    //make sure to configure: NSAppTransportSecurity -> Info.plist
    //https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW33
    
    //Example 1
    @IBAction func req1(_ btn:UIButton){
        //URL to connect
        let s="http://nikita.hackeruweb.co.il:80/hackSwift/dugma.txt";
        let url=URL(string: s)!;
        //use shared Session to send HTTP request
        session.dataTask(with: url, completionHandler: {(d,r,e)in//Data,URLResponse,Error
            if e == nil{//if there is no error
                print(r!);//response
                print(d!);//raw response body
                let str = String(data: d!, encoding: .utf8)!; //convert raw data to String
                print(str);//print readable string
            }
        }).resume();//start(execute) the task
    }
    
    //Example 2
    @IBAction func req2(_ btn:UIButton){
        //Equivalent to first Example
        let req=URLRequest(url: URL(string: "http://nikita.hackeruweb.co.il:80/hackSwift/dugma.txt")!);
        session.dataTask(with: req, completionHandler: {(d,r,e)in
            let str=String(data: d!, encoding: .utf8)!;
            let names=str.components(separatedBy: ",");//split String by comma
            for name in names{//iterate over all names
                print(name);//print each name
            }
        }).resume();
    }
    //Example 3
    @IBAction func req3(_ btn:UIButton){
        let url=URL(string: "http://nikita.hackeruweb.co.il:80/hackSwift/dugma.txt")!;
        //Load asynchronously (HTTP GET)
        session.dataTask(with: url, completionHandler: {(d,r,e)in
            AsyncTask(backgroundTask: {(d:Data)->String in
                return String(data: d, encoding: .utf8)!;
            }, afterTask: {(str)in//Update UI - when done
                self.feed.text=str;
            }).execute(d!);
        }).resume();
    }
    //Example 4
    @IBAction func req4(_ btn:UIButton){
        //Sending complex request to remote server
        let url=URL(string: "http://nikita.hackeruweb.co.il/hackSwift/")!;
        var req=URLRequest(url: url);
        //set request method to POST
        req.httpMethod="POST";
        //content-type:application/x-www-form-url-encoded
        let params="uName=Bubu&uPass=123";
        //encode and write into request body
        req.httpBody=params.data(using: .utf8);
        session.dataTask(with: req, completionHandler: {(d,r,e)in
            print(String(data: d!, encoding: .utf8)!);
        }).resume();
    }
    //Example 5
    @IBAction func req5(_ btn:UIButton){
        let query="?alt=json";
        let uName=self.uName.text!,uPass=self.uPass.text!;
        if !uName.isEmpty && !uPass.isEmpty{
            var req=URLRequest(url: URL(string: "http://nikita.hackeruweb.co.il/hackSwift/\(query)")!);
            req.allHTTPHeaderFields=["Accept":"text/json"];
            req.httpMethod="POST";
            let params="uName=\(uName)&uPass=\(uPass)";
            req.httpBody=params.data(using: .utf8);
            session.dataTask(with: req, completionHandler: {(d,r,e)in
                let status=(r as! HTTPURLResponse).statusCode;
                //if there is no error AND http status 200
                if e==nil && status==200{
                    AsyncTask(backgroundTask: {(d:Data)->[String:Any]? in
                        return try? JSONSerialization.jsonObject(with: d, options: .mutableContainers) as! Dictionary;
                    }, afterTask: {(json)in
                        if json != nil{//valid json
                            self.feed.text="\(json!["info"]!)";//print info of this user
                        }
                    }).execute(d!);
                }
            }).resume();
        }
    }
}








