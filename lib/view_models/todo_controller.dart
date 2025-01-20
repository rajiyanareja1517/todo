import 'package:get/get.dart';
import 'package:todo_db/helper/db_helper.dart';
import 'package:todo_db/models/todo_model.dart';


class TodoController extends GetxController {

  var todos = <ToDoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllTodo();
  }


  fetchAllTodo() async {
    try {
      List<ToDoModel?> fetchedTodos = await DbHelper.dbHelper
          .fetchTodosFromDb();
      todos.value = fetchedTodos.whereType<ToDoModel>().toList();

      print("too;;..${todos}");
    } catch (e) {
      print('Error loading todos: $e');
    }
    update();
  }
}