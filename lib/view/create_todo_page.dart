import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_db/helper/db_helper.dart';
import 'package:todo_db/models/todo_model.dart';
import 'package:todo_db/view_models/todo_controller.dart';

import '../view_models/fav_todo_controller.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  final TodoController todoController = Get.find();
  final FavTodoController favtTodoController = Get.find();
  var titleTextCon = TextEditingController();
  var desTextCon = TextEditingController();
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create TODO"),
        actions: [
          InkWell(
              onTap: () {
                fav = !fav;
                setState(() {});
              },
              child: Icon(
                Icons.favorite,
                color: fav ? Colors.red : Colors.grey,
              )),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              maxLines: 1,
              controller: titleTextCon,
              decoration: InputDecoration(
                  hintText: "Title",
                  label: Text("Title"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 27,
            ),
            TextField(
              maxLines: 5,
              controller: desTextCon,
              decoration: InputDecoration(
                  hintText: "Description",
                  label: Text("Description"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                ToDoModel model = ToDoModel(
                    todo_title: titleTextCon.text.toString(),
                    todo_des: desTextCon.text.toString(),
                    fev: fav ? 1 : 0);
                int id = await DbHelper.dbHelper.insertTodo(data: model);
                if (id != 0) {
                  titleTextCon.clear();
                  desTextCon.clear();
                  fav = false;
                  setState(() {});
                  todoController.fetchAllTodo();
                  favtTodoController.fetchAllFavTodo();
                 ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text("Todo save Successfully!",style: TextStyle(color: Colors.white),),
                     backgroundColor: Colors.green,
                     duration: Duration(seconds: 2),)
                 );
                }
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.only(left: 50, right: 50)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
            )
          ],
        ),
      ),
    );
  }
}
