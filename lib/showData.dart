import 'package:flutter/material.dart';

import 'Database/database.dart';

class ShowChart extends StatefulWidget {
  ShowChart({Key key}) : super(key: key);

  @override
  _ShowChartState createState() => _ShowChartState();
}

class _ShowChartState extends State<ShowChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Chart"),
          ),
          body: Column(
            children: [Text('')],
          )),
    );
  }
}
