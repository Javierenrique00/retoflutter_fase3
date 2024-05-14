import 'package:apistorepackage/model/product/product_model.dart';
import 'package:example/domain/viewmodel/products_viewmodel.dart';
import 'package:example/ui/modules/common/color_app.dart';
import 'package:example/ui/modules/common/common_elevated_button_widget.dart';
import 'package:example/ui/modules/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProductsWidget extends StatefulWidget {
  const ListProductsWidget({super.key});

  @override
  State<ListProductsWidget> createState() => _ListProductsWidgetState();
}

class _ListProductsWidgetState extends State<ListProductsWidget> {
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
      child: Consumer<ProductsViewModel>(builder: (context, viewModel, child) {
        if (!hasInit) {
          hasInit = true;
          viewModel.getAllProducts();
        }
        return showData(
            viewModel.products, viewModel.hasValidProducts, viewModel.hasErrorProducts,
            () {
          viewModel.initProducts();
          viewModel.getAllProducts();
        });
      }),
    );
  }

  Widget showData(List<ProductModel> products, bool hasValidData, bool hasError,
      Function() onPressed) {
    if (hasError) {
      return errorTryAgainWidget(onPressed);
    } else if (hasValidData) {
      return SizedBox(
        width: 400,
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: Image.network(products[index].image),
              title: Text(products[index].title),
              subtitle: Text(products[index].category),
              trailing: Text(Utils.convCurrency(products[index].price)),
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
          const Text('Error loading Products data...'),
          const SizedBox(
            height: 15,
          ),
          CommonElevatedButtonWidget(text: "Try again", onPressed: onPressed),
        ],
      ),
    );
  }
}
