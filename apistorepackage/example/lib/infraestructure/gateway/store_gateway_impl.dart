

import 'package:apistorepackage/infraestructure/api/products/products_interface.dart';
import 'package:example/infraestructure/gateway/store_gateway.dart';

class StoreGatewayImpl implements StoreGateway {

  StoreGatewayImpl({required this.products});

final ProductsInterface products;

  @override
  Future<ResponseGetAllProducts> getAllProducts() => products.getAllProducts();

  @override
  Future<ResponseGetProduct> getSingleProduct(int id) => products.getSingleProduct(id);


}