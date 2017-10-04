import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{
    
    @IBOutlet var myMap:MKMapView!;
    var locationManager: CLLocationManager?;
    
    override func viewDidLoad() {
        locationManager=CLLocationManager();//initialize location manager
        locationManager!.requestAlwaysAuthorization();//promt user current location
        //assign this class's instance as myMap's delegat property
        myMap.delegate=self;
        //show user's current location
        myMap.showsUserLocation=true;
        //Map layer type
        myMap.mapType = .standard;
        //Exercise -> show places from nikitaPlaces.plist
        showPlaces(readPlaces("nikitaPlaces"));
        
    }
    
    @IBAction func changeType(_ sender: UISegmentedControl) {
        //change map type - by selected segment
        let i=sender.selectedSegmentIndex;
        myMap.mapType=MKMapType(rawValue: UInt(i))!;
    }
    
    //when user's location changed (walking, driving, etc...)
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        //reset region for each location change
        let newPlace=userLocation.coordinate;
        myMap.setRegion(MKCoordinateRegionMakeWithDistance(newPlace, 8000, 8000), animated: true);
    }
    
    /**read from plist file and return Dictionary of places,
    *where key is place's titl and value is place's coordinates represented in array of [latitude,longitude]
    @param filename plist name to read from
    @return Dictionary of places
    */
    func readPlaces(_ fileName:String)->[String:[Double]]{
        let contents=Bundle.main.path(forResource: fileName, ofType: "plist")!;
        return NSDictionary(contentsOfFile: contents) as! [String:[Double]];
    }
    /** 
    *show given places on the screen
    *@param places Dictionary where key is a title and value is coordinates
    */
    func showPlaces(_ places:[String:[Double]]){
        for (title, coords) in places{
            let pin = MKPointAnnotation();//marker
            pin.coordinate=CLLocationCoordinate2D(latitude: coords[0], longitude: coords[1]);
            pin.title=title;
            myMap.addAnnotation(pin);//add current marker to map
        }
    }
}
