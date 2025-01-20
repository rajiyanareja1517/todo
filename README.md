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
screens/
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



![Screenshot_20250120_214133](https://github.com/user-attachments/assets/88dcb5db-03b9-4d55-9f3b-698340fa4c14)
![Screenshot_20250120_214156](https://github.com/user-attachments/assets/77f3f9ff-c38c-4e96-b692-9bc2caa388aa)
![Screenshot_20250120_214215](https://github.com/user-attachments/assets/6464568a-74ed-460c-a6ee-518cc9a9f304)



## Conclusion

Again to note, this is example can appear as my code for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
