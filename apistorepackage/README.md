# Descripción

Este paquete se desarrolla como dependencia para un proyecto de dart o flutter el cual permite conectarse a la API del Fake Store: [Link fake Store](https://fakestoreapi.com/) para hacer hacer consultas de productos, usuarios y el carrito por medio de las interfaces:

- ProductsInterface
- UsersInterface
- CartInterface

Estas interfaces proveen el contrato que describen la implementación de las clases respectivas:

- Products
- Users
- Cart

## Detalle de los datos obtenidos por el API

Las funciones que proveen los datos devuelven un Futuro con un Either el cual está compuesto de un String con la descripción del error como primer dato y con el resultado de la consulta como segundo dato.

```dart
typedef ResponseGetAllProducts = Either<String, List<ProductModel>>;
typedef ResponseGetProduct = Either<String, ProductModel>;

abstract class ProductsInterface {

  Future<ResponseGetAllProducts> getAllProducts();
  Future<ResponseGetProduct> getSingleProduct(int id);
  
}
```

## Prerequisitos

Dart 3.x o Flutter 3.x

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

Dependencias en el archivo pubspec.yaml

## Uso

Para acceder a los datos del repositorio:

La implementación de esta interface es Products(), es la encargada de obtener los datos directamente así:,

Ejemplo que trae los todos los productos:

```dart
  final allProductsEither = await Products().getAllProducts();
  allProductsEither.fold(
    (l) => print('error code $l'),
    (r){
      print('loaded all products: qty:${r.length}');
      print('Primer producto: ${r[0]}');
    } ,
  );
```

Ejemplo que trae todos los usuarios:

```dart
  final allUsersEither = await Users().getAllUsers();
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
  final allCartEither = await Cart().getAllCarts();
  allCartEither.fold(
    (l) => print('error code $l'),
    (r){
        print('loaded all carts: qty:${r.length}');
        print('cart1:${r[0]}');
        },
  );

```

Para un ejemplo detallado ver el proyecto de flutter en ./example

## Información adicional

Para más detalle ver la documentación del api en:

[Documentación fake Store](https://fakestoreapi.com/docs)
