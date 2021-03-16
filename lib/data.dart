import 'dart:core';

import 'package:ghorvara/Database/database.dart';

class Data {
  int id;
  int rent;
  int gas;
  int water;
  int electricity;
  int total;

  Data(
      {this.id, this.rent, this.gas, this.electricity, this.water, this.total});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_RENT: rent,
      DatabaseProvider.COLUMN_ELECTRICITY: electricity,
      DatabaseProvider.COLUMN_GAS: gas,
      DatabaseProvider.COLUMN_WATER: water,
      DatabaseProvider.COLUMN_TOTAL: total
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }
    return map;
  }

  Data.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    rent = map[DatabaseProvider.COLUMN_RENT];
    electricity = map[DatabaseProvider.COLUMN_ELECTRICITY];
    gas = map[DatabaseProvider.COLUMN_ELECTRICITY];
    water = map[DatabaseProvider.COLUMN_WATER];
    total = map[DatabaseProvider.COLUMN_TOTAL];
  }
}
