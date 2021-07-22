import 'package:app_one_practice/utils/Constants.dart';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
 
  late String ration = "50";

  String aMath(String a) {
    // var grade = a;
    switch (a) {
      case "A":
        {
          print("Excellent");
          return ration = "10";
        }
      //break;

      case "B":
        {
          print("Good");
          return ration = "20";
        }
      //break;

      case "C":
        {
          print("Fair");
          return ration = "30";
        }
      //break;

      case "D":
        {
          print("Poor");
          return ration = "40";
        }
      //break;

      default:
        {
          print("Invalid choice");
          return ration = "60";
        }
      //break;
    }
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _choice = TextEditingController();
  List<String> save = [];
  late String word;

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
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                children: [
                  TextFormField(
                    controller: _name,
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
                    controller: _choice,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Choice a number",
                      labelText: "CHOICE",
                      icon: Icon(Icons.zoom_out),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(ration),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        // var change = _choice.text.toString();
                        aMath(_choice.text.toString());
                        setState(() {
                          
                        });
                      },
                      icon: Icon(Icons.zoom_in_outlined),
                      label: Text("Choice"))
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          word = _name.text;
          save.add(word);
          setState(() {});
          print(save);
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: save.length != 0
            ? ListView.builder(
                // padding: EdgeInsets.zero,
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      save[index],
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                    ),
                    tileColor: Colors.amber[100],
                  );
                },
                itemCount: save.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
