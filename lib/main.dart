import 'package:app_one_practice/View.dart';
import 'package:app_one_practice/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();


  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home:
      //  MyHomePage(),
       Constants.prefs.getBool("loggedView")==true 
       ? View() 
       : MyHomePage(),
      routes: {
        "/view": (context) => View(),
        "/home": (context) => MyHomePage()
      },
    ),
  );
}
