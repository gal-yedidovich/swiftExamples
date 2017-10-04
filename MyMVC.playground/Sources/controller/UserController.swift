public class UserController{
    //Usercontroller HAS models & views
    private var uModel:UserModel;
    private var uView:UserView;
    private var mModel:MsgModel;
    private var mView:MsgView;
    //initialize models & views once created
    public init(){
        self.uView = UserView();
        self.uModel = UserModel();
        self.mModel = MsgModel();
        self.mView = MsgView();
    }
    //caller interact through following methods:
    public func set(name:String){
        uModel.set(name: name);
    }
    public func set(id:Int){
        uModel.set(id: id);
    }
    public func reloadView(){
        uView.show(uId: uModel.getId(), uName: uModel.getName());
        mView.showInbox(
            user: uModel.getName(),
            msgs: mModel.getInbox(forUser: uModel.getId())
        );
    }
    public func send(_ msg:String, to receiver:Int){
        mModel.addMessage(receiver: receiver,
                          sender: uModel.getId(),
                          txt: msg);
    }
}






