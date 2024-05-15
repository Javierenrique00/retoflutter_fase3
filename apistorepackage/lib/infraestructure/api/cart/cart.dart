
import '../../../model/cart/cart_model.dart';
import '../../../model/cart/mapper/cart_model_mapper.dart';
import '../common/baseio.dart';
import 'cart_interface.dart';
import '../common/paths.dart';

final class Cart implements CartInterface {

  final cartApi = Baseio<CartModel>(urlpath: Paths.urlCarts,serializer: (p0) => cartModelFromJsonMapper(p0),);

  @override
  Future<ResponseGetAllCarts> getAllCarts() => cartApi.getAll();

  @override
  Future<ResponseGetCart> getSingleCart(int id) => cartApi.getSingle(id);

}