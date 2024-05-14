
import '../products_qty_model.dart';

ProductsQtyModel productsQtyModelFromJsonMapper(Map<String, dynamic> json) =>
    ProductsQtyModel(
      (json['productId'] as num).toInt(),
      (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> productsQtyModelToJsonMapper(ProductsQtyModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };