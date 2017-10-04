class MsgModel {
    struct Message{
        var receiver:Int;
        var sender:Int;
        var txt:String;
        var senderName:String{//name by id
            return Data.users[sender]!;
        }
    }
    //
    func addMessage(receiver:Int, sender:Int, txt:String){
        saveToDb(Message(receiver: receiver,
                         sender: sender,
                         txt: txt)
        );
    }
    //
    private func saveToDb(_ msg:Message){
        Data.messages.append([
            "receiver":msg.receiver,
            "sender":msg.sender,
            "txt":msg.txt
        ]);
    }
    func getInbox(forUser receiver:Int)->[Message]{
        var msgs:[Message]=[];
        for m in Data.messages{
            if (m["receiver"]! as! Int) == receiver{
              msgs.append(
                Message(receiver: receiver,
                        sender: m["sender"] as! Int,
                        txt: m["txt"] as! String)
              );
            }
        }
        return msgs;
    }
}



