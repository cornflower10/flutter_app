import 'package:flutter/material.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:flutter_app/HomePageFul.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginState();
  }
}

class LoginState extends State<LoginPage> {
  var editController = TextEditingController();
  var passWDEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(color: Colors.white),
//      child: TextField(controller: editController,decoration: InputDecoration(hintText: "name"),),
          child: Column(
            children: <Widget>[
              TextField(
                controller: editController,
                decoration: InputDecoration(hintText: "name"),
              ),
              TextField(
                controller: passWDEditController,
                decoration: InputDecoration(hintText: "passwd"),
              ),
              new Container(
                margin: new EdgeInsetsDirectional.only(top: 16.0),
                width: 400,
                height: 48,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text(
                    "Login",
                    style: new TextStyle(fontSize: 18),
                  ),
                  onPressed: () => Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => HomePageFul())),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
