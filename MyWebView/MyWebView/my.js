var users=[];
users["Bubu"]="123";
users["Groot"]="qwerty";
//when login button clicked
function tryLogin(uName,uPass){
    var un=uName.value,up=uPass.value;
    ttl.textContent = (users[un]==up) ? "Welcome "+un:"wrong username & password";
}
//
function validate(input){
    input.className = input.value ? "valid":"invalid";
}
