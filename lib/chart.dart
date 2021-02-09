import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghorvara/currentChart.dart';
import 'package:ghorvara/gaschart.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class chart extends StatefulWidget {
  @override
  _chartState createState() => _chartState();
}

class _chartState extends State<chart> {
  bool _validateRent = false;
  // bool _validateGas = false;
  bool _validatewater = false;

  var rent = 0, current = 0, water = 0;

  double sum = 0;
  double totalCurrent = 0, currentUnit = 0;

  final rentController = TextEditingController();
  final waterBillController = TextEditingController(text: "0");
  

  void addition() {
    setState(() {
      rent = int.parse(rentController.text);
      current = int.parse(currentBillController.text);
      currentUnit = double.parse(unitPriceController.text);
      // totalCurrent = current * currentUnit;
      gas = int.parse(gasBillController.text);
      if (value1 == true) {
        gas = 925;
      }
      if (value2 == true) {
        gas = 975;
      }
      water = int.parse(waterBillController.text);
      if (currentValue1 == false) {
        currentUnit = 1;
      }
      totalCurrent = current * currentUnit;

      if ((currentValue1 == false && currentValue2 == false) ||
          (value1 == false && value2 == false && value3 == false)) {
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
        
                CurrentChart(),
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
                GasChart(),
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
                            ? validateCurrent = true
                            : validateCurrent = false;
                        // gasBillController.text.isEmpty
                        //     ? _validateGas = true
                        //     : _validateGas = false;
                        waterBillController.text.isEmpty
                            ? _validatewater = true
                            : _validatewater = false;
                        unitPriceController.text.isEmpty
                            ? validateUnitPrice = true
                            : validateUnitPrice = false;
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

  // ignore: non_constant_identifier_names

}

//ToDo current bill value per unit taka or full value
//todo save data monthly
//todo Add calender for save data
