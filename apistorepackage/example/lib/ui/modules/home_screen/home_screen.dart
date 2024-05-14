import 'package:example/ui/modules/common/color_app.dart';
import 'package:example/ui/modules/home_screen/list_products_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
        backgroundColor: ColorApp.appBarrBackground,
      ),
      body: const ListProductsWidget(),
    );
  }
}