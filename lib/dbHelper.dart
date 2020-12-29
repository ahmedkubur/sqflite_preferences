// Copy Rights Created by A.I.KUBUR

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// change the name of the class [DatabaseHelper] to something you like
// make this a singleton class
class DatabaseHelper {
  static final _databaseVersion = 1;
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

// only have a single app-wide reference to the database
  static Database database;

// this opens the database (Or creates it if it doesn't not exist)
  initDatabase(dbName, type) async {
    String databaseName = dbName;
    String dataType = type;
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$dbName.db");
    database = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${databaseName}1 (${databaseName}_key INTEGER, $databaseName $dataType)');
    });
    print("initiated  database $dbName");
  }

// will insert new int value to the column or update the column.
  Future<dynamic> setBool(tableName, bool boolValue) async {
    int value;
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$tableName.db");
    Database _database = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${tableName}1 (${tableName}_key INTEGER, $tableName INTEGER)');
    });
    Database db = _database;
    var getValue;

    if (boolValue == true) {
      value = 1;
      getValue = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM ${tableName}1'));

      if (getValue == 0) {
        print("data will be inserted");
        return await db.transaction((txn) async {
          return await txn.rawInsert(
              'INSERT INTO ${tableName}1(${tableName}_key, $tableName) VALUES(?, ?)',
              [1, value]);
        });
      } else {
        print("data will be updated");
        return await db.rawUpdate(
            'UPDATE ${tableName}1 SET ${tableName}_key = ?, $tableName = ?',
            [1, value]);
      }
    } else {
      value = 0;

      getValue = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM ${tableName}1'));

      if (getValue == 0) {
        print("data will be inserted");
        return await db.transaction((txn) async {
          return await txn.rawInsert(
              'INSERT INTO ${tableName}1(${tableName}_key, $tableName) VALUES(?, ?)',
              [1, value]);
        });
      } else {
        print("data will be updated");
        return await db.rawUpdate(
            'UPDATE ${tableName}1 SET ${tableName}_key = ?, $tableName = ?',
            [1, value]);
      }
    }
  }

// will insert new int value to the column or update the column.
  Future<dynamic> setInt(tableName, int value) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$tableName.db");
    Database _database = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${tableName}1 (${tableName}_key INTEGER, $tableName INTEGER)');
    });
    Database db = _database;
    var getValue;

    getValue = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${tableName}1'));

    if (getValue == 0) {
      print("data will be inserted");
      return await db.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO ${tableName}1(${tableName}_key, $tableName) VALUES(?, ?)',
            [1, value]);
      });
    } else {
      print("data will be updated");
      return await db.rawUpdate(
          'UPDATE ${tableName}1 SET ${tableName}_key = ?, $tableName = ?',
          [1, value]);
    }
  }

// will insert new double value to the column or update the column.
  Future<dynamic> setReal(tableName, double value) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$tableName.db");
    Database _database = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${tableName}1 (${tableName}_key INTEGER, $tableName REAL)');
    });
    Database db = _database;
    var getValue;
    getValue = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${tableName}1'));
    if (getValue == 0) {
      print("data will be inserted");
      return await db.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO ${tableName}1(${tableName}_key, $tableName) VALUES(?, ?)',
            [1, value]);
      });
    } else {
      print("data will be updated");
      return await db.rawUpdate(
          'UPDATE ${tableName}1 SET ${tableName}_key = ?, $tableName = ?',
          [1, value]);
    }
  }

// will insert new double value to the column or update the column.
  Future<dynamic> setBlob(tableName, dynamic value) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$tableName.db");
    Database _database = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${tableName}1 (${tableName}_key INTEGER, $tableName BLOB)');
    });
    Database db = _database;
    var getValue;

    getValue = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${tableName}1'));

    if (getValue == 0) {
      print("data will be inserted");
      return await db.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO ${tableName}1(${tableName}_key, $tableName) VALUES(?, ?)',
            [1, value]);
      });
    } else {
      print("data will be updated");
      return await db.rawUpdate(
          'UPDATE ${tableName}1 SET ${tableName}_key = ?, $tableName = ?',
          [1, value]);
    }
  }

// will insert new int value to the column or update the column.
  Future<dynamic> setString(dbName, String value) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$dbName.db");
    Database _database = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${dbName}1 (${dbName}_key INTEGER, $dbName TEXT)');
    });
    Database db = _database;

    var getValue;

    getValue = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${dbName}1'));

    if (getValue == 0) {
      print("data will be inserted");
      return await db.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO ${dbName}1(${dbName}_key, $dbName) VALUES(?, ?)',
            [1, value]);
      });
    } else {
      print("data will be updated");
      return await db.rawUpdate(
          'UPDATE ${dbName}1 SET ${dbName}_key = ?, $dbName = ?', [1, value]);
    }
  }

// will return the value of the bool
  Future<dynamic> getBool(dbName) async {
    dynamic stringValue;
    bool boolValue;
    List<Map<String, dynamic>> allRows = [{}];
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$dbName.db");
    Database _database = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${dbName}1 (${dbName}_key INTEGER, $dbName INTEGER)');
    });
    Database db = _database;
    var getValue;

    getValue = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${dbName}1'));
    try {
      allRows = await db.query(dbName + '1');
      stringValue = allRows[getValue - 1][dbName];
      if (stringValue == 1) {
        boolValue = true;
        print("$dbName value is $boolValue");
        return boolValue;
      } else {
        boolValue = false;
        print("$dbName value is $boolValue");
        return boolValue;
      }
    } catch (exception) {
      print("no data was found in $dbName");
      return null;
    }
  }

