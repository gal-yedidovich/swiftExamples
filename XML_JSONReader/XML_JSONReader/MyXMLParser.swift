import Foundation
class MyXMLParser : XMLParser, XMLParserDelegate{
    private var isInfo=false;//if inside user element
    private var users:[String]=[];//all users array
    override init(data: Data) {
        super.init(data: data);
        self.delegate=self;
    }
    //XMLParserDelegate methods:
    //<foo> | <bar />
    func parser(_ parser: XMLParser, didStartElement elem: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elem == "info"{//found: <user>
            isInfo=true;
        }
    }
    //<foo> HERE </foo>
    func parser(_ parser: XMLParser, foundCharacters name: String) {
        if isInfo{
           users.append(name);
        }
    }
    //</foo>
    func parser(_ parser: XMLParser, didEndElement elem: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elem == "info"{//found: </user>
            isInfo=false;
        }
    }
    //parsing failure
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
         print("Failed to parse your XML");
    }
    //get all users
    func getUsers()->[String]{
         return users;
    }
}










