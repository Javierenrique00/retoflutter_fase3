

import 'package:apistorepackage/infraestructure/api/private/common/baseio.dart';
import 'package:apistorepackage/infraestructure/api/private/common/paths.dart';
import 'package:apistorepackage/infraestructure/api/public/store/interface/store_api_interface.dart';
import 'package:apistorepackage/model/cart/cart_model.dart';
import 'package:apistorepackage/model/cart/mapper/cart_model_mapper.dart';
import 'package:apistorepackage/model/product/mapper/product_model_mapper.dart';
import 'package:apistorepackage/model/product/product_model.dart';
import 'package:apistorepackage/model/user/mapper/user_model_mapper.dart';
import 'package:apistorepackage/model/user/user_model.dart';


class StoreApi implements StoreApiInterface {

  final _products = Baseio<ProductModel>(urlpath: Paths.urlProducts,serializer: (p0) => productModelFromJsonMapper(p0),);
  final _users = Baseio<UserModel>(urlpath: Paths.urlUsers,serializer: (p0) => userModelFromJsonMapper(p0),);
  final _cart = Baseio<CartModel>(urlpath: Paths.urlCarts,serializer: (p0) => cartModelFromJsonMapper(p0),);

  /// ### StoreApi()
  /// Punto de entrada para el acceso de todo el StoreApi
  /// provee funciones como:
  /// 
  /// - StoreApi().getAllProducts();
  /// - StoreApi().getSingleProduct(id);
  /// - StoreApi().getAllUsers();
  /// - StoreApi().getSingleUser(id);
  /// - StoreApi().getAllCarts();
  /// - StoreApi().getSingleCart(id);
  StoreApi();

  /// ### getAllProducts()
  /// 
  /// Get all products of the store
  /// 
  /// Example:
  /// 
  /// ```dart
  ///   final allProductsEither = await StoreApi().getAllProducts();
  ///    allProductsEither.fold(
  ///     (l) => print('error code $l'),
  ///     (r){
  ///       print('loaded all products: qty:${r.length}');
  ///       print('Primer producto: ${r[0]}');
  ///     },
  ///   );
  /// ```
  @override
  Future<ResponseGetAllProducts> getAllProducts() => _products.getAll();

  /// ### getSingleProduct(id)
  /// 
  /// Get the product with the product id = [id]
  /// 
  /// Example:
  /// 
  /// ```dart
  ///   final ProductEither = await StoreApi().getSingleProduct(3);
  ///    ProductEither.fold(
  ///     (l) => print('error code $l'),
  ///     (r){
  ///       print('product: qty:$r');
  ///     },
  ///   );
  /// ```
  @override
  Future<ResponseGetProduct> getSingleProduct(int id) => _products.getSingle(id);

  /// ### getAllUsers()
  /// 
  /// Get all users of the store
  /// 
  /// Example:
  /// 
  /// ```dart
  ///   final allUsersEither = await StoreApi().getAllUsers();
  ///    allUsersEither.fold(
  ///     (l) => print('error code $l'),
  ///     (r){
  ///       print('loaded all users: qty:${r.length}');
  ///       print('Primer user: ${r[0]}');
  ///     },
  ///   );
  /// ```
  @override
  Future<ResponseGetAllUsers> getAllUsers() => _users.getAll();

  /// ### getSingleUser(id)
  /// 
  /// Get the user with the userId = [id]
  /// 
  /// Example:
  /// 
  /// ```dart
  ///   final userEither = await StoreApi().getSingleUser(3);
  ///    userEither.fold(
  ///     (l) => print('error code $l'),
  ///     (r){
  ///       print('user: qty:$r');
  ///     },
  ///   );
  /// ```
  @override
  Future<ResponseGetUser> getSingleUser(int id) => _users.getSingle(id);

  /// ### getAllCart()
  /// 
  /// Get all carts of the store
  /// 
  /// Example:
  /// 
  /// ```dart
  ///   final allCartEither = await StoreApi().getAllCart();
  ///    allCartEither.fold(
  ///     (l) => print('error code $l'),
  ///     (r){
  ///       print('loaded all cart: qty:${r.length}');
  ///       print('Primer cart: ${r[0]}');
  ///     },
  ///   );
  /// ```
  @override
  Future<ResponseGetAllCarts> getAllCarts() => _cart.getAll();

  /// ### getSingleCart(id)
  /// 
  /// Get the cart with the cartId = [id]
  /// 
  /// Example:
  /// 
  /// ```dart
  ///   final cartEither = await StoreApi().getSingleCart(3);
  ///    cartEither.fold(
  ///     (l) => print('error code $l'),
  ///     (r){
  ///       print('cart: qty:$r');
  ///     },
  ///   );
  /// ```
  @override
  Future<ResponseGetCart> getSingleCart(int id) => _cart.getSingle(id);

}