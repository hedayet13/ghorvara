import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

bool value1 = false;
bool value2 = false;
bool value3 = false;

var gas = 0;
var stoveNum = 0;

final gasBillController = TextEditingController(text: "0");

class GasChart extends StatefulWidget {
  GasChart({Key key}) : super(key: key);

  @override
  _GasChartState createState() => _GasChartState();
}

class _GasChartState extends State<GasChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Gas Bill: "),
              Checkbox(
                  value: value1,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    setState(() {
                      value1 = val;
                      if (value1 == true) {
                        // gas = 925;
                        value2 = false;
                        value3 = false;
                        stoveNum = 1;
                      } else {
                        // gas = 0;
                        // stoveNum = 0;
                      }
                    });
                  }),
              Icon(MdiIcons.campfire),
              Text("Single Stove"),
              Checkbox(
                  value: value2,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    setState(() {
                      value2 = val;
                      if (value2 == true) {
                        gas = 975;
                        stoveNum = 2;
                        value1 = false;
                        value3 = false;
                      }
                    });
                  }),
              Icon(MdiIcons.campfire),
              Icon(MdiIcons.campfire),
              Text("Double Stove")
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 55)),
              Checkbox(
                  value: value3,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    setState(() {
                      value3 = val;
                      if (value3 == true) {
                        value1 = false;
                        value2 = false;
                        stoveNum = 0;
                      }
                    });
                  }),
              Text("Taka only"),
              Padding(padding: EdgeInsets.only(left: 20)),
              if (value3 == true)
                Flexible(
                  child: TextFormField(
                    controller: gasBillController,
                    decoration: InputDecoration(
                        // labelText: "done",
                        // errorText: _validateGas ? "Can't be Empty" : null,
                        border: OutlineInputBorder(),
                        hintText: "Amount of taka"),
                    keyboardType: TextInputType.number,
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
