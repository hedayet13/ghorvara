import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class chart extends StatefulWidget {
  @override
  _chartState createState() => _chartState();
}

class _chartState extends State<chart> {

  var rent = 0, current = 0, gas=0 , water = 0 ;
  double sum =0;
  double totalCurrent= 0;
  final rentController = TextEditingController(text: "0");
  final currentBillController = TextEditingController(text: "0");
  final gasBillController = TextEditingController(text: "0");
  final waterBillController = TextEditingController(text: "0");

  void addition(){
    setState(() {
      rent = int.parse(rentController.text);
      current = int.parse(currentBillController.text);
      totalCurrent = current * 5.50;
      gas = int.parse(gasBillController.text);
      water = int.parse(waterBillController.text);

      sum =rent+totalCurrent+gas+water;
      sum= double.parse(sum.toStringAsFixed(3));


    });
  }



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
        toolbarHeight: 300,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                addition();
                return showDialog(context: context, builder: (context){
                  return AlertDialog(
                    content: Text("Your Total Rent is: $sum taka"),
                  );
                });
              },
              child: Text("Total"),color: Colors.lightGreenAccent,),

            ],
          ),
        ),
      ),
    );
  }
}