// will return the value of the int
  Future<dynamic> getInt(dbName) async {
    dynamic intValue;
    List<Map<String, dynamic>> allRows = [{}];
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$dbName.db");
    Database _database = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${dbName}1 (${dbName}_key INTEGER, $dbName INTEGER)');
    });
    Database db = _database;
    var getValue;

    getValue = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${dbName}1'));
    try {
      allRows = await db.query(dbName + '1');
      intValue = allRows[getValue - 1][dbName];
      print("$dbName value is $intValue");
      return intValue;
    } catch (exception) {
      print("no data was found in $dbName");
      return null;
    }
  }

// will return the value of the double
  Future<dynamic> getReal(dbName) async {
    dynamic intValue;
    List<Map<String, dynamic>> allRows = [{}];
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$dbName.db");
    Database _database = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${dbName}1 (${dbName}_key INTEGER, $dbName REAL)');
    });
    Database db = _database;
    var getValue;

    getValue = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${dbName}1'));
    try {
      allRows = await db.query(dbName + '1');
      intValue = allRows[getValue - 1][dbName];
      print("$dbName value is $intValue");
      return intValue;
    } catch (exception) {
      print("no data was found in $dbName");
      return null;
    }
  }

// will return the value of the blob
  Future<dynamic> getBlob(dbName) async {
    dynamic intValue;
    List<Map<String, dynamic>> allRows = [{}];
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$dbName.db");
    Database _database = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${dbName}1 (${dbName}_key INTEGER, $dbName BLOB)');
    });
    Database db = _database;
    var getValue;

    getValue = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${dbName}1'));
    try {
      allRows = await db.query(dbName + '1');
      intValue = allRows[getValue - 1][dbName];
      print("$dbName value is $intValue");
      return intValue;
    } catch (exception) {
      print("no data was found in $dbName");
      return null;
    }
  }

// will return the value of the String
  Future<dynamic> getString(dbName) async {
    dynamic stringValue;
    List<Map<String, dynamic>> allRows = [{}];
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$dbName.db");
    Database _database = await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${dbName}1 (${dbName}_key INTEGER, $dbName TEXT)');
    });
    Database db = _database;
    var getValue;

    getValue = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${dbName}1'));
    try {
      allRows = await db.query(dbName + '1');
      stringValue = allRows[getValue - 1][dbName];
      print("$dbName value is $stringValue");
      return stringValue;
    } catch (exception) {
      print("no data was found in $dbName");
      return null;
    }
  }

// All of the methods (insert, query, update, delete) can also be done using
// raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount(dbName) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$dbName.db");
    Database _database = await openDatabase(path, version: _databaseVersion);
    Database db = _database;
    try {
      var count = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM ${dbName}1'));
      print("number of raws is: $count");
      return count;
    } catch (exception) {
      print('there are no rows created');
      return null;
    }
  }

// Deletes the column specified by the name and value
  Future<int> delete(dbName) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "$dbName.db");
    Database _database = await openDatabase(path, version: _databaseVersion);
    Database db = _database;
    try {
      print("data will be deleted");
      return await db
          .delete(dbName + '1', where: '${dbName}_key = ?', whereArgs: [1]);
    } catch (exception) {
      print('no data where found');
      return null;
    }
  }
}

// How to use

//import 'package:sqflite_preferences/sqflite_preferences.dart';

// reference to our single class that manages the database
// final dbHelper = DatabaseHelper.instance;

//to initiate your database
//  initDatabase() async {
// dbHelper.initDatabase('phoneNumber', 'INTEGER');
//  }

// to add new or update bool value by key and value
// setBoolValue()async{
//    await dbHelper.setBool('flag',true);
// }

// to get bool value by key
// bool boolValue;
// getBoolValue() async {
//      boolValue = await dbHelper.getBool('flag');
// }

// to add new or update int value by key and value
// setIntValue()async{
//    await dbHelper.setInt('number',1);
// }

// to get int value by key
// int intValue;
// getIntValue()async{
//      intValue = await dbHelper.getInt('number');
// }

// to add new or update real value by key and value
//
// setIntValue()async{
//    await dbHelper.setReal('real',1.555);
// }

// to get real by key
// int intValue;
// getIntValue()async{
//      intValue = await dbHelper.getReal('real');
// }

// to add new or update blob value by key and value
// dynamic response = await get(url);
// dynamic bytesFromPict = response.image.bodyBytes;
// setBlobValue() async {
//   await dbHelper.setBlob('pic',bytesFromPic);
// }

// to get blob value by key
// dynamic blobValue;
// getBlobValue() async {
//      blobValue = await dbHelper.getBlob('pic');
// }
// Example : Image.memory(blobValue),

// to add new or update String value by key and value
// setStringValue() async {
//   await dbHelper.setString('name','someone name');
// }

// to get String value by key
// String stringValue;
// getStringValue() async {
//      stringValue = await dbHelper.getString('name');
// }

// to get the number of raws by key
// rowCount() async {
//    await dbHelper.queryRowCount('name');
// }

// to delete a saved data permenatly by key
// deleteValue() async {
//    await dbHelper.delete('name');
// }
// Copy Rights Created by A.I.KUBUR
