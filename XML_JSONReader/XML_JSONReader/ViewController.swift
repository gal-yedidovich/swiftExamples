import UIKit
class ViewController: UIViewController {
    
    let s=URLSession.shared;
    let baseUrl="http://nikita.hackeruweb.co.il";
    
    override func viewDidLoad() {
        loadXml();
        eXml();
        exJson();
    }
    
    func loadXml(){
        let url=URL(string: baseUrl+"/hackDroid/usersData.xml")!;
        s.dataTask(with: url, completionHandler: {(d,r,e)in
            let p=MyXMLParser(data: d!);
            p.parse();//activate parsing methods
            let users=p.getUsers();//get all found users
            for u in users{//iterate all users
                print(u);//print each one
            }
        }).resume();
    }
    func eXml(){
        var req=URLRequest(url: URL(string: baseUrl+"/hackSwift/")!);
        req.httpMethod="POST";
        req.httpBody="uName=Bubu&uPass=123".data(using: .utf8);
        s.dataTask(with: req, completionHandler: {(d,r,e)in
            let s=(r as! HTTPURLResponse).statusCode;
            if s==200{
                let p=MyXMLParser(data: d!);
                p.parse();//activate parsing methods
                let uInfo=p.getUsers();
                if uInfo.count==1{
                   print(uInfo[0]);
                }
            }
        }).resume();
    }
    func exJson(){
        var req=URLRequest(url: URL(string: baseUrl+"/hackSwift/?alt=json")!);
        req.httpMethod="POST";
        req.allHTTPHeaderFields=["Accept":"text/json"];
        req.httpBody="uName=Bubu&uPass=123".data(using: .utf8);
        s.dataTask(with: req, completionHandler: {(d,r,e)in
            let s=(r as! HTTPURLResponse).statusCode;
            if s==200{
               if let json = try? JSONSerialization.jsonObject(with: d!, options: .mutableContainers) as? [String:Any]{
                print(json!["info"]!);
               }
            }
        }).resume();
    }
    
    
}






