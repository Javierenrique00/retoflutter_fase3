# Descripción

Este paquete de Dart/flutter que permite conectarse a la API del Fake Store: [Fake Store](https://fakestoreapi.com/) para hacer hacer consultas de productos, usuarios y el carrito.

## Prerequisitos

Dart 3.x o Flutter 3.x

## Versión

apistorepackege: 1.0.0

## Instalación

Para usar este paquete se hace agregándolo a la dependencia en el archivo pubspec.yaml y dado que está publicado en Github la conexión es así:

```yaml
dependencies:
  flutter:
    sdk: flutter
  apistorepackage:
    git:
      url: https://github.com/Javierenrique00/retoflutter_fase3.git
      ref: main
      path: apistorepackage
```

También se puede hacer como dependencia local cuando se haya hecho un clone del repositorio de github [Repositorio](https://github.com/Javierenrique00/retoflutter_fase3.git)

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  apistorepackage:
    path: ../
```

## Tipos de datos de respuesta

Los resultados se van a encapsular en las siguientes clases:

- ProductModel
- UserModel
- CartModel

Con los siguientes campos así:

### ProductModel

```dart
class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
```

---

### UserModel

```dart
class UserModel {
  final int id;
  final String username;
  final String email;
  final String password;
  final String phone;
  final AddressModel address;
   final NameModel name;
```

Aquí observamos que hay un tipo de dato AddressModel y NameModel descritos a continuación:

```dart
class NameModel {
  final String firstname;
  final String lastname;
```

```dart
class AddressModel {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final GeolocationModel geolocation;
```

```dart
class GeolocationModel {
  final String lat;
  final String long;
```

---

```dart
class CartModel {
  final int id;
  final int userId;
  final String date;
  final List<ProductsQtyModel> products;
```

Esta tiene la clase `ProductsQtyModel`.

```dart
class ProductsQtyModel {
  final int productId;
  final int quantity;
```

## Api

### Llamadas

La clase StoreApi se inicializa así: `StoreApi()`y se puede hacer el llamado a las funciones a continuación:

```dart
class StoreApi {

  ...

  Future<Either<String, List<ProductModel>>> getAllProducts();

  Future<Either<String, ProductModel>> getSingleProduct(int id);

  Future<Either<String, List<UserModel>>> getAllUsers();

  Future<Either<String, UserModel>> getSingleUser(int id);

  Future<Either<String, List<CartModel>>> getAllCarts();

  Future<Either<String, CartModel>> getSingleCart(int id);
}
```

### Repuestas

Las respuetas son todas tipo `Future`, encapsulando un `Either` que contiene un `String` como primer dato, y la respuesta como segundo dato.

- String (Primera respuesta del Either): Va a contener la descripción del error, el cual puede ser generado por una excepción, por ejemplo descerializando o un error en el endpoint.
- Resultado (Segunda respuesta del Either): va a contener el resultado exitoso, puede obtene run tipo de dato descrito con anterioridad como es el `CarModel`, `ProductModel`, etc. y una repsuesta múltiple con su `List`.

## Ejemplo

Ejemplo que trae los todos los productos:

```dart
  final allProductsEither = await StoreApi().getAllProducts();
  allProductsEither.fold(
    (l) => print('error code $l'),
    (r){
      print('loaded all products: qty:${r.length}');
      print('Primer producto: ${r[0]}');
    } ,
  );
```

El resultado obtenido son del tipo `Future<Either<String, List<ProductModel>>>` y por tanto podemos usar un `await` que nos maneje el Either. Aquí observamos que el par de datos del Either son un String para el primer dato y una lista de productos para el segundo dato.

Ejemplo que trae todos los usuarios:

```dart
  final allUsersEither = await StoreApi().getAllUsers();
  allUsersEither.fold(
    (l) => print('error code $l'),
    (r){
        print('loaded all users: qty:${r.length}');
        print('user1:${r[0]}');
        },
  );
```

Ejemplo que trae todos los carritos:

```dart
  final allCartEither = await StoreApi().getAllCarts();
  allCartEither.fold(
    (l) => print('error code $l'),
    (r){
        print('loaded all carts: qty:${r.length}');
        print('cart1:${r[0]}');
        },
  );

```

Ejemplo detallado del proyecto de flutter en ./example

## Información adicional

Para más detalle ver la documentación del FakeApi en:

[Documentación fake Store](https://fakestoreapi.com/docs)
