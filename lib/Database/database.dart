import 'package:ghorvara/Database/data.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

// final String DATETIME = "datatime";
final String Tablewords = 'words';
final String COLUMN_ID = "id";
final String COLUMN_RENT = "houseRent";
final String COLUMN_ELECTRICITY = "current";
final String COLUMN_GAS = "gas";
final String COLUMN_WATER = "water";
final String COLUMN_TOTAL = "total";

class Data {
  int id;
  double rent, gas, current, water;
  double total;

  Data({this.id, this.rent, this.gas, this.current, this.water, this.total});

  Data.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    rent = map[COLUMN_RENT];
    current = map[COLUMN_ELECTRICITY];
    gas = map[COLUMN_GAS];
    water = map[COLUMN_WATER];
    total = map[COLUMN_TOTAL];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_RENT: rent,
      COLUMN_TOTAL: total,
      COLUMN_ELECTRICITY: current,
      COLUMN_GAS: gas,
      COLUMN_WATER: water
    };
    if (id != null) {
      map[COLUMN_ID] = id;
    }
    return map;
  }
}

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $Tablewords (
        $COLUMN_ID INTEGER PRIMARY KEY,
        $COLUMN_RENT DOUBLE NOT NULL,
        $COLUMN_ELECTRICITY DOUBLE NOT NULL,
        $COLUMN_GAS DOUBLE NOT NULL,
        $COLUMN_WATER DOUBLE NOT NULL,
        $COLUMN_TOTAL DOUBLE NOT NULL
      )''');
  }

  Future<int> insert(Data data) async {
    Database db = await database;
    int id = await db.insert(Tablewords, data.toMap());
    return id;
  }

  Future<Data> queryWord(double id) async {
    Database db = await database;
    List<Map> maps = await db.query(Tablewords,
        columns: [
          COLUMN_ID,
          COLUMN_RENT,
          COLUMN_ELECTRICITY,
          COLUMN_GAS,
          COLUMN_WATER,
          COLUMN_TOTAL
        ],
        where: '$COLUMN_ID = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Data.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Data>> queryAllWords() async {
    Database db = await database;
    List<Map> maps = await db.query(Tablewords);
    if (maps.length > 0) {
      List<Data> words = [];
      maps.forEach((map) => words.add(Data.fromMap(map)));
      return words;
    }
    return null;
  }

  Future<List<Data>> datas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(Tablewords);
    return List.generate(maps.length, (i) {
      return Data(
          id: maps[i][COLUMN_ID],
          rent: maps[i][COLUMN_RENT],
          gas: maps[i][COLUMN_GAS],
          current: maps[i][COLUMN_ELECTRICITY],
          water: maps[i][COLUMN_WATER],
          total: maps[i][COLUMN_TOTAL]);
    });
  }
}

// class DatabaseProvider {

//   // static var instance;

//   DatabaseProvider._();
//   static final DatabaseProvider db = DatabaseProvider._();

//   Database _database;
//   Future<Database> get database async {
//     print("database getter called");
//     if (_database != null) {
//       return _database;
//     }
//     _database = await createDatabase();
//     return _database;
//   }

//   Future<Database> createDatabase() async {
//     String dbPath = await getDatabasesPath();
//     return await openDatabase(
//       join(dbPath, 'demo.db'),
//       version: 1,
//       onCreate: (Database database, int version) async {
//         print("Creating my table");

//         await database.execute(
//           "CREATE TABLE $DATETIME ("
//           "$COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,"
//           "$COLUMN_RENT TEXT"
//           "$COLUMN_ELECTRICITY INTEGER,"
//           "$COLUMN_GAS INTEGER,"
//           "$COLUMN_WATER INTEGER,"
//           "$COLUMN_TOTAL INTEGER"
//           ")",
//         );
//       },
//     );
//   }

//   Future<List<Data>> getData() async {
//     final db = await database;
//     var data = await db.query(DATETIME, columns: [
//       COLUMN_ID,
//       COLUMN_RENT,
//       COLUMN_ELECTRICITY,
//       COLUMN_GAS,
//       COLUMN_WATER,
//       COLUMN_TOTAL
//     ]);
//     List<Data> dataList = [];
//     data.forEach((element) {
//       Data data = Data.fromMap(element);
//       dataList.add(data);
//     });
//     return dataList;
//   }

//   Future<Data> insert(Data data) async {
//     final db = await database;
//     data.id = await db.insert(DATETIME, data.toMap());
//     return data;
//   }
// }
