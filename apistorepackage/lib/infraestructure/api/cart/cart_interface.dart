
import 'package:dartz/dartz.dart';

import '../../../model/cart/cart_model.dart';


typedef ResponseGetAllCarts = Either<String, List<CartModel>>;
typedef ResponseGetCart = Either<String, CartModel>;

abstract class CartInterface {

  Future<ResponseGetAllCarts> getAllCarts();
  Future<ResponseGetCart> getSingleCart(int id);
  
}