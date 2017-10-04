import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        async1();
        async2();
        async3();
        async4();
    }
    //Example 1
    func async1(){
        //what to do asynchronously
        DispatchQueue.global(qos: .background).async(execute: {
            //equivalent to AsyncTask#doInBackground()
            print("do in background");
            //when need to sync - UI Main thread
            DispatchQueue.main.async(execute: {
                //AsyncTask#onPostExecute
                print("post execute");
            });
        });
    }
    //Example 2
    func async2(){
        AsyncTask(backgroundTask: {(p:Int)->Void in
            //doing in background
            if p>0{print("Positive")}
        }).execute(1);
    }
    //Example 3
    func async3(){
        AsyncTask(backgroundTask: {(p:Bool)->Int in
            //background thread functionality
            if p {
                return 100;
            }
            return -50;
        }, afterTask: {(res)in
            //UI Main thread functionality
            print(res);
        }).execute(true);
    }
    //Example 4
    func async4(){
        let task=AsyncTask(beforeTask: {
           //In current thread
        }, backgroundTask: {(plist:String)->[String:[String]] in
           //In background thread
           let file=Bundle.main.path(forResource: plist, ofType: "plist")!;
           return NSDictionary(contentsOfFile: file) as! Dictionary;
        }, afterTask: {(dict)in
           //In UI Main thread
            print(dict);
        });
        task.execute("myData");
    }
    
}





