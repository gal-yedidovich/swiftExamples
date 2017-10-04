public class Executer{
    public  init(){}
    private static var count=0;
    public func getTotalTasks()->Int{
        return Executer.count;
    }
    public  var totalTasks:Int{
        return Executer.count;
    }
    //execution method
    public func execute(task:()->())->(){
        task();//invoke given task
        Executer.count+=1;//increment count
    }
    //calculation function with flexible implementation
    public func calc(n1:Double, n2:Double, oper:(_ n1:Double,_ n2:Double)->Double)->Double{
        Executer.count+=1;
        return oper(n1,n2);
    }
}




