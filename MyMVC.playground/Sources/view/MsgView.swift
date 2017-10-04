class MsgView {
    //
    func showInbox(user:String,msgs:[MsgModel.Message]){
        print("*****  inbox of \(user):  *****");
        for m in msgs{
            print("\(m.txt) from: \(m.senderName)");
        }
    }
}
