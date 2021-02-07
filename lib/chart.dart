import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chart extends StatefulWidget {
  @override
  _chartState createState() => _chartState();
}

class _chartState extends State<chart> {

  final rentController = TextEditingController();
  final currentBillController = TextEditingController();
  final gasBillController = TextEditingController();
  final waterBillController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Put your data",
          style: TextStyle(fontSize: 50, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
        toolbarHeight: 200,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60, 30, 60, 0),
        child: Container(
          child: Column(
            children: [
              TextFormField(
                controller: rentController,
                decoration: InputDecoration(labelText: "House rent"),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: currentBillController,
                decoration:
                    InputDecoration(labelText: "Current bill (in unit)"),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: gasBillController,
                decoration: InputDecoration(labelText: "Gasbill"),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: waterBillController,
                decoration: InputDecoration(labelText: "Water bill"),
                keyboardType: TextInputType.number,
              ),
              Padding(padding: EdgeInsets.only(top: 50),),
              // ignore: deprecated_member_use
              RaisedButton(onPressed: (){
                return showDialog(context: context, builder: (context){
                  return AlertDialog(
                    content: Text(rentController.text+currentBillController.text),
                  );
                });
              },
              child: Text("Total"),),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Total"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
