
class GeolocationModel {
  final String lat;
  final String long;


  GeolocationModel(this.lat, this.long);

  @override
  String toString(){
    return 'GeolocationModel('
    'lat: $lat, '
    'long: $long, '
    ')';
  }
  
}