import 'package:bmi/domain/BmiEntry.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BmiRepository {
  static final BmiRepository instance = BmiRepository._init();
  static Database? _database;

  BmiRepository._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('bmi_database.db');
    return _database!;
}

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join (dbPath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('CREATE TABLE bmiEntries(id INTEGER PRIMARY KEY AUTOINCREMENT,user TEXT, value DOUBLE, date TEXT)');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<void> insertBmiEntry(BmiEntry bmiEntry) async {
    final db = await instance.database;
    await db.insert('bmiEntries', bmiEntry.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<BmiEntry>> allBmiEntries() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('bmiEntries');

    return List.generate(maps.length, (i) {
      return BmiEntry(
          id: maps[i]['id'],
          user: maps[i]['user'],
          value: maps[i]['value'],
          date: maps[i]['date']
      );
    });
  }

  Future<List<BmiEntry>> bmiEntriesForUser(String user) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
    'bmiEntries',
    where: 'user = ?',
      whereArgs: [user],
    );
    return List.generate(maps.length, (i) {
      return BmiEntry(
          id: maps[i]['id'],
          user: maps[i]['user'],
          value: maps[i]['value'],
          date: maps[i]['date']
      );
    });
  }

  Future<void> deleteAllBmiEntries() async {
    final db = await instance.database;
    await db.delete('bmiEntries');
  }

  Future<void> deleteUserBmiEntries(String user) async {
    final db = await instance.database;
    await db.delete(
      'bmiEntries',
    where: 'user = ?',
    whereArgs: [user]
    );
  }

  Future<int> getNextEntryId() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'bmiEntries'
    );
    var list =  List.generate(maps.length, (i) {
      return BmiEntry(
          id: maps[i]['id'],
          user: maps[i]['user'],
          value: maps[i]['value'],
          date: maps[i]['date']
      );
    });
    if(list.isEmpty){
      return 1;
    }
    else {
      return (list.last.id+1);
    }

}


}

