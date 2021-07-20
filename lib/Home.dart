import 'package:app_one_practice/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_one_practice/Pic_3.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    setState(() {});
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "INFOMATION",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Pic_3(),
          Center(
            child: SingleChildScrollView(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    children: [
                      Image.network(
                          "https://editorial.fxstreet.com/images/Markets/Commodities/Metals/Gold/stack-of-golden-bars-in-the-bank-vault-60756080_16x9.jpg"),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Enter Name",
                                labelText: "NAME",
                                icon: Icon(Icons.person),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "Enter Number",
                                labelText: "PHONE",
                                icon: Icon(Icons.phone),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Enter Email",
                                labelText: "EMAIL",
                                icon: Icon(Icons.email),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Constants.prefs.setBool("View_Page", true);
                                Constants.prefs.setBool("loggedView", true);
                                Navigator.pushReplacementNamed(context, "/view");
                              },
                              child: Text(
                                "DONE",
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: data != null
            ? ListView.builder(
                // padding: EdgeInsets.zero,
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      data[index]["title"],
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                    ),
                    subtitle: Text(
                      "ID : ${data[index]["id"]}",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        data[index]["url"],
                      ),
                    ),
                    tileColor: Colors.amber[100],
                  );
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
