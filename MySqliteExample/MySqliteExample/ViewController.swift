import UIKit
class ViewController: UIViewController {

    let fileMngr=FileManager.default;
    var docs,dbPath:String!;
    var db:FMDatabase!;
    override func viewDidLoad() {
        docs=fileMngr.urls(for: .documentDirectory, in: .userDomainMask)[0].path;
        dbPath=docs+"/my.db";
        db=FMDatabase(path: dbPath);
        print(docs);
        if db.open(){//connection succeeded
           c();//Creation examples
           r();//Reading examples
           u();//Update examples
           d();//Deletion examples
        }
    }
    func c(){
        //create table
        exec("CREATE TABLE IF NOT EXISTS stuff (id INTEGER PRIMARY KEY, name VARCHAR(100));");
        //create data in table
        exec("INSERT INTO stuff (name) VALUES ('Phone'),('Marker'),('Laptop')");
    }
    func r(){
        let results = query("SELECT * FROM stuff;");
        while results.next(){
            print(results.string(forColumn: "name"));
        }
    }
    func u(){
        //change table
        exec("ALTER TABLE stuff ADD COLUMN some VARCHAR(20) DEFAULT 'some';")
        //update data
        exec("UPDATE stuff SET some='bubu'");
    }
    func d(){
        //delete data
        exec("DELETE FROM stuff");
        //delete table it self
        exec("DROP TABLE IF EXISTS stuff");
    }
    //own reusage
    func exec(_ sql:String){
        db.executeStatements(sql);
    }
    func query(_ sql:String)->FMResultSet{
        return db.executeQuery(sql, withArgumentsIn: nil);
    }
}










