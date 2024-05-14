
import 'package:apistorepackage/infraestructure/api/products/products_interface.dart';
import 'package:apistorepackage/infraestructure/api/users/users_interface.dart';
import 'package:apistorepackage/infraestructure/api/cart/cart_interface.dart';



abstract class StoreGateway {

  Future<ResponseGetAllProducts> getAllProducts();
  Future<ResponseGetProduct> getSingleProduct(int id);

  Future<ResponseGetAllUsers> getAllUsers();
  Future<ResponseGetUser> getSingleUser(int id);

  Future<ResponseGetAllCarts> getAllCarts();
  Future<ResponseGetCart> getSingleCart(int id);

}