

import 'package:apistorepackage/model/cart/cart_model.dart';
import 'package:apistorepackage/model/product/product_model.dart';
import 'package:apistorepackage/model/user/user_model.dart';
import 'package:dartz/dartz.dart';


typedef ResponseGetAllProducts = Either<String, List<ProductModel>>;
typedef ResponseGetProduct = Either<String, ProductModel>;
typedef ResponseGetAllUsers = Either<String, List<UserModel>>;
typedef ResponseGetUser = Either<String, UserModel>;
typedef ResponseGetAllCarts = Either<String, List<CartModel>>;
typedef ResponseGetCart = Either<String, CartModel>;
typedef ResponseGetAllCategories = Either<String, List<String>>;

/// Class with the interface of all store api for the fake Store API
abstract class StoreApiInterface {

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
  Future<ResponseGetAllProducts> getAllProducts();

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
  Future<ResponseGetProduct> getSingleProduct(int id);

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
  Future<ResponseGetAllUsers> getAllUsers();

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
  Future<ResponseGetUser> getSingleUser(int id);

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
  Future<ResponseGetAllCarts> getAllCarts();

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
  Future<ResponseGetCart> getSingleCart(int id);

  /// ### getAllCategories()
  /// 
  /// Get all categories fronm products
  /// 
  /// Example:
  /// 
  /// ```dart
  ///   final categories = await StoreApi().getAllCategories();
  ///   categories.fold(
  ///     (l) => print('error code $l'),
  ///     (r){
  ///       print('categories size:${r.size}');
  ///     },
  ///   );
  /// ```
  Future<ResponseGetAllCategories> getAllCategories();


  /// ### getAllProductsFromCategory(String category)
  /// 
  /// Get all products from a category
  /// 
  /// Example:
  /// 
  /// ```dart
  ///   final allProductsEither = await StoreApi().getAllProductsFromCategory(''jewelery);
  ///    allProductsEither.fold(
  ///     (l) => print('error code $l'),
  ///     (r){
  ///       print('loaded all products: qty:${r.length}');
  ///       print('Primer producto: ${r[0]}');
  ///     },
  ///   );
  /// ```
  Future<ResponseGetAllProducts> getAllProductsFromCategory(String category);

}