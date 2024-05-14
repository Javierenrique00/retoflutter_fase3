
import '../cart_model.dart';
import 'products_qty_model_mapper.dart';

CartModel cartModelFromJsonMapper(Map<String, dynamic> json) => CartModel(
      (json['id'] as num).toInt(),
      (json['userId'] as num).toInt(),
      json['date'] as String,
      (json['products'] as List<dynamic>)
          .map((e) => productsQtyModelFromJsonMapper(e as Map<String, dynamic>))
          .toList(),
    );

// Map<String, dynamic> cartModelToJsonMapper(CartModel instance) => <String, dynamic>{
//       'id': instance.id,
//       'userId': instance.userId,
//       'date': instance.date,
//       'products': instance.products.map((e) => e.toJson()).toList(),
//     };