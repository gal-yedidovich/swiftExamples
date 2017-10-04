import UIKit
import SafariServices
class ViewController: UIViewController {
    
    private let users=["Adi",
                       "Ido",
                       "Jonathan",
                       "Adel",
                       "Muchamed",
                       "Benny",
                       "Tal"];
    
    private let foodsNames=["Chicken", "Pasta", "Pizza"];
    @IBOutlet var webView:      UIWebView!;
    @IBOutlet var foodsSgmnt:   UISegmentedControl!;
    @IBOutlet var qntyFeed:     UILabel!;
    private var qnty:Int=1;
    private let token="123";
    
    @IBAction func qntyChanged(_ sender: UISlider) {
        qnty=Int(sender.value);
        qntyFeed.text="\(qnty)";
    }
    //
    @IBAction func innerData(_ sender: UIButton) {
        var html="<h1 id='ttl'>Hello from HTML</h1>";
        html+="<ul>";
        for u in users{
            html+="<li>\(u)</li>";
        }
        html+="</ul>";
        webView.loadHTMLString(html, baseURL: nil);
    }
    @IBAction func locFiles(_ sender: UIButton) {
        //here
        let path=Bundle.main.path(forResource: "my", ofType: "html")!;
        print(path);//only path (without scheme)
        let url=URL(string: "file://"+path)!;
        webView.loadRequest(URLRequest(url: url));
    }
    @IBAction func locNet(_ sender: UIButton) {
        //base url of our web service:
        let baseUrl="http://10.0.0.47:8181/grootable";
        let query="?product=\(foodsNames[foodsSgmnt.selectedSegmentIndex])&quantity=\(qnty)&token=\(token)";
        let url=URL(string: baseUrl+query)!;
        //send HTTPRequest to created url
        webView.loadRequest(URLRequest(url: url));
    }
    @IBAction func interNet(_ sender: UIButton) {
        let url=URL(string: "http://www.apple.com")!;
        webView.loadRequest(URLRequest(url: url));
    }
    @IBAction func safariVC(_ sender: UIButton) {
        let url=URL(string: "http://www.apple.com")!;
        let svc=SFSafariViewController(url: url);
        show(svc, sender: self);
    }
}




