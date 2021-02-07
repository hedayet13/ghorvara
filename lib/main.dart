import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghorvara/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Come on"),
                  Text("In ghorvara"),
                  // ignore: deprecated_member_use
                  RaisedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>chart()));
                  },
                  child: Text("Lets put your data"),)
            ],
          )),
        ),
      ),
    );
  }
}
