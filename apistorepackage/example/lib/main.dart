import 'package:apistorepackage/infraestructure/api/products/products.dart';
import 'package:apistorepackage/infraestructure/api/users/users.dart';
import 'package:apistorepackage/infraestructure/api/cart/cart.dart';
import 'package:example/domain/viewmodel/cart_viewmodel.dart';
import 'package:example/domain/viewmodel/products_viewmodel.dart';
import 'package:example/domain/viewmodel/users_viewmodel.dart';
import 'package:example/infraestructure/gateway/store_gateway_impl.dart';
import 'package:example/ui/navigation/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return provideProductsViewModel(context);
  }

  Widget provideProductsViewModel(BuildContext context) =>
      ChangeNotifierProvider(
        create: (context) => ProductsViewModel(
          store: StoreGatewayImpl(
            products: Products(),
            users: Users(),
            cart: Cart(),
          ),
        ),
        child: provideUsersViewModel(context),
      );

    Widget provideUsersViewModel(BuildContext context) =>
      ChangeNotifierProvider(
        create: (context) => UsersViewModel(
          store: StoreGatewayImpl(
            products: Products(),
            users: Users(),
            cart: Cart(),
          ),
        ),
        child: provideCartViewModel(context),
      );

      Widget provideCartViewModel(BuildContext context) =>
      ChangeNotifierProvider(
        create: (context) => CartViewModel(
          store: StoreGatewayImpl(
            products: Products(),
            users: Users(),
            cart: Cart(),
          ),
        ),
        child: const AppGlobalState(),
      );
}

class AppGlobalState extends StatelessWidget {
  const AppGlobalState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store !',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: appRoutes,
    );
  }
}
