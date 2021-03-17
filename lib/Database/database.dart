import 'package:ghorvara/data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String DATETIME = "datatime";
  static const String COLUMN_ID = "id";
  static const String COLUMN_RENT = "houseRent";
  static const String COLUMN_ELECTRICITY = "electricity";
  static const String COLUMN_GAS = "gas";
  static const String COLUMN_WATER = "water";
  static const String COLUMN_TOTAL = "total";

  static var instance;

  // DatabaseProvider._();
  // static final DatabaseProvider db = DatabaseProvider._();

  Database _database;
  Future<Database> get database async {
    print("database getter called");
    if (_database != null) {
      return _database;
    }
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'demo.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        print("Creating my table");

        await database.execute(
          "CREATE TABLE $DATETIME ("
          "$COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,"
          "$COLUMN_RENT TEXT"
          "$COLUMN_ELECTRICITY INTEGER,"
          "$COLUMN_GAS INTEGER,"
          "$COLUMN_WATER INTEGER,"
          "$COLUMN_TOTAL INTEGER"
          ")",
        );
      },
    );
  }

  Future<List<Data>> getData() async {
    final db = await database;
    var data = await db.query(DATETIME, columns: [
      COLUMN_ID,
      COLUMN_RENT,
      COLUMN_ELECTRICITY,
      COLUMN_GAS,
      COLUMN_WATER,
      COLUMN_TOTAL
    ]);
    List<Data> dataList = [];
    data.forEach((element) {
      Data data = Data.fromMap(element);
      dataList.add(data);
    });
    return dataList;
  }

  Future<Data> insert(Data data) async {
    final db = await database;
    data.id = await db.insert(DATETIME, data.toMap());
    return data;
  }
}
