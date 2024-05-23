

import 'package:apistorepackage/infraestructure/api/public/store/interface/store_api_interface.dart';
import 'package:flutter/material.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({required this.store});

  final StoreApiInterface store;

  final List<String> categories =  [];
  var hasValidCategories = false;
  var hasErrorCategories = false;

    void getAllCategories() async {
    final allCategoriesEither = await store.getAllCategories();
    allCategoriesEither.fold(
      (l)
      {
        hasValidCategories = false;
        hasErrorCategories = true;
        notifyListeners();
      },
      (r){
        hasErrorCategories = false;
        categories.clear();
        categories.addAll(r);
        hasValidCategories = true;
        notifyListeners();
      } ,
    );
  }

  void initCategories(){
    categories.clear();
    hasValidCategories = false;
    hasErrorCategories = false;
    notifyListeners();
  }

}