
import '../../../model/product/product_model.dart';
import '../../../model/product/mapper/product_model_mapper.dart';
import '../common/baseio.dart';
import '../common/paths.dart';
import 'products_interface.dart';

final class Products implements ProductsInterface{

  final productsApi = Baseio<ProductModel>(urlpath: Paths.urlProducts,serializer: (p0) => productModelFromJsonMapper(p0),);
  
  @override
  Future<ResponseGetAllProducts> getAllProducts() => productsApi.getAll();
  
  @override
  Future<ResponseGetProduct> getSingleProduct(int id)  => productsApi.getSingle(id);

}