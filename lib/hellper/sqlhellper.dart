import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqlhellper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'wael.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("onUpgrade =====================================");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
 CREATE TABLE 'seat' (
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
 'seatx' TEXT,    
'Varieties' TEXT,
    'amount' TEXT,
    'price' TEXT,
    'check' TEXT,
    'computer' TEXT,
    'reservation' TEXT
);

  ''');
    await db.execute('''
CREATE TABLE 'Cat' (
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'Category' TEXT,
    'price' TEXT,
    'ranking' TEXT,
    'ty' TEXT
);
      ''');
    await db.execute('''
  CREATE TABLE 'item' (
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'item' TEXT,
    'price' TEXT
);

      ''');
    await db.execute('''
 CREATE TABLE 'Worker' (
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'name' TEXT,
    'price' TEXT
);
      ''');

    await db.execute('''
CREATE TABLE 'Consumptions' (
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'consumption' TEXT,
    'price' TEXT
);

      ''');
    print(" onCreate =====================================");
  }

  Future<List<Map<String, dynamic>>> readData(String sql,
      [List<dynamic>? arguments]) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery(sql, arguments);
    return response;
  }

  Future<int> insertData(String sql, List<dynamic> arguments) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql, arguments);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
/*
 اضافة البيانات بصورة عامة لكل الجداول 
*/

  Future<int> addData(dynamic data, String table) async {
    Database? mydb = await db;
    return await mydb!.insert(table, data.toMap());
  }
/*
الدالة بتستخدم لعرض البيانات
بناء علي شرط
او عرض مباشر
 var x = await sqlhellper.getDataWithSorting("Cat", "id",
                        whereClause: "id =?", additionalArgs: ['1']);
*/

  Future<List<Map<String, dynamic>>> getDataWithSorting(
    String table,
    String columnToOrderBy, {
    String? whereClause,
    List<dynamic>? additionalArgs, // Additional parameter
  }) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> results;

    if (whereClause != null) {
      results = await mydb!.query(
        table,
        orderBy: columnToOrderBy,
        where: whereClause,
        whereArgs: additionalArgs,
      );
    } else {
      results = await mydb!.query(table, orderBy: columnToOrderBy);
    }

    return results.isNotEmpty ? results : [];
  }
/*
    String table = 'Cat';
                    String columnToOrderBy = 'id';
                    List<String> searchColumns = ['id'];
                    List<String> searchTerms = ['1'];
                    var x = await sqlhellper.searchWithMultipleConditions(
                        table,
                        columnToOrderBy,
                        searchColumns,
                        searchTerms);
دالة تستخدم للبحث 
*/

  Future<List<Map<String, dynamic>>> searchWithMultipleConditions(
    String table,
    String columnToOrderBy,
    List<String> searchColumns,
    List<String> searchTerms,
  ) async {
    if (searchColumns.length != searchTerms.length) {
      throw Exception('عدد أعمدة البحث يجب أن يكون متساويًا مع عدد شروط البحث');
    }

    Database? mydb = await db;
    List<Map<String, dynamic>> results;

    String query = 'SELECT * FROM $table WHERE 1 = 1';
    List<String> conditions = [];

    for (var i = 0; i < searchColumns.length; i++) {
      conditions.add('${searchColumns[i]} LIKE ?');
    }

    String conditionString = conditions.join(' AND ');
    query += ' OR ($conditionString)';

    results = await mydb!.rawQuery(
      query,
      searchTerms.map((term) => '%$term%').toList(),
    );

    return results.isNotEmpty ? results : [];
  }
/*
عمل حذف
*/

  Future<int> removeEntry(String table, int id) async {
    Database? mydb = await db;
    if (mydb == null) {
      throw Exception('Unable to get database instance.');
    }

    return await mydb.delete(table, where: 'id = ?', whereArgs: [id]);
  }
/*
  هذا هو تعليق متعدد الأسطر.
*/

  Future<int> updateSQL(String table, dynamic dataModel) async {
    Database? mydb = await db;
    if (mydb == null) {
      throw Exception('Unable to get database instance.');
    }

    Map<String, dynamic> data =
        dataModel.toMap(); // يجب أن يتوافق النموذج مع toMap()

    return await mydb
        .update(table, data, where: 'id = ?', whereArgs: [data['id']]);
  }

/*
  هذا هو تعليق متعدد الأسطر.
*/
  Future<void> deleteAllData() async {
    Database? mydb = await db;
    List<Map<String, dynamic>> tables = await mydb!
        .rawQuery("SELECT name FROM sqlite_master WHERE type='table';");
    print('Test point 1 ::=> tables');
    for (Map<String, dynamic> table in tables) {
      String tableName = table['name'];
      if (tableName != 'android_metadata' && tableName != 'sqlite_sequence') {
        await mydb!.rawDelete('DELETE FROM $tableName');
      }
    }
  }
/*
  هذا هو تعليق متعدد الأسطر.
*/

  Future<List<Map<String, dynamic>>> executeQuery(String query,
      [List<dynamic>? params]) async {
    Database? mydb = await db;
    if (params != null && params.isNotEmpty) {
      final List<Map<String, dynamic>> results =
          await mydb!.rawQuery(query, params);
      return results;
    } else {
      final List<Map<String, dynamic>> results = await mydb!.rawQuery(query);
      return results;
    }
  }

// SELECT
// DELETE
// UPDATE
// INSERT
}
