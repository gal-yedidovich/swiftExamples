import Foundation
class MyErrors{
    //custom examples:
    struct NikiError : Error{}
    enum WorkError : Error{
        case isSunday, notEnoughSleep, notEnoughCoffee;
    }
    //dangerous method
    func doSomeBad()throws{
        //some normal functionality
        print("doing bad");
        //actual danger
        throw NikiError();
    }
    //not really dangerous
    func notReallyBad()throws{
        print("not really bad");
    }
    //
    func goToWork()throws{
        print("going to work");
        throw WorkError.notEnoughSleep;
    }
    //
    func badAndClean()throws{
        //equivalent finally - for clean ups
        defer{
            print("defer - cleaups");
        }
        print("before bad stuff");
        throw NikiError();
    }
    //sometimes throws
    func badOrNot()throws{
        defer{
            print("bad Or Not - cleanup");
        }
        //some logic...
        if arc4random_uniform(10)%2 == 0{
            //not throwing...
        }else{
            throw NikiError();
        }
    }
}










