import 'package:flutter/material.dart';
import 'package:ghorvara/Database/database.dart';
import 'package:ghorvara/chart.dart';
import 'package:ghorvara/data.dart';

class ShowDataList extends StatefulWidget {
  ShowDataList({Key key}) : super(key: key);

  @override
  _ShowDataListState createState() => _ShowDataListState();
}

// Future<List<Data>> datas;
// Data currentData;

class _ShowDataListState extends State<ShowDataList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text("${datas[index].id}"),
              title: Text("${datas[index].rent}"),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: datas.length,
        ),
      ),
    );
  }
}
