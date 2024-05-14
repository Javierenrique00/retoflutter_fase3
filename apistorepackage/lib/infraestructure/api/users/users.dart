
import '../../../model/user/user_model.dart';
import '../../../model/user/mapper/user_model_mapper.dart';
import '../common/baseio.dart';
import '../common/paths.dart';
import 'users_interface.dart';

class Users implements UsersInterface{

  final usersApi = Baseio<UserModel>(urlpath: Paths.urlUsers,serializer: (p0) => userModelFromJsonMapper(p0),);
  
  @override
  Future<ResponseGetAllUsers> getAllUsers() => usersApi.getAll();
  
  @override
  Future<ResponseGetUser> getSingleUser(int id) => usersApi.getSingle(id);

}