import 'package:flutter/material.dart';
import 'package:todo_list_05flu/add/add_page.dart';
import 'package:todo_list_05flu/database/todo.dart';
import 'package:todo_list_05flu/settings/settings_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

//Выделить память
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //mock-данные
  List<Todo> todoList = [
    Todo(id: 1, title: "Записаться на курсы по flutter", isDone: true, createdAt: "01.03.2026"),
    Todo(id: 2, title: "Прочесть Война и Мир", isDone: false, createdAt: "20.04.2026"),
    Todo(id: 3, title: "Купить новый телефон", isDone: false, createdAt: "1.09.2026"),
    Todo(id: 4, title: "Посмотреть сериал Игра престолов", isDone: false, createdAt: "10.05.2026"),
    ];

  //Инициализироваться - появиться в памяти
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Home Page - initState");
  }

  //Рисует, строит отображение
  @override
  Widget build(BuildContext context) {
    print("Home Page - build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [IconButton(onPressed: _navigateToSettingsPage, icon: Icon(Icons.settings))],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final title = todoList[index].title;
            return ListTile(title: Text(title));
          }
          )
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddPage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

//Уничтожить с памяти, освободить с памяти
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Home Page - dispose");
  }

  void _navigateToAddPage() async {
   final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => AddPage()));
   if (result != null) {
    print("$result");
   } 
  }

  void _navigateToSettingsPage() async {
   Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage()));
  }
}