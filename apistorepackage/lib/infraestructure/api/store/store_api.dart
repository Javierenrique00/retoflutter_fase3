

import 'package:apistorepackage/infraestructure/api/cart/cart.dart';
import 'package:apistorepackage/infraestructure/api/cart/cart_interface.dart';
import 'package:apistorepackage/infraestructure/api/products/products.dart';
import 'package:apistorepackage/infraestructure/api/products/products_interface.dart';
import 'package:apistorepackage/infraestructure/api/users/users.dart';
import 'package:apistorepackage/infraestructure/api/users/users_interface.dart';
import 'package:apistorepackage/infraestructure/api/store/store_api_interface.dart';

class StoreApi implements StoreApiInterface {
  final _products = Products();
  final _users = Users();
  final _cart = Cart();

  /// Constructor that implements all store api for the fake Store API
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
  Future<ResponseGetAllProducts> getAllProducts() => _products.getAllProducts();

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
  Future<ResponseGetProduct> getSingleProduct(int id) => _products.getSingleProduct(id);

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
  Future<ResponseGetAllUsers> getAllUsers() => _users.getAllUsers();

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
  Future<ResponseGetUser> getSingleUser(int id) => _users.getSingleUser(id);

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
  Future<ResponseGetAllCarts> getAllCarts() => _cart.getAllCarts();

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
  Future<ResponseGetCart> getSingleCart(int id) => _cart.getSingleCart(id);

}