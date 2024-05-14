
import '../geolocation_model.dart';

GeolocationModel geolocationModelFromJsonMapper(Map<String, dynamic> json) =>
    GeolocationModel(
      json['lat'] as String,
      json['long'] as String,
    );

Map<String, dynamic> geolocationModelToJsonMapper(GeolocationModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };