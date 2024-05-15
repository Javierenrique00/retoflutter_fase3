

import 'package:apistorepackage/infraestructure/api/cart/cart_interface.dart';
import 'package:apistorepackage/infraestructure/api/products/products_interface.dart';
import 'package:apistorepackage/infraestructure/api/users/users_interface.dart';

/// Class with the interface of all store api for the fake Store API
///  ---------------------------------------------------------
abstract class StoreApiInterface {

  Future<ResponseGetAllProducts> getAllProducts();

  /// Get product for the productId (int: id) parameter
  Future<ResponseGetProduct> getSingleProduct(int id);

  /// get all users in the the store
  Future<ResponseGetAllUsers> getAllUsers();

  /// Get the user for the userId (int: id) parameter
  Future<ResponseGetUser> getSingleUser(int id);

  /// Get all the carts of the store
  Future<ResponseGetAllCarts> getAllCarts();

  /// Get the cart for the cartId (int: id) parameter
  Future<ResponseGetCart> getSingleCart(int id);


}