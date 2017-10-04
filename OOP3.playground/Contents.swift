var animals:[Animal] = [
    Lion(), Cat(), Cow()
];
for a in animals{
    a.makeNoise();
}
//tashke et ahatul
let c1=animals[1] as! Cat;
let c2=animals[2] as! Cow;
c1.drink(c2.giveMilk()!);
//taahil et arie
let l1=animals[0] as! Lion;
l1.eat(c2);
if let b = c2.giveMilk(){
    c1.drink(b);
}else{
    c1.drink("water");
}

//
print(A.x);





