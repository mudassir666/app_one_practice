import 'package:app_one_practice/utils/Constants.dart';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VIEW DATA"),
        actions: [
          IconButton(
              onPressed: () {
                Constants.prefs.setBool("loggedView", false);
                Navigator.pushReplacementNamed(context, "/home");
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
    );
  }
}
