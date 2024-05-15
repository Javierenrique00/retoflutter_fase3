
import 'package:dartz/dartz.dart';

import '../../../model/user/user_model.dart';

typedef ResponseGetAllUsers = Either<String, List<UserModel>>;
typedef ResponseGetUser = Either<String, UserModel>;

abstract interface class UsersInterface {

  Future<ResponseGetAllUsers> getAllUsers();
  Future<ResponseGetUser> getSingleUser(int id);
  
  
}