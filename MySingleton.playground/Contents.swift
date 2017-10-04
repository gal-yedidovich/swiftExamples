//Tests:

var s1=Singy.getInstance();
var s2=Singy.getInstance();

print(s1 === s2);
s2.name = "Singy B";
print(s1.name);

var s3=Singy2.instance;
var s4=Singy2.instance;
print(s3 === s4);