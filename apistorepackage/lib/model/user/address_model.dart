
import 'geolocation_model.dart';

class AddressModel {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final GeolocationModel geolocation;

  AddressModel(this.city, this.street, this.number, this.zipcode, this.geolocation);

  @override
  String toString(){
    return 'AddressModel('
    'city: $city, '
    'street: $street, '
    'number: $number, '
    'zipcode: $zipcode, '
    'address: $geolocation'
    ')';
  }
  
}