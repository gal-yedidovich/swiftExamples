
import Foundation
//Singleton implementation
class MoviesModel{
    static var instance=MoviesModel();//singleton instance container
    private var data:[String:[String]]=[:];//empty by default
    private init(){//when created - build instance variable data
        data=NSDictionary(contentsOfFile: Bundle.main.path(forResource: "data", ofType: "plist")!) as! [String:[String]];
    }
    //
    func getMoviesNames()->[String]{
        return Array(data.keys);
    }
    //
    func getMovie(forTitle:String)->Movie{
        let arr=data[forTitle]!;
        return Movie(name: forTitle, img: arr[0], desc: arr[1]);
    }
}
