
import '../address_model.dart';
import 'geolocation_model_mapper.dart';

AddressModel addressModelFromJsonMapper(Map<String, dynamic> json) => AddressModel(
      json['city'] as String,
      json['street'] as String,
      (json['number'] as num).toInt(),
      json['zipcode'] as String,
      geolocationModelFromJsonMapper(json['geolocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> addressModelToJsonMapper(AddressModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipcode,
      'geolocation': geolocationModelToJsonMapper(instance.geolocation),
    };