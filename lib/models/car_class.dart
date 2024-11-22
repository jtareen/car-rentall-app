class Car {
  final String imageUrl;
  final String carName;
  final String carCompany;
  final String carModel;
  final double rating;
  final int reviewCount;
  final double pricePerDay;

  Car({
    required this.imageUrl,
    required this.carName,
    required this.carCompany,
    required this.carModel,
    required this.rating,
    required this.reviewCount,
    required this.pricePerDay,
  });
}

List<Car> carList = [
  Car(
    imageUrl: 'assets/images/cars/car_01.jpeg',
    carName: 'Model 3',
    carCompany: 'Tesla',
    carModel: '2021',
    rating: 4.5,
    reviewCount: 124,
    pricePerDay: 15.00,
  ),
  Car(
    imageUrl: 'assets/images/cars/car_02.jpeg',
    carName: '5 Series',
    carCompany: 'BMW',
    carModel: '2021',
    rating: 4.7,
    reviewCount: 200,
    pricePerDay: 20.00,
  ),
  Car(
    imageUrl: 'assets/images/cars/car_03.jpeg',
    carName: 'E-Class',
    carCompany: 'Mercedes-Benz',
    carModel: '2020',
    rating: 4.8,
    reviewCount: 150,
    pricePerDay: 25.00,
  ),
  Car(
    imageUrl: 'assets/images/cars/car_04.jpeg',
    carName: 'A6',
    carCompany: 'Audi',
    carModel: '2022',
    rating: 4.6,
    reviewCount: 180,
    pricePerDay: 22.50,
  ),
  Car(
    imageUrl: 'assets/images/cars/car_05.jpeg',
    carName: 'Mustang',
    carCompany: 'Ford',
    carModel: '2021',
    rating: 4.3,
    reviewCount: 90,
    pricePerDay: 18.00,
  ),
];

