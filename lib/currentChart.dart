import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

bool currentValue1 = false;
bool currentValue2 = false;

bool validateUnitPrice = false;
bool validateCurrent = false;

final currentBillController = TextEditingController();
final unitPriceController = TextEditingController(text: '0');

class CurrentChart extends StatefulWidget {
  CurrentChart({Key key}) : super(key: key);

  @override
  _CurrentChartState createState() => _CurrentChartState();
}

class _CurrentChartState extends State<CurrentChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Current Bill"),
              Checkbox(
                  value: currentValue1,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    setState(() {
                      currentValue1 = val;
                      if (currentValue1 == true) {
                        // currentUnit = 5.50;
                        currentValue2 = false;
                        // stoveNum = 1;
                      }
                    });
                  }),
              Text("In units"),
              Checkbox(
                  value: currentValue2,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    setState(() {
                      currentValue2 = val;
                      if (currentValue2 = true) {
                        currentValue1 = false;
                        // print("Currentunit = 0");
                        // stoveNum = 1;
                      }
                    });
                  }),
              Text("In Taka"),
            ],
          ),
          if (currentValue1 == true)
            Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: unitPriceController,
                  decoration: InputDecoration(
                    labelText: "Per unit price",
                    prefixIcon: Icon(Icons.directions),
                    errorText: validateUnitPrice ? "Can't be Empty" : null,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
              ],
            ),
          TextFormField(
            controller: currentBillController,
            decoration: InputDecoration(
                labelText: "Current bill (in unit)",
                errorText: validateCurrent ? "Can't be Empty" : null,
                prefixIcon: Icon(MdiIcons.flash)),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
