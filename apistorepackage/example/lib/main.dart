import 'package:apistorepackage/infraestructure/api/products/products.dart';
import 'package:example/infraestructure/gateway/store_gateway_impl.dart';
import 'package:example/ui/navigation/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'domain/viewmodel/app_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppViewModel(store: StoreGatewayImpl(products:Products())),
      child: const AppGlobalState(),
      );
  }
}

class AppGlobalState extends StatelessWidget {
  const AppGlobalState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El mercado fresco !',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: appRoutes,
    );
  }
}
