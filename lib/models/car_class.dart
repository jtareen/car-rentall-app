class Car {
  final String name;
  final String imageUrl;
  final String modelYear;
  final String carCompany;
  final String description;
  final String fuelType;
  final String interiorColor;
  final int kilometers;
  final int seats;
  final String transmission;
  final String hostName;
  final double hostRating;
  final String hostLocation;
  final double carRating;
  final List<Review> reviews;
  final double reviewCount;
  final double pricePerDay;

  Car({
    required this.name,
    required this.imageUrl,
    required this.modelYear,
    required this.carCompany,
    required this.description,
    required this.fuelType,
    required this.interiorColor,
    required this.kilometers,
    required this.seats,
    required this.transmission,
    required this.hostName,
    required this.hostRating,
    required this.hostLocation,
    required this.carRating,
    required this.reviews,
    required this.reviewCount,
    required this.pricePerDay,
  });
}

class Review {
  final String reviewerName;
  final String reviewerProfileUrl;
  final double rating;
  final String date;
  final String comment;

  Review({
    required this.reviewerName,
    required this.reviewerProfileUrl,
    required this.rating,
    required this.date,
    required this.comment,
  });
}

List<Car> carList = [
  Car(
    name: 'Model 3',
    imageUrl: 'assets/images/cars/car_01.jpeg',
    carCompany: 'Tesla',
    modelYear: '2021',
    description:
    'Model 3 comes with the option of dual motor all-wheel drive, 20” Überturbine Wheels, Performance Brakes, and lowered suspension for total control.',
    fuelType: 'Electric',
    interiorColor: 'Black',
    kilometers: 12412,
    seats: 4,
    transmission: 'Single-speed automatic',
    hostName: 'Atasoka Dealer',
    hostRating: 4.5,
    hostLocation: 'Gunungpati, Semarang',
    carRating: 4.5,
    reviews: [
      Review(
        reviewerName: 'Kathryn Murphy',
        reviewerProfileUrl: 'assets/images/users/female-2.jpg',
        rating: 4.3,
        date: 'Feb 10, 2021',
        comment: 'The experience was good. The car had some wear but was reliable.',
      ),
      Review(
        reviewerName: 'Eleanor Pena',
        reviewerProfileUrl: 'assets/images/users/female-3.jpg',
        rating: 4.5,
        date: 'Aug 12, 2021',
        comment: 'The car was beautiful and comfortable to drive.',
      ),
      Review(
        reviewerName: 'Theresa Webb',
        reviewerProfileUrl: 'assets/images/users/female-1.jpg',
        rating: 4.9,
        date: 'Aug 9, 2021',
        comment: 'Amazing service, highly recommended!',
      ),
    ],
    reviewCount: 124,
    pricePerDay: 15.00,
  ),
  Car(
    name: '5 Series',
    imageUrl: 'assets/images/cars/car_02.jpeg',
    carCompany: 'BMW',
    modelYear: '2021',
    description:
    'A luxury sedan with state-of-the-art technology and performance.',
    fuelType: 'Gasoline',
    interiorColor: 'Beige',
    kilometers: 18000,
    seats: 5,
    transmission: '8-speed automatic',
    hostName: 'Luxury Rentals',
    hostRating: 4.7,
    hostLocation: 'Downtown, New York',
    carRating: 4.7,
    reviews: [
      Review(
        reviewerName: 'Eleanor Pena',
        reviewerProfileUrl: 'assets/images/users/female-2.jpg',
        rating: 4.5,
        date: 'Aug 12, 2021',
        comment: 'The car was beautiful and comfortable to drive. Highly recommend this dealer!',
      ),
      Review(
        reviewerName: 'Theresa Webb',
        reviewerProfileUrl: 'assets/images/users/female-3.jpg',
        rating: 4.9,
        date: 'Aug 9, 2021',
        comment: 'Literally the best dealer you could rent a car from. Amazing person and very kind!',
      ),
      Review(
        reviewerName: 'Robert Fox',
        reviewerProfileUrl: 'assets/images/users/male-2.jpg',
        rating: 4.7,
        date: 'Jul 23, 2021',
        comment: 'Smooth transaction and well-maintained car. A pleasure to drive.',
      ),
      Review(
        reviewerName: 'Annette Black',
        reviewerProfileUrl: 'assets/images/users/female-2.jpg',
        rating: 4.6,
        date: 'Jul 15, 2021',
        comment: 'The car was in pristine condition. The dealer was professional and courteous.',
      ),
    ],
    reviewCount: 200,
    pricePerDay: 20.00,
  ),
  Car(
    name: 'E-Class',
    imageUrl: 'assets/images/cars/car_03.jpeg',
    carCompany: 'Mercedes-Benz',
    modelYear: '2020',
    description:
    'Elegant, comfortable, and powerful, perfect for business trips. ',
    fuelType: 'Diesel',
    interiorColor: 'Black',
    kilometers: 22000,
    seats: 5,
    transmission: '9-speed automatic',
    hostName: 'Prestige Cars',
    hostRating: 4.8,
    hostLocation: 'Los Angeles, CA',
    carRating: 4.8,
    reviews: [
      Review(
        reviewerName: 'Ronald Richards',
        reviewerProfileUrl: 'assets/images/users/male-2.jpg',
        rating: 4.8,
        date: 'Jun 30, 2021',
        comment: 'Best experience ever! The dealer went above and beyond to help me.',
      ),
      Review(
        reviewerName: 'Savannah Nguyen',
        reviewerProfileUrl: 'assets/images/users/female-3.jpg',
        rating: 4.3,
        date: 'Jun 20, 2021',
        comment: 'Good experience overall. The car was great, but the pickup process could be smoother.',
      ),
      Review(
        reviewerName: 'Cameron Williamson',
        reviewerProfileUrl: 'assets/images/users/male-1.jpg',
        rating: 4.5,
        date: 'Jun 10, 2021',
        comment: 'Wonderful car, excellent performance. Would rent again!',
      ),
    ],
    reviewCount: 150,
    pricePerDay: 25.00,
  ),
  Car(
    name: 'A6',
    imageUrl: 'assets/images/cars/car_04.jpeg',
    carCompany: 'Audi',
    modelYear: '2022',
    description:
    'Sophisticated design combined with exceptional performance.',
    fuelType: 'Hybrid',
    interiorColor: 'Gray',
    kilometers: 10000,
    seats: 5,
    transmission: '7-speed automatic',
    hostName: 'Audi Dealer',
    hostRating: 4.6,
    hostLocation: 'Berlin, Germany',
    carRating: 4.6,
    reviews: [
      Review(
        reviewerName: 'Courtney Henry',
        reviewerProfileUrl: 'assets/images/users/female-2.jpg',
        rating: 4.2,
        date: 'May 25, 2021',
        comment: 'Affordable pricing and decent car condition. Great for short trips.',
      ),
      Review(
        reviewerName: 'Darlene Robertson',
        reviewerProfileUrl: 'assets/images/users/female-1.jpg',
        rating: 4.4,
        date: 'May 12, 2021',
        comment: 'Great car, but minor delays during pickup. Overall, satisfied.',
      ),
      Review(
        reviewerName: 'Bessie Cooper',
        reviewerProfileUrl: 'assets/images/users/female-3.jpg',
        rating: 4.9,
        date: 'Apr 30, 2021',
        comment: 'Fantastic service and premium quality car. Highly recommended!',
      ),
    ],
    reviewCount: 180,
    pricePerDay: 22.50,
  ),
  Car(
    name: 'Mustang',
    imageUrl: 'assets/images/cars/car_05.jpeg',
    carCompany: 'Ford',
    modelYear: '2021',
    description:
    'Iconic muscle car with a powerful engine and thrilling performance.',
    fuelType: 'Gasoline',
    interiorColor: 'Red',
    kilometers: 15000,
    seats: 4,
    transmission: '6-speed manual',
    hostName: 'Classic Cars Rental',
    hostRating: 4.3,
    hostLocation: 'Austin, Texas',
    carRating: 4.3,
    reviews: [Review(
      reviewerName: 'Marvin McKinney',
      reviewerProfileUrl: 'assets/images/users/male-1.jpg',
      rating: 4.6,
      date: 'Apr 15, 2021',
      comment: 'Car was clean and performed exceptionally well. Enjoyed my trip!',
    ),
      Review(
        reviewerName: 'Esther Howard',
        reviewerProfileUrl: 'assets/images/users/female-3.jpg',
        rating: 4.7,
        date: 'Mar 20, 2021',
        comment: 'Very professional dealer and an incredible car. I loved every second of it.',
      ),
      Review(
        reviewerName: 'Jenny Wilson',
        reviewerProfileUrl: 'assets/images/users/female-2.jpg',
        rating: 4.1,
        date: 'Mar 10, 2021',
        comment: 'The car was okay, but the dealer was friendly and helpful.',
      ),
      Review(
        reviewerName: 'Jacob Jones',
        reviewerProfileUrl: 'assets/images/users/male-2.jpg',
        rating: 4.8,
        date: 'Feb 25, 2021',
        comment: 'Top-notch service and a luxurious car. Worth every penny!',
      ),],
    reviewCount: 90,
    pricePerDay: 18.00,
  ),
];
