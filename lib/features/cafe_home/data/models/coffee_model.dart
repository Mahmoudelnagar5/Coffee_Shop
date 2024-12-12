class CoffeeModel {
  final String name;
  final String ingredients;
  final String description;
  final String imageUrl;
  final double rating;
  final double price;
  final String reviews;
  static const categories = <String>[
    'Cappuchino',
    'Espresso',
    'Americano',
    'Macchiato',
    'Latte',
    'Frappé'
  ];
  static final List<CoffeeModel> coffeeList = [
    CoffeeModel(
      name: 'Americano',
      ingredients: 'With Cream',
      description:
          'An Americano is a coffee drink that is made with espresso and hot water. It is a popular alternative to drip coffee, and has a strong and bold flavor. The drink originated in Europe during World War II, when American soldiers would dilute their espresso with hot water to make it last longer.',
      imageUrl: 'https://i.imgur.com/y6Fj8tu.jpg',
      rating: 4.3,
      price: 3.8,
      reviews: '7.295',
    ),
    CoffeeModel(
      name: 'Latte',
      ingredients: 'With Chocolate',
      description:
          'A latte is a coffee drink made with espresso and steamed milk. It is typically topped with a small amount of frothed milk. The drink originated in Italy and is now enjoyed around the world. It has a mild and creamy flavor, and is often sweetened with sugar or flavored syrups.',
      imageUrl: 'https://i.imgur.com/tEf7zGq.jpg',
      rating: 4.2,
      price: 3.5,
      reviews: '10.875',
    ),
    CoffeeModel(
      name: 'Cappuccino',
      ingredients: 'With Oat Milk',
      description:
          'A cappuccino is a coffee beverage that is made with espresso and steamed milk, often topped with a layer of frothed milk. It is a type of espresso drink that originated in Italy and is now popular around the world. The drink is characterized by its strong and bold flavor, and is typically served in a small cup.',
      imageUrl: 'https://i.imgur.com/2aBjCR7.jpg',
      rating: 4.5,
      price: 4.2,
      reviews: '6.986',
    ),
    CoffeeModel(
      name: 'Espresso',
      ingredients: 'With Sugar',
      description:
          'Espresso is a concentrated form of coffee that is made by forcing hot water through finely ground coffee beans. It originated in Italy and is now enjoyed around the world. Espresso has a strong and bold flavor, and is typically served in small shots.',
      imageUrl: 'https://i.imgur.com/HOU9gZO.jpg',
      rating: 4.7,
      price: 4.2,
      reviews: '3.584',
    ),
    CoffeeModel(
      name: 'Mocha',
      ingredients: 'With Whipped Cream',
      description:
          'A mocha is a coffee drink that is made with espresso, chocolate, and steamed milk. It has a rich and indulgent flavor, and is often topped with whipped cream and chocolate shavings. The drink originated in Italy, and is now enjoyed around the world.',
      imageUrl: 'https://i.imgur.com/M73FiE2.jpg',
      rating: 4.2,
      price: 4.4,
      reviews: '6.752',
    ),
  ];

  CoffeeModel(
      {required this.name,
      required this.ingredients,
      required this.description,
      required this.imageUrl,
      required this.rating,
      required this.price,
      required this.reviews});
}
