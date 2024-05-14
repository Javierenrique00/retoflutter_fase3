import 'package:apistorepackage/model/cart/cart_model.dart';
import 'package:example/infraestructure/gateway/store_gateway.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  CartViewModel({required this.store});

 final StoreGateway store;

  final List<CartModel> cart = [];
  var hasValidCart = false;
  var hasErrorCart = false;

    void getAllCart() async {
    final allcartEither = await store.getAllCarts();
    allcartEither.fold(
      (l)
      {
        hasValidCart = false;
        hasErrorCart = true;
        notifyListeners();
      },
      (r){
        hasErrorCart = false;
        cart.addAll(r);
        hasValidCart = true;
        notifyListeners();
      } ,
    );
  }

  void initCart(){
    cart.clear();
    hasValidCart = false;
    hasErrorCart = false;
    notifyListeners();
  }

}