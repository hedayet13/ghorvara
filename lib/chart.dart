import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class chart extends StatefulWidget {
  @override
  _chartState createState() => _chartState();
}

class _chartState extends State<chart> {
  var rent = 0, current = 0, gas = 0, water = 0;
  double sum = 0;
  double totalCurrent = 0;
  final rentController = TextEditingController();
  final currentBillController = TextEditingController();
  final gasBillController = TextEditingController();
  final waterBillController = TextEditingController();

  void addition() {
    setState(() {
      rent = int.parse(rentController.text);
      current = int.parse(currentBillController.text);
      totalCurrent = current * 5.50;
      gas = int.parse(gasBillController.text);
      water = int.parse(waterBillController.text);

      sum = rent + totalCurrent + gas + water;
      sum = double.parse(sum.toStringAsFixed(3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Put your data",
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        toolbarHeight: 200,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: rentController,
                decoration: InputDecoration(
                    labelText: "House rent",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.house_outlined)),
                keyboardType: TextInputType.number,
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              TextFormField(
                controller: currentBillController,
                decoration: InputDecoration(
                    labelText: "Current bill (in unit)",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(MdiIcons.flash)),
                keyboardType: TextInputType.number,
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              TextFormField(
                controller: gasBillController,
                decoration: InputDecoration(
                    labelText: "Gasbill",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(MdiIcons.campfire)),
                keyboardType: TextInputType.number,
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              TextFormField(
                controller: waterBillController,
                decoration: InputDecoration(
                    labelText: "Water bill",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(MdiIcons.water)),
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  addition();
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Your Total Rent is: $sum taka"),
                        );
                      });
                },
                shape: StadiumBorder(),
                child: Text(
                  "Total",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
