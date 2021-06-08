import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghorvara/Database/database.dart';
import 'package:ghorvara/currentChart.dart';
import 'package:ghorvara/gaschart.dart';
import 'package:intl/intl.dart';
// import 'package:month_picker_dialog/month_picker_dialog.dart';
// import 'package:ghorvara/monthPickChart.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sqflite/sqflite.dart';

class chart extends StatefulWidget {
  @override
  _chartState createState() => _chartState();
}

class _chartState extends State<chart> {
  DateTime selectedDate = DateTime.now();

  bool _validateRent = false;
  // bool _validateGas = false;
  bool _validatewater = false;

  double rent = 0, current = 0, water = 0;

  double sum = 0;
  double totalCurrent = 0, currentUnit = 0;

  final rentController = TextEditingController(text: "0");
  final waterBillController = TextEditingController(text: "0");

  void addition() {
    setState(() {
      rent = double.parse(rentController.text);
      current = double.parse(currentBillController.text);
      currentUnit = double.parse(unitPriceController.text);
      // totalCurrent = current * currentUnit;
      gas = double.parse(gasBillController.text);
      if (value1 == true) {
        gas = 925;
      }
      if (value2 == true) {
        gas = 975;
      }
      water = double.parse(waterBillController.text);
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
    String _formatDate = new DateFormat.yMMMd().format(selectedDate);

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
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(60, 0, 60, 10),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 50)),
                  // Text("${selectedDate.toLocal()}".split(' ')[0]),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        height: 30,
                        width: 100,
                        alignment: Alignment.center,
                        child: Text(
                          "Select date:",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Flexible(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.calendar_today),
                            // hintText: ("${selectedDate.toLocal()}".split(' ')[0]),
                            hintText:
                                ("${_formatDate.split(' ')[0]} ${_formatDate.split(',')[1]}"),

                            // border: OutlineInputBorder(),
                          ),
                          onTap: () async {
                            final DateTime picked = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2030),
                                initialDatePickerMode: DatePickerMode.year,
                                builder: (context, child) {
                                  return Theme(
                                    child: child,
                                    data: ThemeData.dark().copyWith(
                                        colorScheme:
                                            ColorScheme.dark().copyWith(
                                      primary: Colors.greenAccent,
                                    )),
                                  );
                                });
                            if (picked != null && picked != selectedDate)
                              setState(() {
                                selectedDate = picked;
                                print(selectedDate);
                              });
                          },
                        ),
                      ),
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(top: 10)),
                  // CalenderChart(context),
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
                      onPressed: () async {
                        // Database db = await DatabaseProvider.database;
                        // int id = await db.insert();
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
                        _save();
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: StadiumBorder(),
                                content: Container(
                                  height: 100,
                                  // width: 200,
                                  child: Column(
                                    children: [
                                      Text(
                                          '''Number of stove = $stoveNum stove \nTotal Rent is = $sum taka '''),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: FlatButton(
                                          shape: StadiumBorder(),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Okey',
                                            style:
                                                TextStyle(color: Colors.amber),
                                          ),
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
                  RaisedButton(
                    child: Text('Read Data'),
                    onPressed: () {
                      _read();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _read() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    double rowID = 1;
    Data data = await helper.queryWord(rowID);
    if (data == null) {
      print('read row $rowID: empty');
    } else {
      print('read row $rowID: ${data.rent} ${data.total}');
    }
  }

  _save() async {
    //insert

    Data data = Data();
    data.rent = rent;
    data.total = sum;
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insert(data);
    print("inserted row:$id");
  }

  // ignore: non_constant_identifier_names

}

//ToDo current bill value per unit taka or full value
//todo save data monthly
//todo Add calender for save data
