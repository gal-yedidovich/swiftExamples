var factory = CarFactory();
//array of Cars - created by factory
var cars:[Car]=[
   factory.createCar("Bus")!,
   factory.createCar("bus")!,
   factory.createCar("car")!,
   factory.createCar("PRIVATE")!,
   factory.createCar("truck")!,
];
for car in cars{
    car.drive();//polymorphic call
}