

import 'package:apistorepackage/infraestructure/api/public/store/interface/store_api_interface.dart';

class StoreGatewayImpl implements StoreApiInterface {

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