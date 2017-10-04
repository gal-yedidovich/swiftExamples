struct User{
    enum Gender : Int{
        case MALE,FEMALE,OTHER;
    }
    let name:String;
    let pass:String;
    let age:Int;
    let gender:Gender;
}
