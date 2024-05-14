
class ProductsQtyModel {
  final int productId;
  final int quantity;

  ProductsQtyModel( this.productId,  this.quantity);

  @override
  String toString(){
    return 'ProductsQtyModel('
    'productId: $productId, '
    'quantity: $quantity'
    ')';
  }
}