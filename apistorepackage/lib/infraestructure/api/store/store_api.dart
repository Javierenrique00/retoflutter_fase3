

import 'package:apistorepackage/infraestructure/api/cart/cart.dart';
import 'package:apistorepackage/infraestructure/api/cart/cart_interface.dart';
import 'package:apistorepackage/infraestructure/api/products/products.dart';
import 'package:apistorepackage/infraestructure/api/products/products_interface.dart';
import 'package:apistorepackage/infraestructure/api/users/users.dart';
import 'package:apistorepackage/infraestructure/api/users/users_interface.dart';
import 'package:apistorepackage/infraestructure/api/store/store_api_interface.dart';

/// Class that implements all store api for the fake Store API
///  ---------------------------------------------------------
class StoreApi implements StoreApiInterface {
  final _products = Products();
  final _users = Users();
  final _cart = Cart();
  
  StoreApi();

  /// Get all products of the store
  @override
  Future<ResponseGetAllProducts> getAllProducts() => _products.getAllProducts();

  /// Get product for the productId (int: id) parameter
  @override
  Future<ResponseGetProduct> getSingleProduct(int id) => _products.getSingleProduct(id);

  /// get all users in the the store
  @override
  Future<ResponseGetAllUsers> getAllUsers() => _users.getAllUsers();

  /// Get the user for the userId (int: id) parameter
  @override
  Future<ResponseGetUser> getSingleUser(int id) => _users.getSingleUser(id);

  /// Get all the carts of the store
  @override
  Future<ResponseGetAllCarts> getAllCarts() => _cart.getAllCarts();

  /// Get the cart for the cartId (int: id) parameter
  @override
  Future<ResponseGetCart> getSingleCart(int id) => _cart.getSingleCart(id);

}