

import 'package:apistorepackage/model/product/product_model.dart';
import 'package:example/infraestructure/gateway/store_gateway.dart';
import 'package:flutter/material.dart';

class AppViewModel extends ChangeNotifier {
  AppViewModel({required this.store});

  final StoreGateway store;
  final List<ProductModel> products =  [];
  var hasValidProducts = false;
  var hasError = false;


  void getAllProducts() async {
    final allProductsEither = await store.getAllProducts();
    allProductsEither.fold(
      (l)
      {
        hasError = true;
        hasValidProducts = false;
        hasError = true;
        notifyListeners();
      },
      (r){
        hasError = false;
        products.addAll(r);
        hasValidProducts = true;
        notifyListeners();
      } ,
    );
  }

  void initData(){
    products.clear();
    hasValidProducts = false;
    hasError = false;
    notifyListeners();
  }



}