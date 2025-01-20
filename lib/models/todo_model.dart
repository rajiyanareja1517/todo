class ToDoModel{
int? todo_id;
String? todo_title;
String? todo_des;
int fev=0;

ToDoModel({this.todo_id,required this.todo_title,required this.todo_des,required this.fev});

factory ToDoModel.fromMap(Map data) {
  return ToDoModel(todo_id: data['todo_id'],todo_title:  data['todo_title'], todo_des: data['todo_des'], fev: data['fev']);
}

}