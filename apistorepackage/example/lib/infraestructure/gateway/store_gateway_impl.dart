

import 'package:apistorepackage/infraestructure/api/products/products_interface.dart';
import 'package:apistorepackage/infraestructure/api/store/store_api_interface.dart';
import 'package:apistorepackage/infraestructure/api/users/users_interface.dart';
import 'package:apistorepackage/infraestructure/api/cart/cart_interface.dart';
import 'package:example/infraestructure/gateway/store_gateway.dart';

class StoreGatewayImpl implements StoreGateway {

  StoreGatewayImpl({required this.store});

late final StoreApiInterface store;

  @override
  Future<ResponseGetAllProducts> getAllProducts() => store.getAllProducts();

  @override
  Future<ResponseGetProduct> getSingleProduct(int id) => store.getSingleProduct(id);
    
  @override
  Future<ResponseGetAllUsers> getAllUsers() => store.getAllUsers();

  @override
  Future<ResponseGetUser> getSingleUser(int id) => store.getSingleUser(id);
  
  @override
  Future<ResponseGetAllCarts> getAllCarts() => store.getAllCarts();

  @override
  Future<ResponseGetCart> getSingleCart(int id) => store.getSingleCart(id);

}