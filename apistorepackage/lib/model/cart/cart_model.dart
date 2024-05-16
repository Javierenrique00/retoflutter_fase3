
import 'products_qty_model.dart';

class CartModel {
  final int id;
  final int userId;
  final String date;
  final List<ProductsQtyModel> products;

  /// ### CartModel
  ///
  /// Represent a cart of the fakeStore
  CartModel( this.id,  this.userId, this.date, this.products);

  @override
  String toString(){
    return 'CartModel('
    'id: $id, '
    'userId: $userId, '
    'date: $date, '
    'products: $products'
    ')';
  }
}