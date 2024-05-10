import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/2_sqlite_database/db_helper/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Respository{

  late DataBaseConnection _dataBaseConnection;

  Respository(){
    _dataBaseConnection = DataBaseConnection();
  }

  static Database ? _database;

  Future<Database?>get database async{
    if(_database != null){
      return _database;
    }else{
      _database = await _dataBaseConnection.setDatabase();
      return _database;
    }
  }

  /// save data
  insertData(table,data) async{
    var connection = await database;
    return await connection?.insert(table,data);
  }
  ///read data
  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }
  ///read data by id
  readDataById(table,itemId) async {
    var connection = await database;
    return await connection?.query(table,where: "id=?",whereArgs: [itemId]);
  }
  ///update data
  updateData(table,data) async {
    var connection = await database;
    return await connection?.update(table,data,where: "id=?",whereArgs: [data['id']]);
  }
  ///delete data by id
  deleteDataById(table,itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }
}