import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/todo_model.dart';

class DbHelper {
  DbHelper._();

  Database? db;
  static final DbHelper dbHelper = DbHelper._();

  initDB() async {
    String directoryPath = await getDatabasesPath();
    String path = join(directoryPath, "rv.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        String query =
            "CREATE TABLE IF NOT EXISTS todo(todo_id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT NOT NULL, todo_des TEXT NOT NULL, fev BOOLEAN)";

        await db.execute(query);
      },
    );
  }

  //TODO:insert
  insertTodo({required ToDoModel data}) async {
    if (db == null) {
      await initDB();
    }
    String query =
        "INSERT INTO todo(todo_title, todo_des, fev) VALUES(?,?,?);";
    List args = [data.todo_title, data.todo_des, data.fev];
    int? id = await db?.rawInsert(query, args);
    return id!;
  }

  //select all records
  Future<List<ToDoModel?>> fetchTodosFromDb() async {
    if (db == null) {
      await initDB();
    }
    String query = "SELECT * FROM todo";

    List<Map<String, dynamic>> responseList = await db!.rawQuery(query);
    print("List:::" + responseList.toString());
    List<ToDoModel> allCategories=[];
    try{
       allCategories =
      responseList.map((e) => ToDoModel.fromMap(e)).toList();
    }catch(e){
      print("Error..:"+e.toString());
    }

    print("List:::1" + allCategories.toString());
    return allCategories;
  }

  //select favorite records
  Future<List<ToDoModel?>> fetchFavTodo() async {
    if (db == null) {
      await initDB();
    }
    String query = "SELECT * FROM todo WHERE fev=1";

    List<Map<String, dynamic>> responseList = await db!.rawQuery(query);
    print("List:::" + responseList.toString());
    List<ToDoModel> allCategories=[];
    try{
       allCategories =
      responseList.map((e) => ToDoModel.fromMap(e)).toList();
    }catch(e){
      print("Error..:"+e.toString());
    }

    print("List:::1" + allCategories.toString());
    return allCategories;
  }

  //TODO:Update
  Future<void> updateFavTODO(int todoId,int favValue) async {
    if (db == null) {
      await initDB();
    }
    int id= await db!.update(
      'todo', // Table name
      {'fev': favValue}, // Column to update and its new value
      where: 'todo_id = ?', // WHERE clause
      whereArgs: [todoId], // Arguments for WHERE clause
    );

    /*String query = "UPDATE todo SET fev = '$value' WHERE todo_id = $todoId";

    int? id = await db?.rawUpdate(query);*/
  }

  //TODO:Delete
  Future<void> deleteTODO(int todoId) async {
    if (db == null) {
      await initDB();
    }
    String query = "DELETE FROM todo WHERE todo_id = $todoId";

    int? id = await db?.rawDelete(query);
  }

//Todo:Favorite
}
