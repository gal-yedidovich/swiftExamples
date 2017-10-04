import UIKit
class ViewController: UIViewController {
    //
    let cSql1="CREATE TABLE IF NOT EXISTS `cars`(id INTEGER PRIMARY KEY, name VARCHAR(50), owner INTEGER NOT NULL DEFAULT 0);";
    let cSql2="CREATE TABLE IF NOT EXISTS `users` (id INTEGER PRIMARY KEY, name VARCHAR(30));";
    let cSql3="INSERT INTO `users` (`name`) VALUES ('Moran'),('Levona'),('Adi'),('Benny');";
    let cSql4="INSERT INTO `cars` (`name`,`owner`) VALUES ('Mazda',1),('Subaru',1),('Suzuki',2),('Diahatsu',3),('BMW m6',4);";
    //
    let rSql="SELECT u.name AS owner, c.name AS car FROM users AS u JOIN cars AS c ON c.owner=u.id";
    
    var db:FMDatabase!;//db object
    override func viewDidLoad() {
        let dbPath=FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path+"/my.db";
        db = FMDatabase(path: dbPath);
        db.open();
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //c();
        r();
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        db.close();
    }
    
    func c(){
        exec(cSql1+cSql2+cSql3+cSql4);
    }
    func r(){
        let results=query(rSql);
        while results.next(){
            let oName=results.string(forColumn: "owner")!;
            let cName=results.string(forColumn: "car")!;
            print("\(oName) has \(cName)");
        }
    }
    
    
    func exec(_ sql:String){
        db.executeStatements(sql);
    }
   
    func query(_ sql:String)->FMResultSet{
        return db.executeQuery(sql, withArgumentsIn: nil);
    }
    
}






