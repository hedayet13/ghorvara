// import 'dart:core';
// import 'package:ghorvara/Database/database.dart';

// class Data {
//   int id;
//   int rent;
//   int gas;
//   int water;
//   int electricity;
//   int total;

//   Data(
//       {this.id, this.rent, this.gas, this.electricity, this.water, this.total});

//   Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{
//       COLUMN_RENT: rent,
//       COLUMN_ELECTRICITY: electricity,
//       COLUMN_GAS: gas,
//       COLUMN_WATER: water,
//       COLUMN_TOTAL: total
//     };

//     if (id != null) {
//       map[COLUMN_ID] = id;
//     }
//     return map;
//   }

//   Data.fromMap(Map<String, dynamic> map) {
//     id = map[COLUMN_ID];
//     rent = map[COLUMN_RENT];
//     electricity = map[COLUMN_ELECTRICITY];
//     gas = map[COLUMN_ELECTRICITY];
//     water = map[COLUMN_WATER];
//     total = map[COLUMN_TOTAL];
//   }
// }
