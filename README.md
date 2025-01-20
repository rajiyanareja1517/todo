# todo_db

A todo_db project created in flutter. todo_db supports both ios and android, clone the appropriate branches mentioned below:

* For Mobile: https://github.com/rajiyanareja1517/todo_db

Download or clone this repo by using the link below:

```
https://github.com/rajiyanareja1517/todo_db.git
```


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- assets
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- constants/
|- view_models/
|- models/
|- view//
|- main.dart
```

### view/

This directory screens all the screen of the application together in one place. A separate file is created for each type as shown in example below:

```
view/
|- CreateTodoPage.dart
|- FavoritePage.dart
|- HomePage.dart

```



### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
import 'package:flutter/material.dart';
import 'package:todo_db/view/create_todo_page.dart';
import 'package:todo_db/view/home_page.dart';
import 'view/favorite_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
       '/':(context)=>HomePage(),
        'create':(context)=>CreateTodoPage(),
        'fav':(context)=>FavoritePage(),
      },
    );
  }
}

  
```


https://github.com/user-attachments/assets/8f3ddbe5-d85b-4470-8526-7738f939f2e4


![Screenshot_20250120_214133-2](https://github.com/user-attachments/assets/c0779455-0198-4124-b469-5724eba362e5)
![Screenshot_20250120_214156-2](https://github.com/user-attachments/assets/a2c9f41d-7197-4fa0-8502-2f7efa9d1fb0)
![Screenshot_20250120_214215-2](https://github.com/user-attachments/assets/274c0611-bae1-4cc2-821e-e40fc9d3bc7a)



## Conclusion

Again to note, this is example can appear as my code for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
