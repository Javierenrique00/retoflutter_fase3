
import 'products_qty_model.dart';

class CartModel {
  final int id;
  final int userId;
  final String date;
  final List<ProductsQtyModel> products;

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