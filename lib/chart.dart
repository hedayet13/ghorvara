import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class chart extends StatefulWidget {
  @override
  _chartState createState() => _chartState();
}

class _chartState extends State<chart> {
  bool _validateRent = false;
  bool _validateCurrent = false;
  bool _validateGas = false;
  bool _validatewater = false;

  bool value1 = false;
  bool value2 = false;
  bool currentValue1 = false;
  bool currentValue2 = false;

  var rent = 0, current = 0, gas = 0, water = 0;
  var stoveNum = 0;
  double sum = 0;
  double totalCurrent = 0, currentUnit = 0;

  final rentController = TextEditingController(text: "0");
  final currentBillController = TextEditingController(text: "0");
  // final gasBillController = TextEditingController();
  final waterBillController = TextEditingController(text: "0");

  void addition() {
    setState(() {
      rent = int.parse(rentController.text);
      current = int.parse(currentBillController.text);
      totalCurrent = current * currentUnit;
      // gas = int.parse(gasBillController.text);
      water = int.parse(waterBillController.text);

      if ((currentValue1 == false && currentValue2 == false) ||
          (value1 == false && value2 == false)) {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.red,
                content: Text(
                  '''Please select the check the box of current bill "In Unit" or "In TaKa" and Gas bill "Single Stove" or "Double Stove"''',
                  style: TextStyle(color: Colors.white),
                ),
              );
            });
      }

      sum = rent + totalCurrent + gas + water;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.greenAccent,
        title: Text(
          "Put your data",
          style: TextStyle(
            fontSize: 50,
            color: Colors.greenAccent,
            fontFamily: 'brownies_cake',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        toolbarHeight: 200,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 100)),
                TextFormField(
                  controller: rentController,
                  decoration: InputDecoration(
                      labelText: "House rent",
                      errorText: _validateRent ? "Can't be Empty" : null,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.house_outlined)),
                  keyboardType: TextInputType.number,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Current(),
                // TextFormField(
                //   controller: currentBillController,
                //   decoration: InputDecoration(
                //       labelText: "Current bill (in unit)",
                //       errorText: _validateCurrent ? "Can't be Empty" : null,
                //       border: OutlineInputBorder(),
                //       prefixIcon: Icon(MdiIcons.flash)),
                //   keyboardType: TextInputType.number,
                // ),
                Padding(padding: EdgeInsets.only(top: 10)),
                // TextFormField(
                //   controller: gasBillController,
                //   decoration: InputDecoration(
                //       labelText: "Gasbill",
                //       errorText: _validateGas ? "Can't be Empty" : null,
                //       border: OutlineInputBorder(),
                //       prefixIcon: Icon(MdiIcons.campfire)),
                //   keyboardType: TextInputType.number,
                // ),
                Gas(),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextFormField(
                  controller: waterBillController,
                  decoration: InputDecoration(
                      labelText: "Water bill",
                      errorText: _validatewater
                          ? "Can't be Empty. If no bill put 0"
                          : null,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(MdiIcons.water)),
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                // ignore: deprecated_member_use
                SizedBox(
                  height: 60,
                  width: 200,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    hoverColor: Colors.black38,
                    onPressed: () {
                      setState(() {
                        rentController.text.isEmpty
                            ? _validateRent = true
                            : _validateRent = false;
                        currentBillController.text.isEmpty
                            ? _validateCurrent = true
                            : _validateCurrent = false;
                        // gasBillController.text.isEmpty
                        //     ? _validateGas = true
                        //     : _validateGas = false;
                        waterBillController.text.isEmpty
                            ? _validatewater = true
                            : _validatewater = false;
                      });
                      addition();
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  '''Number of stove = $stoveNum stove \nTotal Rent is = $sum taka '''),
                            );
                          });
                    },
                    shape: StadiumBorder(),
                    child: Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 30,
                        fontFamily: 'brownies_cake',
                      ),
                    ),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Current() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Current Bill"),
              Checkbox(
                  value: currentValue1,
                  onChanged: (currentValue1) {
                    setState(() {
                      this.currentValue1 = currentValue1;
                      if (currentValue1 == true) {
                        currentUnit = 5.50;
                        currentValue2 = false;
                        // stoveNum = 1;
                      }
                    });
                  }),
              Text("In units"),
              Checkbox(
                  value: currentValue2,
                  onChanged: (currentValue2) {
                    setState(() {
                      this.currentValue2 = currentValue2;
                      if (currentValue2 = true) {
                        currentUnit = 1;
                        currentValue1 = false;
                        // print("Currentunit = 0");
                        // stoveNum = 1;
                      }
                    });
                  }),
              Text("In Taka"),
            ],
          ),
          TextFormField(
            controller: currentBillController,
            decoration: InputDecoration(
                labelText: "Current bill (in unit)",
                errorText: _validateCurrent ? "Can't be Empty" : null,
                prefixIcon: Icon(MdiIcons.flash)),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Gas() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 10)),
          Text("Gas Bill: "),
          Checkbox(
              value: value1,
              onChanged: (value1) {
                setState(() {
                  this.value1 = value1;
                  if (value1 == true) {
                    gas = 925;
                    value2 = false;
                    stoveNum = 1;
                  } else {
                    gas = 0;
                    stoveNum = 0;
                  }
                });
              }),
          Icon(MdiIcons.campfire),
          Text("Single Stove"),
          Checkbox(
              value: value2,
              onChanged: (value2) {
                setState(() {
                  this.value2 = value2;
                  if (value2 == true) {
                    gas = 975;
                    stoveNum = 2;
                    value1 = false;
                  } else {
                    gas = 0;
                    stoveNum = 0;
                  }
                });
              }),
          Icon(MdiIcons.campfire),
          Icon(MdiIcons.campfire),
          Text("Double Stove")
        ],
      ),
    );
  }
}

//ToDo current bill value per unit taka or full value
//todo save data monthly
//todo Add calender for save data
