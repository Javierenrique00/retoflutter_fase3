
class NameModel {
  final String firstname;
  final String lastname;


  NameModel(this.firstname, this.lastname );

  @override
  String toString(){
    return 'NameModel('
    'firstname: $firstname, '
    'lastname: $lastname, '
    ')';
  }
  
}