
import 'address_model.dart';
import 'name_model.dart';

class UserModel {
  final int id;
  final String username;
  final String email;
  final String password;
  final String phone;
  final AddressModel address;
   final NameModel name;

  /// ### UserModel
  ///
  /// Represent one user of the fakeStore
  UserModel(this.id, this.username, this.email, this.password, this.phone, this.address, this.name);

  @override
  String toString(){
    return 'UserModel('
    'id: $id, '
    'username: $username, '
    'email: $email, '
    'password: $password, '
    'phone: $phone, '
    'address: $address, '
    'name: $name'
    ')';
  }
  
}