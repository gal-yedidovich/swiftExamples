import UIKit
class Food {
    private static var fwImgs:[String:UIImage]=[:];//reusable collection
    var name:String;//name for current Food: Persimmon, Caqui, אפרסמון
    var imgName:String;//string name (location) for UIImage
    var img:UIImage?;//actual UIImage
    init(name:String,imgName:String){//every food must have name & imgName
        self.name=name;
        self.imgName=imgName;
    }
    func getImg()->UIImage{
        //loaded for current food already
        if self.img != nil{
            return self.img!//just use it
        //loaded for other foods
        }else if let img=Food.fwImgs[self.imgName]{
            self.img=img;//store for next call
            return img;//use it
        }else{//not loaded yet
            self.img = UIImage(named: imgName)!;//load it
            Food.fwImgs[imgName] = self.img!;//store for reusage
            return self.img!;//use it
        }
    }
}
