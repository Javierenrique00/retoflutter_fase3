
class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  /// ### ProductModel
  ///
  /// Represent one product of the fakeStore
  ProductModel({required this.id, required this.title, required this.price, required this.description, required this.category, required this.image});

  @override
  String toString(){
    return 'ProductModel('
    'id: $id, '
    'title: $title, '
    'price: $price, '
    'description: $description, '
    'category: $category, '
    'image: $image'
    ')';
  }
  
}