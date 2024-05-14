
import 'package:apistorepackage/infraestructure/api/products/products_interface.dart';

abstract class StoreGateway {

  Future<ResponseGetAllProducts> getAllProducts();
  Future<ResponseGetProduct> getSingleProduct(int id);

}