import 'package:flutter/material.dart';

abstract class BaseNavigator {
  void showLoading(String message);

  void showMessage();

  void hideLoading();
}

class BaseViewModel<NAV extends BaseNavigator> extends ChangeNotifier {
  NAV? navigator = null;
}

abstract class BaseView<T, VM extends BaseViewModel>
    extends State<StatefulWidget> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = initViewModel();
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading(
    String message,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Row(
              children: [
                Text(message),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void showMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("message"),
        );
      },
    );
  }
}
