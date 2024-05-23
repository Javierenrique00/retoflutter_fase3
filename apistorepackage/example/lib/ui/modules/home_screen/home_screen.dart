import 'package:example/ui/modules/cart_screen/list_cart_widget.dart';
import 'package:example/ui/modules/categories_screen/categories_screen_widget.dart';
import 'package:example/ui/modules/common/color_app.dart';
import 'package:example/ui/modules/product_screen/list_products_widget.dart';
import 'package:example/ui/modules/user_screen/list_users_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Store data'),
            backgroundColor: ColorApp.appBarrBackground,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Product',
                ),
                Tab(
                  icon: Icon(Icons.people),
                  text: 'User',
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: 'Cart',
                ),
                Tab(
                  icon: Icon(Icons.account_tree_rounded),
                  text: 'Categories',
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ListProductsWidget(),
              ListUsersWidget(),
              ListCartWidget(),
              CategoriesScreenWidget()
            ],
          ),
        ));
  }
}
