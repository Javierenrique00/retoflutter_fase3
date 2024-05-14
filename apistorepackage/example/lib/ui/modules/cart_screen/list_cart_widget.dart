import 'package:apistorepackage/model/cart/cart_model.dart';
import 'package:example/domain/viewmodel/cart_viewmodel.dart';
import 'package:example/ui/modules/common/color_app.dart';
import 'package:example/ui/modules/common/common_elevated_button_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCartWidget extends StatefulWidget {
  const ListCartWidget({super.key});

  @override
  State<ListCartWidget> createState() => _ListCartWidgetState();
}

class _ListCartWidgetState extends State<ListCartWidget> {
var hasInit = false;

  @override
  void initState() {
    super.initState();
    hasInit = false;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Consumer<CartViewModel>(builder: (context, viewModel, child) {
        if (!hasInit) {
          hasInit = true;
          viewModel.getAllCart();
        }
        return showData(
            viewModel.cart, viewModel.hasValidCart, viewModel.hasErrorCart,
            () {
          viewModel.initCart();
          viewModel.getAllCart();
        });
      }),
    );
  }

  Widget showData(List<CartModel> cart, bool hasValidData, bool hasError,
      Function() onPressed) {
    if (hasError) {
      return errorTryAgainWidget(onPressed);
    } else if (hasValidData) {
      return SizedBox(
        width: 400,
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: Text('UserId: ${cart[index].userId}'),
              title: Text('products:${cart[index].products.length}'),
              subtitle: Text(cart[index].date),
            ),
          ),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          color: ColorApp.circularProgress,
        ),
      );
    }
  }


  Widget errorTryAgainWidget(Function() onPressed) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Error loading Cart data...'),
          const SizedBox(
            height: 15,
          ),
          CommonElevatedButtonWidget(text: "Try again", onPressed: onPressed),
        ],
      ),
    );
  }

}