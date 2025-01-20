import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_db/helper/db_helper.dart';
import 'package:todo_db/models/todo_model.dart';
import 'package:todo_db/view_models/todo_controller.dart';

import '../view_models/fav_todo_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoController = Get.put(TodoController());
  final favtTodoController = Get.put(FavTodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todo"),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "fav");
                },
                child: Icon(Icons.favorite)),
            SizedBox(
              width: 10,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, 'create');
          },
        ),
        body: Container(
          child: Obx(
                () {
              if (todoController.todos.length > 0) {
                return ListView.builder(
                  itemCount: todoController.todos.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.shade50),
                      child: ListTile(
                          title: Text("${todoController.todos[i].todo_title}"),
                          subtitle: Text("${todoController.todos[i].todo_des}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  onTap: () {
                                    _showDeleteDialog(context,
                                        todoController.todos[i].todo_id!);
                                  },
                                  child: Icon(Icons.delete)),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    if (todoController.todos[i].fev == 1) {
                                      DbHelper.dbHelper.updateFavTODO(
                                          todoController.todos[i].todo_id!, 0);
                                    } else {
                                      DbHelper.dbHelper.updateFavTODO(
                                          todoController.todos[i].todo_id!, 1);
                                    }
                                    todoController.fetchAllTodo();
                                    favtTodoController.fetchAllFavTodo();
                                  },
                                  child: Icon(Icons.favorite,
                                      color: todoController.todos[i].fev == 1
                                          ? Colors.red
                                          : Colors.grey))
                            ],
                          )),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("No data found!"),
                );
              }
            },
          ),
        ));
  }

  void _showDeleteDialog(BuildContext context, int todo_id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Record'),
          content: Text('Are you sure you want to delete this record?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              onPressed: () {
                DbHelper.dbHelper.deleteTODO(todo_id);
                todoController.fetchAllTodo();
                favtTodoController.fetchAllFavTodo();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
