
import 'package:apistorepackage/model/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:example/infraestructure/gateway/store_gateway.dart';

class UsersViewModel extends ChangeNotifier {
  UsersViewModel({required this.store});

  final StoreGateway store;

  final List<UserModel> users = [];
  var hasValidUsers = false;
  var hasErrorUsers = false;

  void getAllUsers() async {
    final allUsersEither = await store.getAllUsers();
    allUsersEither.fold(
      (l)
      {
        hasValidUsers = false;
        hasErrorUsers = true;
        notifyListeners();
      },
      (r){
        hasErrorUsers = false;
        users.addAll(r);
        hasValidUsers = true;
        notifyListeners();
      } ,
    );
  }

  void initUsers(){
    users.clear();
    hasValidUsers = false;
    hasErrorUsers = false;
    notifyListeners();
  }

}