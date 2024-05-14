

import 'package:apistorepackage/infraestructure/api/products/products_interface.dart';
import 'package:apistorepackage/infraestructure/api/users/users_interface.dart';
import 'package:apistorepackage/infraestructure/api/cart/cart_interface.dart';
import 'package:example/infraestructure/gateway/store_gateway.dart';

class StoreGatewayImpl implements StoreGateway {

  StoreGatewayImpl({required this.products,required this.users, required this.cart});

final ProductsInterface products;
final UsersInterface users;
final CartInterface cart;

  @override
  Future<ResponseGetAllProducts> getAllProducts() => products.getAllProducts();

  @override
  Future<ResponseGetProduct> getSingleProduct(int id) => products.getSingleProduct(id);
    
  @override
  Future<ResponseGetAllUsers> getAllUsers() => users.getAllUsers();

  @override
  Future<ResponseGetUser> getSingleUser(int id) => users.getSingleUser(id);
  
  @override
  Future<ResponseGetAllCarts> getAllCarts() => cart.getAllCarts();

  @override
  Future<ResponseGetCart> getSingleCart(int id) => cart.getSingleCart(id);

}