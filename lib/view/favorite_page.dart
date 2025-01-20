import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_db/helper/db_helper.dart';
import 'package:todo_db/models/todo_model.dart';

import '../view_models/fav_todo_controller.dart';
import '../view_models/todo_controller.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavTodoController favtTodoController = Get.find();
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Favorite"),),
      body: Obx(() {
        if(favtTodoController.favTodos.length>0){
          return ListView.builder(
            itemCount: favtTodoController.favTodos.length,
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.only(top: 10,right: 20,left: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.shade50
                ),
                child: ListTile(
                  title:Text("${favtTodoController.favTodos[i].todo_title}"),
                  subtitle: Text("${favtTodoController.favTodos[i].todo_des}"),
                  trailing: InkWell(onTap: () {
                    DbHelper.dbHelper.updateFavTODO(favtTodoController.favTodos[i].todo_id!,0);
                    favtTodoController.fetchAllFavTodo();
                    todoController.fetchAllTodo();
                  },
                      child: Icon(Icons.close)),
                ),
              );
            },);
        }else{
          return Center(
            child: Text("Data not found!"),
          );
        }
      },)
    );
  }
}
