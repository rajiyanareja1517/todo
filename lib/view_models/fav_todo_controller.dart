
import 'package:get/get.dart';

import '../helper/db_helper.dart';
import '../models/todo_model.dart';

class FavTodoController extends GetxController{
  var favTodos = <ToDoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllFavTodo();
  }
  fetchAllFavTodo()async{
    try {
      List<ToDoModel?> fetchedTodos = await DbHelper.dbHelper.fetchFavTodo();
      favTodos.value = fetchedTodos.whereType<ToDoModel>().toList();

      print("too;;..${favTodos}");
    } catch (e) {
      print('Error loading todos: $e');
    }
    update();
  }
}