import 'package:apistorepackage/infraestructure/api/public/store/store_api.dart';
import 'package:example/domain/viewmodel/cart_viewmodel.dart';
import 'package:example/domain/viewmodel/products_viewmodel.dart';
import 'package:example/domain/viewmodel/users_viewmodel.dart';
import 'package:example/infraestructure/gateway/store_gateway_impl.dart';
import 'package:example/ui/navigation/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final storeImpl = StoreGatewayImpl(
    store: StoreApi(),
  );

  @override
  Widget build(BuildContext context) {
    return provideProductsViewModel(context);
  }

  Widget provideProductsViewModel(BuildContext context) =>
      ChangeNotifierProvider(
        create: (context) => ProductsViewModel(
          store: storeImpl,
        ),
        child: provideUsersViewModel(context),
      );

  Widget provideUsersViewModel(BuildContext context) => ChangeNotifierProvider(
        create: (context) => UsersViewModel(
          store: storeImpl,
        ),
        child: provideCartViewModel(context),
      );

  Widget provideCartViewModel(BuildContext context) => ChangeNotifierProvider(
        create: (context) => CartViewModel(
          store: storeImpl,
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
