import 'package:apistorepackage/infraestructure/api/public/store/interface/store_api_interface.dart';
import 'package:apistorepackage/model/product/product_model.dart';
import 'package:flutter/material.dart';

class ProductsViewModel extends ChangeNotifier {
  ProductsViewModel({required this.store});

  final StoreApiInterface store;

  final List<ProductModel> products =  [];
  var hasValidProducts = false;
  var hasErrorProducts = false;

    void getAllProducts() async {
    final allProductsEither = await store.getAllProducts();
    allProductsEither.fold(
      (l)
      {
        hasValidProducts = false;
        hasErrorProducts = true;
        notifyListeners();
      },
      (r){
        hasErrorProducts = false;
        products.addAll(r);
        hasValidProducts = true;
        notifyListeners();
      } ,
    );
  }

  void initProducts(){
    products.clear();
    hasValidProducts = false;
    hasErrorProducts = false;
    notifyListeners();
  }

}