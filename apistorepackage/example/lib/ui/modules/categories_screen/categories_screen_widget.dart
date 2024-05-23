import 'package:example/domain/viewmodel/categories_viewmodel.dart';
import 'package:example/ui/modules/common/color_app.dart';
import 'package:example/ui/modules/common/common_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreenWidget extends StatefulWidget {
  const CategoriesScreenWidget({super.key});

  @override
  State<CategoriesScreenWidget> createState() => _CategoriesScreenWidgetState();
}

class _CategoriesScreenWidgetState extends State<CategoriesScreenWidget> {
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
      child: Consumer<CategoriesViewModel>(builder: (context, viewModel, child) {
        if (!hasInit) {
          hasInit = true;
          viewModel.getAllCategories();
        }
        return showData(
            viewModel.categories, viewModel.hasValidCategories, viewModel.hasErrorCategories,
            () {
          viewModel.initCategories ();
          viewModel.getAllCategories();
        });
      }),
    );
  }

    Widget showData(List<String> categoriesList, bool hasValidData, bool hasError,
      Function() onPressed) {
    if (hasError) {
      return errorTryAgainWidget(onPressed);
    } else if (hasValidData) {
      return SizedBox(
        width: 400,
        child: ListView.builder(
          itemCount: categoriesList.length,
          itemBuilder: (context, index) => Card(
            child: Text(categoriesList[index]),
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
          const Text('Error loading Categories data...'),
          const SizedBox(
            height: 15,
          ),
          CommonElevatedButtonWidget(text: "Try again", onPressed: onPressed),
        ],
      ),
    );
  }
}