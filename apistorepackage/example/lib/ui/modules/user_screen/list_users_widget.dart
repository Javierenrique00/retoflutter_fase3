import 'package:apistorepackage/model/user/user_model.dart';
import 'package:example/domain/viewmodel/users_viewmodel.dart';
import 'package:example/ui/modules/common/color_app.dart';
import 'package:example/ui/modules/common/common_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListUsersWidget extends StatefulWidget {
  const ListUsersWidget({super.key});

  @override
  State<ListUsersWidget> createState() => _ListUsersWidgetState();
}

class _ListUsersWidgetState extends State<ListUsersWidget> {
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
      child: Consumer<UsersViewModel>(builder: (context, viewModel, child) {
        if (!hasInit) {
          hasInit = true;
          viewModel.getAllUsers();
        }
        return showData(
            viewModel.users, viewModel.hasValidUsers, viewModel.hasErrorUsers,
            () {
          viewModel.initUsers();
          viewModel.getAllUsers();
        });
      }),
    );
  }

  Widget showData(List<UserModel> users, bool hasValidData, bool hasError,
      Function() onPressed) {
    if (hasError) {
      return errorTryAgainWidget(onPressed);
    } else if (hasValidData) {
      return SizedBox(
        width: 400,
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: Text(users[index].username),
              title: Text('${users[index].name.firstname} ${users[index].name.lastname}'),
              subtitle: Text(users[index].email),
              trailing: Text('${users[index].address.street} - ${users[index].address.city}'),
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
          const Text('Error loading Users data...'),
          const SizedBox(
            height: 15,
          ),
          CommonElevatedButtonWidget(text: "Try again", onPressed: onPressed),
        ],
      ),
    );
  }

}