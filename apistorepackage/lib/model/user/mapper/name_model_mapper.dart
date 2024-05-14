
import '../name_model.dart';

NameModel nameModelFromJsonMapper(Map<String, dynamic> json) => NameModel(
      json['firstname'] as String,
      json['lastname'] as String,
    );

Map<String, dynamic> nameModelToJsonMapper(NameModel instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };