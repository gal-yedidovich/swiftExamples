//Collections:
/*
//Array
//Example 1
var grades:[Int] = [];//array of Ints
grades.append(90);//push new Int to array
grades.append(85);
grades.append(95);
grades.append(85);
grades.append(95);
grades.append(97);
grades.append(98);
print(grades);//
print(grades[2]);//
grades.removeLast();//pop last value
print(grades.count);//
grades.insert(92, atIndex: 0);//
grades.insert(89, atIndex: 3)//
grades.removeAtIndex(3);//
grades.removeAtIndex(0);//shift
//Example 2
var gg = grades[2...4];//sub array by range
print(gg);
//iterate over values:
for grade in grades{
    print("grade is \(grade)");
}
//Example 3 - Array of specific type(String) for specific size(4) with default values ("incognito")
 let fourNames = [String](repeatElement("Incognito", count: 4));
 print(fourNames);
// */


//Dictionary AKA Associative array - Map
var sGrades:[String:Int] = ["Gamora":90,"Starlord":76];
sGrades["Groot"] = 70;//Creation entry with value 70 for key Groot
sGrades["Rocket"] = 100;
sGrades["Groot"] = 55;
print(sGrades);//
//iterate over values
for val in sGrades.values{
    print(val);
}
//iterate over keys
for key in sGrades.keys{
    print(key);
}
//iterate over keys and values
for (key,val) in sGrades{
    print("\(key) : \(val)");
}

//Set - Collection of uniques
var set = Set<Int>();
set.insert(5);
set.insert(3);
set.insert(5);
set.insert(3);
set.insert(2);
print(set.count);
if(set.contains(5)){
    print("5 exists");
}
set.remove(5);
print(set);
for s in set {
    print(s);
}









