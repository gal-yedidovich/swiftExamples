class UserModel{
    //User HAS encapsulated id & name
    private var id:Int!;
    private var name:String!;
    //accessible to controller, but not from outside
    func set(name:String){
        self.name=name;
    }
    func set(id:Int){
        self.id=id;
    }
    func getName()->String{
        return self.name;
    }
    func getId()->Int{
        return self.id;
    }
}
