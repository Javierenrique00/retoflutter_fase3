
import 'adress_model_mapper.dart';
import 'name_model_mapper.dart';
import '../user_model.dart';

UserModel userModelFromJsonMapper(Map<String, dynamic> json) => UserModel(
      (json['id'] as num).toInt(),
      json['username'] as String,
      json['email'] as String,
      json['password'] as String,
      json['phone'] as String,
      addressModelFromJsonMapper(json['address'] as Map<String, dynamic>),
      nameModelFromJsonMapper(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> userModelToJsonMapper(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'address': addressModelToJsonMapper(instance.address),
      'name': nameModelToJsonMapper(instance.name),
    };