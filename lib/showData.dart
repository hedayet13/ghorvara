import 'package:flutter/material.dart';
import 'package:ghorvara/Database/database.dart';

class ShowChart extends StatefulWidget {
  ShowChart({Key key}) : super(key: key);

  @override
  _ShowChartState createState() => _ShowChartState();
}

class _ShowChartState extends State<ShowChart> {
  // var list = List();
  // Future<List> dataRead() async {
  //   DatabaseHelper helper = DatabaseHelper.instance;
  //   final words = await helper.queryAllWords();
  //   if (words != null) {
  //     words.forEach((word) {
  //       list.add([
  //         '${word.id}:  ${word.rent}  ${word.current} ${word.gas} ${word.water} ${word.total}  '
  //       ]);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Chart"),
          ),
          body: Column(
            children: [
              Text('heres'),
              RaisedButton(onPressed: () {
                dataRead();
              })
            ],
          )),
    );
  }

  dataRead() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    final words = await helper.datas();
    if (words != null) {
      words.forEach((word) {
        print(word);
      });
    }
    // print(words);
  }
}
