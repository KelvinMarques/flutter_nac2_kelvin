class Product {
  final String productOne;
  final String productTwo;

  Product({required this.productOne, required this.productTwo});

  @override
  String toString() {
    return '$productOne \n$productTwo}';
  }
}
